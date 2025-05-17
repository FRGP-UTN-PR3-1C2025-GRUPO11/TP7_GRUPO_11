using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


namespace TP7_GRUPO_11
{
    public class GestionBDSucursales
    {
        public GestionBDSucursales()
        {
            // Constructor de la clase
        }

        public DataTable mostrarSucursales()
        {

            string consultaSQL = "SELECT * FROM SUCURSAL";

            DataSet dataSet = new DataSet();

            Conexion conexion = new Conexion();

            SqlConnection sqlConnection = conexion.obtenerConexion();

            SqlDataAdapter adaptador = new SqlDataAdapter(consultaSQL, sqlConnection);


            adaptador.Fill(dataSet);

            return dataSet.Tables[0];
        }

        public DataTable obtenerSucursal(string id_sucursal) {

            string consultaSQL = "";

            if (id_sucursal == "")
            {
                consultaSQL = "SELECT * FROM SUCURSAL ";

            } else
            {
                consultaSQL = "SELECT * FROM SUCURSAL WHERE ID_SUCURSAL = " + id_sucursal;
            }

                DataSet dataSet = new DataSet();
            
            Conexion conexion = new Conexion();
            
            SqlConnection sqlConnection = conexion.obtenerConexion();

            SqlDataAdapter adaptador = new SqlDataAdapter(consultaSQL, sqlConnection);

            
            adaptador.Fill(dataSet);

            return dataSet.Tables[0];
        }
      
    }
}