<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Presentacion_web.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Error</h3>
    <div class="row">
        <div class="col-4">
            <div class="mb-3">
                <asp:Label Text="" ID="lblError" runat="server" />
                <asp:Button Text="Regresar" ID="btnError" CssClass="btn btn-link" OnClick="btnError_Click" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
