<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="TP7_GRUPO_11.SeleccionarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TP 7 - Grupo 11 | SeleccionarSucursales.aspx</title>
    <style>
        body {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }

        section {
            display: flex;
            justify-content: center;
            align-items: center;
            padding-bottom: 10px;
            gap: 10px;
        }

        h1 {
            text-align: center;
        }

        td {
            width: 200px;
        }

        Table {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #btnBuscarSucursal {
            background: none;
            cursor: pointer;
            border: 1px solid #000000;
            border-radius: 10px;
            padding: 10px;
            transition: 0.4s ease;
        }

        #btnBuscarSucursal:hover {
                background-color: #EDDD53;
                color: #000000;
            }

        #txtBoxBuscarSucursal {
            padding: .2rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Listado de Sucursales</h1>
            <section>
            <asp:Label ID="lblBusquedaSucursal" runat="server" Text="Busqueda por nombre de Sucursal:"></asp:Label>
            <asp:TextBox ID="txtBoxBuscarSucursal" runat="server" placeholder="Ingrese Sucursal..."></asp:TextBox>
            <asp:Button ID="btnBuscarSucursal" runat="server" OnClick="btnBuscarSucursal_Click" Text="Buscar" />
            </section>
            <asp:ListView ID="lv_Sucursales" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
                <EditItemTemplate>
                    <td runat="server" style="background-color: #FFCC66;color: #000080;">URL_Imagen_Sucursal:
                        <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                        <br />
                        NombreSucursal:
                        <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                        <br />DescripcionSucursal:
                        <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                        <br /></td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No se han devuelto datos.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
<td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">URL_Imagen_Sucursal:
                        <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                        <br />
                        NombreSucursal:
                        <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                        <br />DescripcionSucursal:
                        <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                        <br /></td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="background-color: #FFFBD6;color: #333333;">
                            <asp:Label CssClass="centro" ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                        <br />
                        <asp:ImageButton ID="ibSur" runat="server" Height="100px" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' style="margin-left: 91px" Width="204px" />
                        <br />
                        <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                            <br />
                            <br />
                            <asp:Button ID="btnSeleccion" runat="server" Text="Seleccionar" Width="90px" CommandArgument='<%# Eval("nombreSucursal") + ";" + Eval("DescripcionSucursal") + ";" +  Eval("Id_Sucursal") %>' CommandName="eventoSeleccionar" OnClick="btnSeleccion_Click" OnCommand="btnSeleccion_Command" />
                        <br /></td>
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
                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
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
                    <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">URL_Imagen_Sucursal:
                        <asp:Label ID="URL_Imagen_SucursalLabel" runat="server" Text='<%# Eval("URL_Imagen_Sucursal") %>' />
                        <br />
                        NombreSucursal:
                        <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                        <br />DescripcionSucursal:
                        <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                        <br /></td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>" SelectCommand="SELECT [URL_Imagen_Sucursal], [NombreSucursal], [DescripcionSucursal], [Id_Sucursal] FROM [Sucursal]"></asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
            <ItemTemplate>
                <asp:Button ID="Button1" runat="server" CommandName="EventoBoton" CommandArgument='<%# Eval("Id_Provincia") %>' Text='<%# Eval("DescripcionProvincia") %>' OnCommand="Button1_Command" />
                <br />
            </ItemTemplate>
        </asp:DataList>
        </div>
        <asp:GridView ID="gvPrueba" runat="server">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>" SelectCommand="SELECT [DescripcionProvincia], [Id_Provincia] FROM [Provincia]"></asp:SqlDataSource>
    </form>
</body>
</html>
