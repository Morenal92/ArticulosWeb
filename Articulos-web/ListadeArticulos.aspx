<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListadeArticulos.aspx.cs" Inherits="Articulos_web.ListadeArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista de Articulos</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label ID="Label1" runat="server" Text="Filtro"></asp:Label>
                <asp:TextBox ID="txtFiltro" runat="server" AutoPostBack="false" CssClass="form-control" OnTextChanged="txtFiltro_TextChanged"></asp:TextBox>
           </div>
        </div>
        <div class="mb-3">
            <asp:CheckBox ID="chkAvanzado" runat="server" text="Filtro Avanzado" 
                AutoPostBack="true" 
                OnCheckedChanged="chkAvanzado_CheckedChanged"/>

        </div>
    </div>

   <%  if(FiltroAvanzado)
    
    {%>

        <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label runat="server" Text="Campo" ID="lblCampo"/>
                        <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" id="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" >
                            <asp:ListItem Text="Nombre" />
                            <asp:ListItem Text="Marca" />
                            <asp:ListItem Text="Precio" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label  runat="server" Text="Criterio"></asp:Label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCriterio">                 
                        </asp:DropDownList>
                    </div>
                  </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label  runat="server" Text="Filtro"></asp:Label>
                        <asp:TextBox ID="txtFiltroAvanzado" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click"/>
                    </div>
                </div>
            </div>
       <% } %> 
    </div>
    <asp:GridView ID="dgvArticulos" CssClass="table" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
            <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
            <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" />
            <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="Modificar" />

        </Columns>
    </asp:GridView>
    <a href="FormularioArticulos.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
