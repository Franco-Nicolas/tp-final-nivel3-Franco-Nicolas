﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Presentacion_web
{
    public partial class ArticuloLista : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requieren permisos de Administrador para acceder.");
                Response.Redirect("Error.aspx");
            }

            FiltroAvanzado = chkFiltroAvanzado.Checked;
            if (!IsPostBack || !chkFiltroAvanzado.Checked)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("listaArticulos", negocio.listar());
                dgvArticulos.DataSource = Session["listaArticulos"];
                dgvArticulos.DataBind();
            }
        }

        protected void dgvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioArticulos.aspx?id=" + id);
        }

        protected void dgvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvArticulos.DataSource = Session["listaArticulos"];
            dgvArticulos.PageIndex = e.NewPageIndex;
            dgvArticulos.DataBind();
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
            string filtro = txtFiltro.Text.ToUpper();
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(filtro) || x.Categoria.Descripcion.ToUpper().Contains(filtro) || x.Marca.Descripcion.ToUpper().Contains(filtro) || x.Codigo.ToUpper().Contains(filtro));
            dgvArticulos.DataSource = listaFiltrada;
            dgvArticulos.DataBind();
        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkFiltroAvanzado.Checked;
            txtFiltro.Enabled = !FiltroAvanzado;
        }
        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");

                lblFiltroAvanzado.Visible = true;
                txtFiltroAvanzado.Visible = true;
            }
            else if (ddlCampo.SelectedItem.ToString() == "Marca")
            {
                MarcaNegocio marcaNegocio = new MarcaNegocio();
                List<Marca> listaMarca = marcaNegocio.listar();

                ddlCriterio.DataSource = listaMarca;
                ddlCriterio.DataValueField = "Id";
                ddlCriterio.DataTextField = "Descripcion";
                ddlCriterio.DataBind();

                lblFiltroAvanzado.Visible = false;
                txtFiltroAvanzado.Visible = false;
            }
            else if (ddlCampo.SelectedItem.ToString() == "Categoría")
            {
                CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
                List<Categoria> listaCategoria = categoriaNegocio.listar();

                ddlCriterio.DataSource = listaCategoria;
                ddlCriterio.DataValueField = "Id";
                ddlCriterio.DataTextField = "Descripcion";
                ddlCriterio.DataBind();

                lblFiltroAvanzado.Visible = false;
                txtFiltroAvanzado.Visible = false;
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Empieza con");
                ddlCriterio.Items.Add("Termina con");

                lblFiltroAvanzado.Visible = true;
                txtFiltroAvanzado.Visible = true;
            }
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                ArticuloNegocio negocio = new ArticuloNegocio();

                if (ddlCampo.SelectedItem.ToString() == "Marca" || ddlCampo.SelectedItem.ToString() == "Categoría")
                {
                    dgvArticulos.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(), int.Parse(ddlCriterio.SelectedValue.ToString()));
                }
                else
                {
                    dgvArticulos.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(), ddlCriterio.SelectedItem.ToString(), txtFiltroAvanzado.Text);
                }
                    dgvArticulos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            try
            {
                ddlCriterio.Items.Clear();
                ddlCampo.SelectedIndex = 0;
                txtFiltroAvanzado.Text = "";
                lblFiltroAvanzado.Visible = true;
                txtFiltroAvanzado.Visible = true;
                dgvArticulos.DataSource = Session["listaArticulos"];
                dgvArticulos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}