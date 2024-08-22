<%@ Page Title="Lista de artículos" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticuloLista.aspx.cs" Inherits="Presentacion_web.ArticuloLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Lista de artículos:</h2>
    <div class="row">
        <div class="col-4">
            <div class="mb-3">
                <asp:Label Text="<i class='bi bi-search'></i> Buscar:" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" placeholder="Buscar por código, productos, marcas, categorías..." AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" />
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
                    <asp:ListItem Text="--Seleccione una opción--" Value="0"/>
                    <asp:ListItem Text="Nombre" />
                    <asp:ListItem Text="Marca" />
                    <asp:ListItem Text="Categoría" />
                    <asp:ListItem Text="Precio" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ErrorMessage="Debes seleccionar un campo a buscar." ControlToValidate="ddlCampo" InitialValue="0" Display="Dynamic" ForeColor="Red" runat="server" />
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Criterio:" ID="lblCriterio" runat="server" />
                <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ErrorMessage="Debes seleccionar el criterio a buscar." ControlToValidate="ddlCriterio" InitialValue="-1" Display="Dynamic" ForeColor="Red" runat="server" />
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Filtro:" ID="lblFiltroAvanzado" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                <asp:RegularExpressionValidator ErrorMessage="Formato invalido." ControlToValidate="txtFiltroAvanzado" ValidationExpression="^[a-zA-Z0-9\s]+$" Display="Dynamic" ForeColor="Red" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <div class="mb-3">
                    <asp:Button Text="Buscar" CssClass="btn btn-secondary" ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" />
                    <asp:Button ID="btnLimpiarFiltros" runat="server" CssClass="btn btn-close" OnClick="btnLimpiarFiltros_Click" />
                </div>
            </div>
        </div>
    </div>
    <%}%>

    <asp:GridView ID="dgvArticulos" runat="server" CssClass="table table-bordered"
        AutoGenerateColumns="false" DataKeyNames="Id"
        OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged"
        OnPageIndexChanging="dgvArticulos_PageIndexChanging" AllowPaging="true"
        PageSize="5" HeaderStyle-CssClass="table-dark" PagerStyle-HorizontalAlign="Center"
        ShowHeaderWhenEmpty="True" EmptyDataText="No se encontraron resultados."
        EmptyDataRowStyle-CssClass="text-center">
        <columns>
            <asp:BoundField HeaderText="Código" DataField="Codigo" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
            <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:C}" />
            <asp:CommandField HeaderText="Acción:" ShowSelectButton="true" SelectText="<i class='bi bi-pencil-square'></i>" ItemStyle-HorizontalAlign="Center" />
        </columns>
    </asp:GridView>
    <a href="FormularioArticulos.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
