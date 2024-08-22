<%@ Page Title="Nuevo artículo" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioArticulos.aspx.cs" Inherits="Presentacion_web.FormularioArticulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">ID:</label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Código:</label>
                <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
                <asp:RequiredFieldValidator ErrorMessage="El código es requerido." ControlToValidate="txtCodigo" ForeColor="Red" Display="Dynamic" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre:</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                <asp:RequiredFieldValidator ErrorMessage="El nombre es requerido." ControlToValidate="txtNombre" ForeColor="Red" Display="Dynamic" runat="server" />
            </div>
            <div class="mb-3">
                <label for="dllMarca" class="form-label">Marca:</label>
                <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-select" />
            </div>
            <div class="mb-3">
                <label for="dllCategoria" class="form-label">Categoría:</label>
                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select" />
            </div>
            <div class="mb-3">
                <label for="txtPrecio" class="form-label">Precio:</label>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control"/>
                <asp:RequiredFieldValidator ErrorMessage="El precio es requerido." ControlToValidate="txtPrecio" ForeColor="Red" Display="Dynamic" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Formato incorrecto. Solo números por favor." ControlToValidate="txtPrecio" ValidationExpression="^[0-9]+$" ForeColor="Red" Display="Dynamic" runat="server" />
                <asp:RangeValidator ErrorMessage="Fuera del rango permitido." Type="Double" MinimumValue="1" MaximumValue="100000000" ControlToValidate="txtPrecio" ForeColor="Red" Display="Dynamic" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" runat="server" OnClick="btnAceptar_Click" />
                <a href="ArticuloLista.aspx" class="btn btn-secondary">Cancelar</a>
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripción:</label>
                <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" MaxLength="150" CssClass="form-control" />
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtImagenUrl" class="form-label">URL Imagen:</label>
                        <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                    </div>
                    <asp:Image ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png" runat="server" ID="imgArticulo" CssClass="image" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <%if(!string.IsNullOrEmpty(txtId.Text))
                      {%>
                        <div class="mb-3">
                            <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-outline-danger" runat="server" OnClick="btnEliminar_Click" />
                        </div>
                        <%if (confirmarEliminacion)
                          {%>
                            <div class="mb-3">
                                <asp:CheckBox Text="Confirmar eliminación" runat="server" ID="chkConfirmarEliminacion" />                 
                                <asp:Button Text="Eliminar" ID="btnConfirmarEliminacion" CssClass="btn btn-danger" runat="server" OnClick="btnConfirmarEliminacion_Click" />
                            </div>
                        <%}%>
                    <%}%>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
