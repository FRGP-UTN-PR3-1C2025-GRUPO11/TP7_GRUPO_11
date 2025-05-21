using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TP7_GRUPO_11.Conexion;

namespace TP7_GRUPO_11
{
    public partial class SeleccionarSucursales : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lv_Sucursales.DataBind();

                Session["contador"] = 0;
            }
            
        }
        
        protected void btnSeleccion_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoSeleccionar")
            {
                
                string[] datos = e.CommandArgument.ToString().Split(';');
                string nombre = datos[0];
                string descripcion = datos[1];
                string idSucursal = datos[2];

                SeleccionSucursal.AgregarSucursal(idSucursal, nombre, descripcion);

                inhabilitarBotones();

                int contador = Convert.ToInt32(Session["contador"]);
                contador++;
                Session["contador"] = contador;

                llbContadorSeleccionados.Text = "Sucursales seleccionadas: " + contador;
            }
        }
        protected void btnBuscarSucursal_Click(object sender, EventArgs e)
        {
            string filtro = txtBoxBuscarSucursal.Text.Trim();

            if (!string.IsNullOrEmpty(filtro))
            {
                SqlDataSource1.SelectCommand = "SELECT [URL_Imagen_Sucursal], [NombreSucursal], [DescripcionSucursal], [Id_Sucursal] FROM [Sucursal] WHERE NombreSucursal LIKE '%' + @nombre + '%'";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("nombre", filtro);
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT [URL_Imagen_Sucursal], [NombreSucursal], [DescripcionSucursal], [Id_Sucursal] FROM [Sucursal]";
            }

            lv_Sucursales.DataBind();
            txtBoxBuscarSucursal.Text = string.Empty;
            
        }
        

        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "EventoBoton")
            {
                int idProvincia = Convert.ToInt32(e.CommandArgument);
                SqlDataSource1.SelectCommand = "SELECT [URL_Imagen_Sucursal], [NombreSucursal], [DescripcionSucursal], [Id_Sucursal] FROM [Sucursal] WHERE Id_ProvinciaSucursal = @id";

                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("id", idProvincia.ToString());
                lv_Sucursales.DataBind();
                
            }
        }
        protected void inhabilitarBotones()
        {
            foreach (ListViewDataItem item in lv_Sucursales.Items)
            {
                HiddenField hfIdSucursal = (HiddenField)item.FindControl("hfIdSucursal");

                if (hfIdSucursal != null && Session["Tabla"] != null)
                {
                    string idSucursal = hfIdSucursal.Value;
                    if (SeleccionSucursal.EstaSeleccionada(idSucursal))
                    {
                        Button btnSeleccionar = (Button)item.FindControl("btnSeleccion");
                        btnSeleccionar.Enabled = false;
                    }
                }
            }
        }

        protected void lv_Sucursales_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager pager = (DataPager)lv_Sucursales.FindControl("DataPager1");
            pager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }

        protected void lv_Sucursales_DataBound(object sender, EventArgs e)
        {
            inhabilitarBotones();
        }

        
    }
  
}