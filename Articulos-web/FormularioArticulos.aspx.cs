using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using Negocio;

namespace Articulos_web
{
    public partial class FormularioArticulos : System.Web.UI.Page
    {
        public bool ConfirmarEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            ConfirmarEliminacion = false;
            
            
                try
                {
                //configuracion inicial de pantalla
                    if (!IsPostBack)
                    {
                        CategoriaNegocio Categorianegocio = new CategoriaNegocio();
                        List<Categoria> listacategorias = Categorianegocio.listar();
                        ddlCategoria.DataSource = listacategorias;
                        ddlCategoria.DataValueField = "Id";
                        ddlCategoria.DataTextField = "Descripcion";
                        ddlCategoria.DataBind();

                        MarcaNegocio Marcanegocio = new MarcaNegocio();
                        List<Marca> listamarcas = Marcanegocio.listar();
                        ddlMarca.DataSource = listamarcas;
                        ddlMarca.DataValueField = "Id";
                        ddlMarca.DataTextField = "Descripcion";
                        ddlMarca.DataBind();
                    }
                //configuracion si estoy modificando
                if (Request.QueryString["id"] != null && !IsPostBack)
                {
                    ArticuloNegocio negocio = new ArticuloNegocio();    
                    List<Articulo>lista = negocio.listar(Request.QueryString["id"]);
                    Articulo seleccionado = lista[0];

                    //precargar los datos
                    string Id = Request.QueryString["id"].ToString();
                    txtId.Text = Id;
                    txtCodigo.Text = seleccionado.Codigo;
                    txtNombre.Text = seleccionado.Nombre;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtImagenUrl.Text = seleccionado.ImagenUrl;
                    txtPrecio.Text = seleccionado.Precio.ToString();

                    ddlCategoria.SelectedValue=  seleccionado.Categoria.Id.ToString();
                    ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();
                    txtImagenUrl_TextChanged(sender, e);


                }
                       

                }
                catch (Exception ex)
                {
                         Session.Add("error", ex);

                         throw;
                        //redireccionar a una pantalla de error 
                        
                }
                


            
            
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Articulo nuevo = new Articulo();
                ArticuloNegocio negocio = new ArticuloNegocio();
                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre= txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.Precio = decimal.Parse(txtPrecio.Text);

                nuevo.Categoria = new Categoria();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);

                nuevo.Marca = new Marca();  
                nuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue);
                
                nuevo.ImagenUrl = txtImagenUrl.Text;
                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(Request.QueryString["id"].ToString());
                    negocio.modificarConSP(nuevo);
                }
                else
                    negocio.agregarConSP(nuevo);
                Response.Redirect("ListadeArticulos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);

                throw;
            }

        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgArticulos.ImageUrl = txtImagenUrl.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmarEliminacion = true;
        }

        protected void btnConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfimarEliminacion.Checked)
                { 
                    ArticuloNegocio negocio= new ArticuloNegocio();
                    negocio.eliminar(int.Parse(txtId.Text));
                    Response.Redirect("ListadeArticulos.aspx");
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                
            }
        }
    }
}