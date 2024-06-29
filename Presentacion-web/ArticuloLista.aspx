<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticuloLista.aspx.cs" Inherits="Presentacion_web.ArticuloLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Lista de articulos:</h2>
    <div class="row">
        <div class="col-4">
            <div class="mb-3">
                <asp:Label Text="Buscar🔎:" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" />
            </div>
        </div>
        <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
            <div class="mb-3">
                <asp:CheckBox runat="server" Text="Filtro Avanzado" CssClass="form-check" ID="chkFiltroAvanzado" AutoPostBack="true" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" />
            </div>
        </div>
    </div>
    <%if (chkFiltroAvanzado.Checked)
        {%>
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Campo:" ID="lblCampo" runat="server" />
                <asp:DropDownList runat="server" CssClass="form-control" AutoPostBack="true" ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                    <asp:ListItem Text="Nombre" Selected="True" />
                    <asp:ListItem Text="Precio" />
                    <asp:ListItem Text="Marca" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Criterio:" ID="lblCriterio" runat="server" />
                <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Filtro:" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Button Text="Buscar" CssClass="btn btn-secondary" ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" />
                </div>
            </div>
        </div>
    </div>
    <%}%>

    <asp:GridView ID="dgvArticulos" runat="server" CssClass="table table-bordered"
        AutoGenerateColumns="false" DataKeyNames="Id"
        OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged"
        OnPageIndexChanging="dgvArticulos_PageIndexChanging" AllowPaging="true"
        PageSize="5" HeaderStyle-CssClass="table-dark" PagerStyle-HorizontalAlign="Center">
        <columns>
            <asp:BoundField HeaderText="Código" DataField="Codigo" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
            <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:C}" />
            <asp:CommandField HeaderText="Acción:" ShowSelectButton="true" SelectText="✍" ItemStyle-HorizontalAlign="Center" />
        </columns>
    </asp:GridView>
    <a href="FormularioArticulo.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
