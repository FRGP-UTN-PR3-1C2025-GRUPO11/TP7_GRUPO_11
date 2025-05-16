using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace TP7_GRUPO_11.Conexion
{
    public class accesoDatos
    {
        string rutaBDSucursales = "Data Source=MABELO360\\SQLEXPRESS;Initial Catalog=BDSucursales;Integrated Security=True;Encrypt=True;Trust Server Certificate=True";
       
        public accesoDatos ()
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

        public SqlDataAdapter obtenerSqlDataAdapter(string consultaSQL)
        {
            try
            {
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(consultaSQL, obtenerConexion() );
                return sqlDataAdapter;
            }
            catch (Exception ex)
            {
                return null;
            }
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