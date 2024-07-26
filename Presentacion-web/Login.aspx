<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Presentacion_web.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .card {
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 0.0625em 0.0625em, rgba(0, 0, 0, 0.25) 0px 0.125em 0.5em, rgba(255, 255, 255, 0.1) 0px 0px 0px 1px inset;
        }
    </style>
    <div class="d-grid justify-content-center mb-2">
        <h3>Iniciar Sesión</h3>
    </div>
    <div class="row">
        <div class="col-12 col-sm-8 col-md-6 m-auto">
            <div class="card">
                <div class="card-body">
                    <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control my-3 py-2" placeholder="Email" />
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control my-3 py-2" placeholder="Contraseña" />
                </div>
                <div class="d-flex justify-content-center mb-4">
                    <asp:Button Text="Ingresar" ID="btnLogin" CssClass="btn btn-primary" OnClick="btnLogin_Click" runat="server" />    
                    <a href="/" class="btn btn-link">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
