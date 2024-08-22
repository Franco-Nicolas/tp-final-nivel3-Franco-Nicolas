using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion_web
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = Session["error"].ToString();
            if (lblError.Text == "El usuario o contraseña son incorrectos")
            {
                btnError.Text = "Intentar nuevamente";
            }
        }

        protected void btnError_Click(object sender, EventArgs e)
        {
            if (lblError.Text == "El usuario o contraseña son incorrectos" || lblError.Text == "Se requieren permisos de Administrador para acceder.")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}