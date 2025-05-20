using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace TP7_GRUPO_11.Conexion
{
    public class SeleccionSucursal
    {
        private const string SessionKey = "Tabla";

        public static DataTable ObtenerTabla()
        {
            if (HttpContext.Current.Session[SessionKey] == null)
            {
                HttpContext.Current.Session[SessionKey] = CrearTabla();
            }

            return (DataTable)HttpContext.Current.Session[SessionKey];
        }

        private static DataTable CrearTabla()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id_Sucursal", typeof(string));
            dt.Columns.Add("Nombre", typeof(string));
            dt.Columns.Add("Descripcion", typeof(string));
            return dt;
        }

        public static void AgregarSucursal(string id, string nombre, string descripcion)
        {
            DataTable tabla = ObtenerTabla();

            // Evitar duplicados
            if (!tabla.AsEnumerable().Any(row => row["Id_Sucursal"].ToString() == id))
            {
                DataRow row = tabla.NewRow();
                row["Id_Sucursal"] = id;
                row["Nombre"] = nombre;
                row["Descripcion"] = descripcion;
                tabla.Rows.Add(row);
            }
        }

        public static bool EstaSeleccionada(string idSucursal)
        {
            DataTable tabla = ObtenerTabla();
            return tabla.AsEnumerable().Any(row => row["Id_Sucursal"].ToString() == idSucursal);
        }
    }
}