<%@ Page Title="Favoritos" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Presentacion_web.Favoritos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .card-img-top {
            object-fit: contain;
            height: 300px;
            width: 100%;
            border-radius: 50px;
            padding: 20px;
        }

        .card {
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 0.0625em 0.0625em, rgba(0, 0, 0, 0.25) 0px 0.125em 0.5em, rgba(255, 255, 255, 0.1) 0px 0px 0px 1px inset;
        }

        .card-body {
            padding: 25px;
            margin-top: -15px;
        }

        .btn-danger {
            border-radius: 50px;
            width: 120px;
        }
    </style>
    <h2>Mis Favoritos</h2>
        
        <%if (repFavoritos.Items.Count > 0)
          {%>
            <div class="row row-cols-1 row-cols-md-3 g-4 py-5">
                <asp:Repeater ID="repFavoritos" runat="server">
                    <ItemTemplate>
                        <div class="col-sm">
                            <div class="card">
                                <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="Imagen del articulo" onerror="this.onerror=null; this.src = 'https://www.nycourts.gov/courts/ad4/assets/Placeholder.png'" />
                                <div class="card-body">
                                    <h5 class="card-title"><a href="ArticuloDetallado.aspx?id=<%#Eval("Id") %>" class="h5 text-decoration-none"><%#Eval("Nombre") %></a></h5>
                                    <div class="badge text-bg-secondary text-wrap" style="width: 5rem;">
                                        <%#Eval("Categoria.Descripcion") %>
                                    </div>
                                    <div class="badge text-bg-secondary text-wrap" style="width: 5rem;">
                                        <%#Eval("Marca.Descripcion") %>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-around mb-5">
                                    <h3><%#Eval("Precio", "{0:c}") %></h3>
                                    <asp:Button Text="Eliminar" CssClass="btn btn-danger" ID="btnEliminarFavorito" CommandArgument='<%#Eval("Id") %>' CommandName="IdArticulo" OnClick="btnEliminarFavorito_Click" runat="server" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        <%}
          else
          {%>
            <div class="text-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="56" height="56" fill="currentColor" class="bi bi-stars mb-3" viewBox="0 0 16 16">
                    <path d="M7.657 6.247c.11-.33.576-.33.686 0l.645 1.937a2.89 2.89 0 0 0 1.829 1.828l1.936.645c.33.11.33.576 0 .686l-1.937.645a2.89 2.89 0 0 0-1.828 1.829l-.645 1.936a.361.361 0 0 1-.686 0l-.645-1.937a2.89 2.89 0 0 0-1.828-1.828l-1.937-.645a.361.361 0 0 1 0-.686l1.937-.645a2.89 2.89 0 0 0 1.828-1.828zM3.794 1.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387A1.73 1.73 0 0 0 4.593 5.69l-.387 1.162a.217.217 0 0 1-.412 0L3.407 5.69A1.73 1.73 0 0 0 2.31 4.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387A1.73 1.73 0 0 0 3.407 2.31zM10.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.16 1.16 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.16 1.16 0 0 0-.732-.732L9.1 2.137a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732z"/>
                </svg>
                <h5>Aún no tenés productos favoritos</h5>
                <p class="text-body-secondary">Agregalos haciendo clic en el botón de la página de producto.</p>
            </div>
        <%}%>
    
</asp:Content>
