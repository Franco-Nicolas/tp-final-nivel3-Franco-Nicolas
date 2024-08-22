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
    public partial class Favoritos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Seguridad.sesionActiva(Session["usuario"]))
                {
                    FavoritoNegocio negocio = new FavoritoNegocio();
                    Usuario usuario = (Usuario)Session["usuario"];

                    List<Articulo> listaFavoritos = negocio.listarFavoritos(usuario);
                    Session.Add("listaFavoritos", listaFavoritos);

                    if (!IsPostBack)
                    {
                        repFavoritos.DataSource = listaFavoritos;
                        repFavoritos.DataBind();
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnEliminarFavorito_Click(object sender, EventArgs e)
        {
            try
            {
                FavoritoNegocio negocio = new FavoritoNegocio();

                Usuario usuario = (Usuario)Session["usuario"];
                int idArticulo = int.Parse(((Button)sender).CommandArgument);

                negocio.eliminarFavorito(usuario, idArticulo);

                repFavoritos.DataSource = negocio.listarFavoritos(usuario);
                repFavoritos.DataBind();

                //Response.Redirect(Request.RawUrl, false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}