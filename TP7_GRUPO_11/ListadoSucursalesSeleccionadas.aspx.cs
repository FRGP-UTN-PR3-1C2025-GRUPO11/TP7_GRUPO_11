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
            llbContadorSeleccionados.Visible = false;
            if (!IsPostBack)
            {
                if(Session["Tabla"] == null)
                {
                    btn_BorrarListadoSucursales.Visible = false;
                    lbl_SinDatos.Text = "No hay sucursales seleccionadas";
                    
                }
                else
                {
                    llbContadorSeleccionados.Visible = true;
                    btn_BorrarListadoSucursales.Visible = true;
                    gv_SucursalesSeleccionadas.DataSource = (DataTable)Session["Tabla"];
                    gv_SucursalesSeleccionadas.DataBind();
                    if (Convert.ToInt32(Session["contador"]) > 0)
                        llbContadorSeleccionados.Text = "Sucursales seleccionadas: " + Session["contador"];
                }
            }
        }
        protected void btn_BorrarListadoSucursales_Click(object sender, EventArgs e)
        {
            btn_BorrarListadoSucursales.Visible = false;
            gv_SucursalesSeleccionadas.Visible = false;
            Session["Tabla"] = null;
            lbl_Mensajes.Text = "Selección eliminada";
            Session["contador"] = null;
        }
    }
}