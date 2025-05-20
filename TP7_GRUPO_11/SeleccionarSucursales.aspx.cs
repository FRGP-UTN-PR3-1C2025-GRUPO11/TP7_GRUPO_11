using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GRUPO_11
{
    public partial class SeleccionarSucursales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lv_Sucursales.DataBind();
                
            }
            
        }


        private DataTable CreateTabla()
        {
            DataTable dataTable = new DataTable();

            DataColumn dataColumn = new DataColumn("Id_Sucursal", System.Type.GetType("System.String"));
            dataTable.Columns.Add(dataColumn);

            dataColumn = new DataColumn("Nombre", System.Type.GetType("System.String"));
            dataTable.Columns.Add(dataColumn);

            dataColumn = new DataColumn("Descripcion", System.Type.GetType("System.String"));
            dataTable.Columns.Add(dataColumn);




            return dataTable;
           
        }
        private DataTable agregarFila(DataTable dataTable,string nombreSucursal, string DescripcionSucursal, string Id_Sucursal)
        {
            DataRow dataRow = dataTable.NewRow();
            dataRow["Id_Sucursal"] = Id_Sucursal;
            dataRow["Nombre"] = nombreSucursal;
            dataRow["Descripcion"] = DescripcionSucursal;
            dataTable.Rows.Add(dataRow);

            return dataTable;
        }

        protected void btnSeleccion_Command(object sender, CommandEventArgs e)
        {
            {
                if (e.CommandName == "eventoSeleccionar")
                {

                    string[] datos = e.CommandArgument.ToString().Split(';');

                    string idSucursal = datos[0];
                    string nombreSucursal = datos[1];
                    string descripcionSucursal = datos[2];

                   
                    if (Session["Tabla"] == null)
                    {
                        Session["Tabla"] = CreateTabla();
                    }

                
                    agregarFila((DataTable)Session["Tabla"], idSucursal, nombreSucursal, descripcionSucursal);
                    inhabilitarBotones();

                    
                 

                }
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
                    DataTable dt = (DataTable)Session["Tabla"];
                    bool existe = dt.AsEnumerable().Any(row => row["Id_Sucursal"].ToString() == idSucursal);
                    if (existe)
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