using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GRUPO_11
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["Tabla"] == null)
                {
                    lbl_SinDatos.Text = "No hay sucursales seleccionadas";
                }
                else
                {
                    gv_SucursalesSeleccionadas.DataSource = (DataTable)Session["Tabla"];
                    gv_SucursalesSeleccionadas.DataBind();
                }
            }
        }
    }
}