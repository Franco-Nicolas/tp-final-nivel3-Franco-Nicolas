using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class FavoritoNegocio
    {
        public List<Articulo> listarFavoritos(Usuario usuario)
        {
            List<Articulo> listaFavoritos = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select IdArticulo from FAVORITOS where IdUser = @IdUser");
                datos.setearParametro("@IdUser", usuario.Id);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    int idArticulo = (int)datos.Lector["IdArticulo"];

                    ArticuloNegocio negocio = new ArticuloNegocio();
                    Articulo articulo = negocio.listar(idArticulo.ToString())[0];
                    listaFavoritos.Add(articulo);
                }
                return listaFavoritos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public bool existeFavorito(Usuario usuario, Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select COUNT(*) From FAVORITOS Where IdUser = @IdUser and IdArticulo = @IdArticulo");
                datos.setearParametro("@IdUser", usuario.Id);
                datos.setearParametro("@IdArticulo", articulo.Id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    int cont = int.Parse(datos.Lector[0].ToString());
                    return cont > 0;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void agregarFavorito(Usuario usuario, Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                if (!existeFavorito(usuario, articulo))
                {
                    datos.setearConsulta("Insert into FAVORITOS (IdUser, IdArticulo) values (@IdUser, @IdArticulo)");
                    datos.setearParametro("@IdUser", usuario.Id);
                    datos.setearParametro("@IdArticulo", articulo.Id);
                    datos.ejecutarAccion();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void eliminarFavorito(Usuario usuario, int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Delete From FAVORITOS Where IdUser = @IdUser and IdArticulo = @IdArticulo");
                datos.setearParametro("@IdUser", usuario.Id);
                datos.setearParametro("@IdArticulo", idArticulo);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
