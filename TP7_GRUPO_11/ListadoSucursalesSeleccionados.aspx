<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoSucursalesSeleccionados.aspx.cs" Inherits="TP7_GRUPO_11.ListadoSucursalesSeleccionados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TP 7 - Grupo 11 | ListadoSucursalesSeleccionados.aspx</title>
    <style>
        * {
            box-sizing: border-box;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
         header {
             display: flex;
             gap: 50px;
             justify-content: center;
             gap: 80px;
          
             margin-left: 200px;
         }
         header a {
             display: inline-block;
             line-height: 50px;
             width: 350px;
             height: 50px;
             text-align: center;
             text-decoration: none;
             cursor: pointer;
             box-sizing: border-box;
             color: black;
             text-transform: uppercase;
             border: 1px solid transparent;
             transition: border-color 0.3s ease, color 0.3s ease;
             font-weight: 500;
             
             
         }

        header a:hover {
            border: 1px solid crimson;
            color: crimson;
        }

         h1 {
             background-color: crimson;
             color: white;
             line-height: 60px;
             font-size: xx-large;
             font-style: italic;
             font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
             padding-left: 15px;
             border-start-start-radius: 10px;
             border-end-end-radius: 10px;
             margin-top: 2px;
             width: 100%;
         }
        #container {
            margin: 0 auto;
            width: 1000px;
        }

        form {
            display: flex;
            flex-direction: row;
            width: 100%;
        }

        nav {
            width: 200px;
            height: 705px;
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 150px;
            padding-top:100px;
            padding-bottom:100px;
            
        }

        nav input[type=submit] {
            padding: 10px;
            margin-bottom: 10px;
            width: 170px;
            height: 40px;
            background-color: white;
            border: 1px solid #000;
            cursor: pointer;
        }

        nav input[type=submit]:hover {
            background-color: #aaa;
        }

        .listview {
            display: flex;
            flex-direction: column;
            flex: 1;
        }
                form-header {
            width: 100%;
        }
        #buscarSucursal {
            margin-bottom: 30px;
        }
        #lbl_buscarSucursal {
            margin-right: 100px;
        }
         #txt_buscarSucursal {
             width: 300px;
             margin-right: 30px;
         }


         .plantillaItem {
             display: flex;
             flex-direction: column;
             height: 100%;
             justify-content: center;
             align-items: stretch;
             background-color: #eee;
             text-align:center;

         }
        footer {
            width: 100%;
            background: linear-gradient(to bottom, #FFFFFF, crimson, crimson, crimson);

/*            background-color: crimson;*/
            height: 100px;
            bottom: 0px;
            margin: 0px;
            left: 0px;
            right: 0px;
            
        }

        #btn_buscarSucursal
        {
            cursor: pointer;
        }
        #lv_Sucursales_DataPager1 > input[type=submit] {
            cursor: pointer;
        }
    </style>

</head>
<body>
    
    <header>
        <a href="./SeleccionarSucursales.aspx">Listado de Sucursales</a>
        <a href="./ListadoSucursalesSeleccionados.aspx">Mostrar Sucursales Seleccionadas</a>
    </header>

    <div id="container">

    

    <form id="form1" runat="server">
        <nav> 
            
            
        </nav>
        <div class="listview">
            <div id="form-header">
                <h1>Mostrar Sucursales Seleccionadas</h1>
            </div>
            <div>
                <asp:GridView ID="gv_ListadoSucursalesSeleccionadas" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="100%">
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="crimson" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
                <asp:Label ID="lbl_Mensajes" runat="server"></asp:Label>
            </div>
            <div style="margin-top: 40px; display: flex; justify-content: center; width: 100%; gap: 50px">
                <asp:Button ID="btn_BorrarListadoSucursales" runat="server" Text="Eliminar listado" OnClick="btn_BorrarListadoSucursales_Click" style="display: inline-block; padding: 20px"/>
                <asp:Button ID="btn_Volver" runat="server" Text="Volver" style="display: inline-block; padding: 20px" PostBackUrl="~/SeleccionarSucursales.aspx" />
            </div>

        </div>
    </form>
        </div>
    <footer>

    </footer>
</body>
</html>
