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
                btn_BorrarListadoSucursales.Visible = true;
                DataTable dt = (DataTable)Session["SeleccionSucursal"];
                gv_ListadoSucursalesSeleccionadas.DataSource = dt;
                gv_ListadoSucursalesSeleccionadas.DataBind();
            }
            else
            {
                btn_BorrarListadoSucursales.Visible = false;
                lbl_Mensajes.Text = "No hay datos para mostrar";
            }
        }

        protected void btn_BorrarListadoSucursales_Click(object sender, EventArgs e)
        {
            btn_BorrarListadoSucursales.Visible = false;
            gv_ListadoSucursalesSeleccionadas.Visible = false;
            Session["SeleccionSucursal"] = null;
            lbl_Mensajes.Text = "Selección eliminada";
        }
    }
}