<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Articulos_web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Hola llegaste a tu sitio web</h1>
    <p>Llegaste a la mejor pagina de venta de articulos</p>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <%--      <% 
            foreach (dominio.Articulo arti in ListaArticulos)
            {
        %>
        <div class="col">
            <div class="card">
                <img src="<%: arti.ImagenUrl %>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%:arti.Nombre %></h5>
                    <p class="card-text"><%:arti.Descripcion %></p>
                    <a href="Detalles.aspx?id=<%: arti.Id %>">Ver Detalles</a>
                </div>
            </div>
        </div>

        <%  }%>--%>

        <asp:Repeater runat="server" ID="repRepetidor">
            <ItemTemplate>
                <div class="col">
                    <div class="card">
                        <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                            <a href="Detalles.aspx?id=<%#Eval("Id") %>">Ver Detalles</a>
                            <asp:Button ID="btnEjemplo" runat="server" Text="Ejemplo" CssClass="btn btn-primary" CommandArgument='<%#Eval("Id")%>' CommandName="ArticuloId" OnClick ="btnEjemplo_Click" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>

        </asp:Repeater>
    </div>
</asp:Content>
