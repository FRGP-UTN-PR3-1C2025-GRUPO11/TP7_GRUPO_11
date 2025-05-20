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
            
        }

        protected void btnSeleccion_Click(object sender, EventArgs e)
        {
            
           
        }



        private DataTable CreateTabla()
        {
            DataTable dataTable = new DataTable();

            DataColumn dataColumn = new DataColumn("NombreSucursal", System.Type.GetType("System.String"));
            dataTable.Columns.Add(dataColumn);

            dataColumn = new DataColumn("DescripcionSucursal", System.Type.GetType("System.String"));
            dataTable.Columns.Add(dataColumn);

            dataColumn = new DataColumn("Id_Sucursal", System.Type.GetType("System.String"));
            dataTable.Columns.Add(dataColumn);




            return dataTable;
           
        }
        private DataTable agregarFila(DataTable dataTable,string nombreSucursal, string DescripcionSucursal, string Id_Sucursal)
        {
            DataRow dataRow = dataTable.NewRow();
            dataRow["NombreSucursal"] = nombreSucursal;
            dataRow["DescripcionSucursal"] = DescripcionSucursal;
            dataRow["Id_Sucursal"] = Id_Sucursal;
            dataTable.Rows.Add(dataRow);

            return dataTable;
        }

        protected void btnSeleccion_Command(object sender, CommandEventArgs e)
        {
            {
                if (e.CommandName == "eventoSeleccionar")
                {

                    string[] datos = e.CommandArgument.ToString().Split(';');

                    string idSucursal = datos[2];
                    string nombreSucursal = datos[0];
                    string descripcionSucursal = datos[1];

                   
                    if (Session["Tabla"] == null)
                    {
                        Session["Tabla"] = CreateTabla();
                    }

                
                    agregarFila((DataTable)Session["Tabla"], nombreSucursal, descripcionSucursal, idSucursal);

                    
                 
                    gvPrueba.DataSource = (DataTable)Session["Tabla"];
                    gvPrueba.DataBind();
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

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

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

        protected void lv_Sucursales_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}