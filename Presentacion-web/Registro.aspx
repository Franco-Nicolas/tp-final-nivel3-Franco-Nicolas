<%@ Page Title="Registrate" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Presentacion_web.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center">
        <h3>Registrate</h3>
        <p>Ingresá tu Email y creá tu contraseña.</p>
    </div>
    <div class="row">
        <div class="col-12 col-sm-8 col-md-6 m-auto">
            <div class="card">
                <div class="card-body">
                    <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control my-3 py-2" placeholder="Email" />
                    <asp:RequiredFieldValidator ErrorMessage="Debes ingresar un email." ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="El formato de email es incorrecto. Por favor ingrese uno valido" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" Display="Dynamic" ForeColor="Red" runat="server" />
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control my-3 py-2" placeholder="Contraseña" />
                    <asp:RequiredFieldValidator ErrorMessage="Debes ingresar una contraseña." Display="Dynamic" ForeColor="Red" ControlToValidate="txtPassword" runat="server" />
                </div>
                <div class="d-flex justify-content-center mb-4">
                    <asp:Button Text="Registrarse" ID="btnRegistrarse" CssClass="btn btn-primary" OnClick="btnRegistrarse_Click" runat="server" />    
                    <a href="/" class="btn btn-link">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
