<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticuloLista.aspx.cs" Inherits="Presentacion_web.ArticuloLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Lista de articulos:</h2>
            <asp:GridView ID="dgvArticulos" runat="server" CssClass="table table-bordered"
                AutoGenerateColumns="false" DataKeyNames="Id"
                OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged"
                OnPageIndexChanging="dgvArticulos_PageIndexChanging" AllowPaging="true"
                PageSize="5" HeaderStyle-CssClass="table-dark">
                <Columns>
                    <asp:BoundField HeaderText="Código" DataField="Codigo" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                    <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:C}" />
                    <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍" />
                </Columns>
            </asp:GridView>
    <a href="FormularioArticulo.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
