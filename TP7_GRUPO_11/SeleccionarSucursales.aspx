<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="TP7_GRUPO_11.SeleccionarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TP 7 - Grupo 11 | SeleccionarSucursales.aspx</title>
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
             grid-area: header;
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
         }
        #container {
            margin: 0 auto;
            width: 1000px;
        }

        form {
            display: flex;
            flex-direction: row;
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
            <asp:DataList ID="dl_Provincias" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>

                    <asp:Button ID="btnProvincia" runat="server" Text='<%# Eval("DescripcionProvincia") %>' value='<%# Eval("Id_Provincia") %>' CommandArgument='<%# Eval("Id_Provincia") %>' CommandName="eventoProvincia" OnCommand="btnProvincia_Command" />
                    
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString2 %>" ProviderName="<%$ ConnectionStrings:BDSucursalesConnectionString2.ProviderName %>" SelectCommand="SELECT [Id_Provincia],[DescripcionProvincia] FROM [Provincia]"></asp:SqlDataSource>
        </nav>
    
        <div class="listview">
            <div id="form-header">
                <h1>Listado de Sucursales</h1>
                <div id="buscarSucursal">
                    <label id="lbl_buscarSucursal" for="txt_buscarSucursal">Búsqueda por nombre de sucursal: </label>
                    <div style="display: inline-block">
                         <asp:TextBox ID="txt_buscarSucursal" runat="server"></asp:TextBox><br /><asp:RegularExpressionValidator ID="rev_buscarSucursal" runat="server" ErrorMessage="Debe ser un número" ControlToValidate="txt_buscarSucursal" Display="Dynamic" ValidationExpression="^[0-9]*$" Font-Bold="True" ForeColor="Red"></asp:RegularExpressionValidator>

                    </div>
                        <asp:Button ID="btn_buscarSucursal" runat="server" Text="Buscar" OnClick="btn_buscarSucursal_Click" />
                </div>
            </div>
            <asp:ListView ID="lv_Sucursales" runat="server" GroupItemCount="3" DataSourceID="SqlDataSource1" OnPagePropertiesChanging="lv_Sucursales_PagePropertiesChanging">
                <EditItemTemplate>
                    <td runat="server" style="background-color: #999999; width: 250px">NombreSucursal:
                        <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                        <br />DescripcionSucursal:
                        <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                        <br />URL_Imagen_Sucursal:
                        <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                        <br /></td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse">
                        <tr>
                            <td>No se han devuelto datos.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
<td runat="server" style="height: 305px;"/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="width: 250px">NombreSucursal:
                        <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                        <br />DescripcionSucursal:
                        <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                        <br />URL_Imagen_Sucursal:
                        <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                        <br /></td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:HiddenField ID="hfIdSucursal" runat="server" Value='<%# Eval("Id_Sucursal") %>' />
                    <td runat="server" style="height: 335px;width: 250px">
                        <div class="plantillaItem">
                            <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>'   style="display: block; padding: 4px" />
                            <div style="display: block; background-color: #ffffff">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' />
                            </div>
                            <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' style="display: block; padding: 4px;"   />
                            <div style="display: block; margin-top: auto; padding: 4px">
                                <asp:Button ID="btn_Seleccionar" runat="server" Text="Seleccionar" CommandArgument='<%# Eval("Id_Sucursal") + "|" +  Eval("NombreSucursal") + "|" + Eval("DescripcionSucursal") %>' CommandName="eventoSeleccionar" OnCommand="btn_Seleccionar_Command" style="cursor: pointer;" />
                            </div>
                        </div>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">NombreSucursal:
                        <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                        <br />DescripcionSucursal:
                        <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                        <br />URL_Imagen_Sucursal:
                        <asp:Label ID="URL_Imagen_SucursalLabel" runat="server" Text='<%# Eval("URL_Imagen_Sucursal") %>' />
                        <br /></td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>" ProviderName="<%$ ConnectionStrings:BDSucursalesConnectionString.ProviderName %>" SelectCommand="SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [URL_Imagen_Sucursal] FROM [Sucursal]"></asp:SqlDataSource>
        </div>
    </form>
    </div>
    <footer>
    </footer>
    
</body>
</html>
