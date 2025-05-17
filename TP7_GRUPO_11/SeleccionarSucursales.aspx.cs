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
            if (!IsPostBack)
            {
                //GestionBDSucursales gestion = new GestionBDSucursales();
                //DataTable dt = new DataTable();
                //dt = gestion.mostrarSucursales();
                //lv_Sucursales.DataSource = dt;
                //lv_Sucursales.DataBind();
            }
        }

        Conexion conexion = new Conexion();

        protected void btn_Seleccionar_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "eventoSeleccionar")
            {
               
                lblRespuesta.Text = e.CommandArgument.ToString();

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
    }
}