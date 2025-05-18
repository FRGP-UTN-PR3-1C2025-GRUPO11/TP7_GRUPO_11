using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TP7_GRUPO_11
{
    public partial class SeleccionarSucursales : System.Web.UI.Page
    {
         
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
 
            if (!IsPostBack)
            {
;
            }
        }


        protected void btn_Seleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoSeleccionar")
            {
                DataTable dt;

                if (Session["SeleccionSucursal"] == null )
                {
                    dt = new DataTable();
                    dt.Columns.Add("ID_SUCURSAL");
                    dt.Columns.Add("NOMBRE");
                    dt.Columns.Add("DESCRIPCION");
                }

                else
                {
                    dt = (DataTable)Session["SeleccionSucursal"];
                }

                string[] argumentos = e.CommandArgument.ToString().Split(',');

                string idSucursal = argumentos[0];

                bool existe = dt.AsEnumerable().Any(row => row["ID_SUCURSAL"].ToString() == idSucursal);

                if (!existe)
                {
                    DataRow dr = dt.NewRow();
                    dr["ID_SUCURSAL"] = argumentos[0];
                    dr["NOMBRE"] = argumentos[1];
                    dr["DESCRIPCION"] = argumentos[2];
                    dt.Rows.Add(dr);
                }
                
                Session["SeleccionSucursal"] = dt;

            }
            
        }

        protected void btn_buscarSucursal_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txt_buscarSucursal.Text))
            {
                SqlDataSource1.SelectCommand = "SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [URL_Imagen_Sucursal] FROM [Sucursal]";
                SqlDataSource1.SelectParameters.Clear();
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [URL_Imagen_Sucursal] FROM [Sucursal] WHERE [Id_Sucursal] = @IdSucursal";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("IdSucursal", txt_buscarSucursal.Text.Trim());
            }
            lv_Sucursales.DataBind();
            txt_buscarSucursal.Text = String.Empty;
        }



        protected void btnProvincia_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "eventoProvincia")
            {
                Session["SeleccionProvincia"] = e.CommandArgument.ToString();
                SqlDataSource1.SelectCommand = "SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [URL_Imagen_Sucursal], [DescripcionProvincia] FROM [Sucursal] INNER JOIN [Provincia] ON [Sucursal].[Id_ProvinciaSucursal] = [Provincia].[Id_Provincia] WHERE [Id_Provincia] = " + e.CommandArgument.ToString();
                SqlDataSource1.SelectParameters.Clear();
                lv_Sucursales.DataBind();
            }
        }
    }
}