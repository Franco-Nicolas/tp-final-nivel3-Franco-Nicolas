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
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                
                ArticuloNegocio negocio = new ArticuloNegocio();
                ArticuloSeleccionado = negocio.listar(id);
                
                if (!IsPostBack)
                {
                    repRepetidorDetalle.DataSource = ArticuloSeleccionado;
                    repRepetidorDetalle.DataBind();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}