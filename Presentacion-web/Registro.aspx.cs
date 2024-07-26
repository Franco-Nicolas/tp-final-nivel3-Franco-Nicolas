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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario user = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();
                EmailService email = new EmailService();

                user.Email = txtEmail.Text;
                user.Password = txtPassword.Text;
                user.Id = negocio.insertarNuevo(user);
                Session.Add("usuario", user);
                email.armarCorreo(user.Email, "Bienvenido/a 👋", "Hola, ya podes iniciar sesión con tu email y contraseña. Muchas gracias por registrarte!!!");
                email.enviarEmail();
                Response.Redirect("Default.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}