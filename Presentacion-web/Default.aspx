<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentacion_web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            background-color: #f9f6f2;
        }

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

        .btn-primary {
            border-radius: 50px;
            width: 120px;
        }

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
                <asp:TextBox ID="txtBuscar" placeholder="Buscar..." CssClass="form-control" runat="server" />
                <div class="btn-group">
                    <asp:Button ID="btnLimpiar" runat="server" Text="" CssClass="btn btn-close" OnClick="btnLimpiar_Click" />
                    <asp:Button ID="btnBuscar" runat="server" Text="🔎" CssClass="btn btn-outline-dark" OnClick="btnBuscar_Click" />
                </div>
            </div>
        </div>
    </div>
    
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
