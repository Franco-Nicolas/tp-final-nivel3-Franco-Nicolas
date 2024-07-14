<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticuloDetallado.aspx.cs" Inherits="Presentacion_web.ArticuloDetallado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            background-color: #f9f6f2;
        }
        .card-img-top {
            object-fit: contain;
            height: 360px;
            width: 100%;
            padding: 20px;
        }
        .card {
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 0.0625em 0.0625em, rgba(0, 0, 0, 0.25) 0px 0.125em 0.5em, rgba(255, 255, 255, 0.1) 0px 0px 0px 1px inset;
        }
        .card-body {
            padding: 25px;
        }
    </style>
    <div class="py-5">
        <asp:Repeater runat="server" ID="repRepetidorDetalle">
            <ItemTemplate>
                <div class="card mb-2">
                    <div class="row g-5">
                        <div class="col-md-6">
                            <img class="card-img-top mb-5 mb-md-0" src="<%#Eval("ImagenUrl") %>" alt="Imagen del articulo" onerror="this.onerror=null; this.src = 'https://www.nycourts.gov/courts/ad4/assets/Placeholder.png'" />
                        </div>
                        <div class="col-md-6 card-body">
                            <h1 class="display-5 fw-bolder"><%#Eval("Nombre") %></h1>
                            <div class="fs-5 mb-5">
                                <h3><%#Eval("Precio", "{0:c}") %></h3>
                            </div>
                            <dl class="row">
                                <dt class="col-sm-3">Código:</dt>
                                <dd class="col-sm-9"><%#Eval("Codigo") %></dd>
                                <dt class="col-sm-3">Marca:</dt>
                                <dd class="col-sm-9"><%#Eval("Marca.Descripcion") %></dd>
                                <dt class="col-sm-3">Categoría:</dt>
                                <dd class="col-sm-9"><%#Eval("Categoria.Descripcion") %></dd>
                                <dt class="col-sm-3">Descripción:</dt>
                                <dd class="col-sm-9"><%#Eval("Descripcion") %></dd>
                            </dl>
                            <div class="d-flex">
                                <a href="/" class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-75-hover">Volver</a>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
