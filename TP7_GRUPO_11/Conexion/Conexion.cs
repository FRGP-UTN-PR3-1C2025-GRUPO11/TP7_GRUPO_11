using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace TP7_GRUPO_11
{
    public class Conexion
    {
        string rutaBDSucursales = @"Data Source=localhost\SQLEXPRESS;Initial Catalog=BDSucursales;Integrated Security=True";
       
        public Conexion()
        {}
        
        public SqlConnection obtenerConexion()
        {
            try
            {
                SqlConnection sqlConnection = new SqlConnection(rutaBDSucursales);
                sqlConnection.Open();
                return sqlConnection;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public DataTable obtenerSucursal(string consultaSQL)
        {
            DataTable tabla = new DataTable();

            try
            {
                using (SqlConnection conexion = obtenerConexion())
                {
                    conexion.Open();
                    SqlDataAdapter adaptador = new SqlDataAdapter(consultaSQL, conexion);
                    adaptador.Fill(tabla);
                } // Aquí se cierra la conexión automáticamente
            }
            catch (Exception ex)
            {
                // Log o manejo de error
            }

            return tabla;
        }

        public int ejecutarProcedimientosAlmacenados(SqlCommand comandoSQL, string nombreProcedimientoAlmacenado)
        {
            int filasAfectadas;
            SqlConnection Conexion = obtenerConexion();
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand = comandoSQL;
            sqlCommand.Connection = Conexion;
            sqlCommand.CommandType = System.Data.CommandType.StoredProcedure; ///ACÁ SE INDICA QUE ES UN PROCEDIMIENTO ALMACENADO
            sqlCommand.CommandText = nombreProcedimientoAlmacenado; ///ACÁ SE INDICA EL NOMBRE DEL PROCEDIMIENTO ALMACENADO
            filasAfectadas = sqlCommand.ExecuteNonQuery();  ///ACÁ SE EJECUTA EL PROCEDIMIENTO ALMACENADO
            Conexion.Close();
            return filasAfectadas;
        }
    }
}