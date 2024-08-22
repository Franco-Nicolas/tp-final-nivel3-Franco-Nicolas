<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentacion_web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .btn-close {
            padding: .7em .5em;
        }
    </style>
    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-sm-4">
                    <div class="d-flex">
                        <asp:TextBox ID="txtBuscar" placeholder="Buscar productos, marcas, categorías..." CssClass="form-control" runat="server" />
                        <div class="btn-group">
                            <asp:Button ID="btnLimpiar" runat="server" Text="" CssClass="btn btn-close" OnClick="btnLimpiar_Click" />
                            <asp:Button ID="btnBuscar" runat="server" Text="🔎" CssClass="btn btn-outline-dark" OnClick="btnBuscar_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <%if (repRepetidor.Items.Count > 0)
              {%>
                <div class="row row-cols-1 row-cols-md-3 g-4 py-5">
                <asp:Repeater ID="repRepetidor" runat="server">
                    <ItemTemplate>
                        <div class="col-sm">
                            <div class="card">
                                <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="Imagen del articulo" onerror="this.onerror=null; this.src = 'https://www.nycourts.gov/courts/ad4/assets/Placeholder.png'" />
                                <div class="card-body">
                                    <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                    <div class="badge text-bg-secondary text-wrap" style="width: 5rem;">
                                        <%#Eval("Categoria.Descripcion") %>
                                    </div>
                                    <div class="badge text-bg-secondary text-wrap" style="width: 5rem;">
                                        <%#Eval("Marca.Descripcion") %>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-around mb-5">
                                    <h3><%#Eval("Precio", "{0:c}") %></h3>
                                    <a href="ArticuloDetallado.aspx?id=<%#Eval("Id") %>" class="btn btn-primary">Ver más</a>
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="56" height="56" fill="currentColor" class="bi bi-cart-x mb-3" viewBox="0 0 16 16">
                        <path d="M7.354 5.646a.5.5 0 1 0-.708.708L7.793 7.5 6.646 8.646a.5.5 0 1 0 .708.708L8.5 8.207l1.146 1.147a.5.5 0 0 0 .708-.708L9.207 7.5l1.147-1.146a.5.5 0 0 0-.708-.708L8.5 6.793z"/>
                        <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1zm3.915 10L3.102 4h10.796l-1.313 7zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0m7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
                    </svg>
                    <h5>No se encontraron productos.</h5>
                    <p class="text-body-secondary">Por favor, intente de nuevo mas tarde.</p>
                </div>
            <%}%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
