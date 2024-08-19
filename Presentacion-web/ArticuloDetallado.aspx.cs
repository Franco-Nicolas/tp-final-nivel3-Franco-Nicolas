using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Presentacion_web
{
    public partial class ArticuloDetallado : System.Web.UI.Page
    {
        public List<Articulo> ArticuloSeleccionado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                FavoritoNegocio favNegocio = new FavoritoNegocio();
                Usuario usuario = (Usuario)Session["usuario"];

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                ArticuloSeleccionado = negocio.listar(id);

                if (!IsPostBack)
                {
                    repRepetidorDetalle.DataSource = ArticuloSeleccionado;
                    repRepetidorDetalle.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnFavoritos_Click(object sender, EventArgs e)
        {
            FavoritoNegocio negocio = new FavoritoNegocio();
            Usuario usuario = (Usuario)Session["usuario"];
            Articulo articulo = ArticuloSeleccionado[0];
            
            if (!negocio.existeFavorito(usuario, articulo))
            {
                negocio.agregarFavorito(usuario, articulo);
                //Si se agregó, mostrar mensaje.
                lblMensaje.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
            else
            {
                //Sino mostrar otro tipo de mensaje.
                lblMensaje.Text = "<i class='bi bi-exclamation-triangle-fill'></i> Ya has agregado este artículo antes. Puedes verlo  <a href=\"Favoritos.aspx\"> aqui. </a>";
                lblMensaje.CssClass ="alert alert-warning";
                lblMensaje.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }
    }
}