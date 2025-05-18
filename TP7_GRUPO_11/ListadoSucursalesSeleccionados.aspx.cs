using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GRUPO_11
{
    public partial class ListadoSucursalesSeleccionados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SeleccionSucursal"] != null)
            {
                DataTable dt = (DataTable)Session["SeleccionSucursal"];
                gv_ListadoSucursalesSeleccionadas.DataSource = dt;
                gv_ListadoSucursalesSeleccionadas.DataBind();
            }
            else
            {
                lbl_SinDatos.Text = "No hay datos para mostrar";
            }
        }
    }
}