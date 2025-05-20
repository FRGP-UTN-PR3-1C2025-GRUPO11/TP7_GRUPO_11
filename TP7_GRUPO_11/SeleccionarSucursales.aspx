<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="TP7_GRUPO_11.SeleccionarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TP 7 - Grupo 11 | SeleccionarSucursales.aspx</title>



<style>
* {
    box-sizing: border-box;
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




#btnBuscarSucursal 
 {
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

#txtBoxBuscarSucursal 
{
    padding: .2rem;
}

#centro 
{
    display: flex;
    justify-content: start;
    align-items: start;
}

.content 
{
    margin: 0px auto;
    width: 960px;

}

header.content
{
    background-color: crimson;
    height: 100px;
}
header .content a 
{
    color: red;
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
.links
{
    display: flex;
    justify-content: center;
    gap: 100px;
}


#DataList1 {
    width: 200px;
    height: 705px;
    display: flex;
    flex-direction: row;
    justify-content: center;
    padding-top: 200px;
    padding-bottom:200px;
    flex-basis: 200px;
    flex-shrink: 0;
    flex-grow: 0;
    
    align-items: center;
}

#DataList1 input[type=submit] {
    padding: 10px;
    margin-bottom: 30px;
    width: 170px;
    height: 40px;
    background-color: white;
    border: 1px solid #000;
    cursor: pointer;
    transition: background-color 0.3s ease-in, color 0.3s ease;
}

#DataList1 input[type=submit]:hover {
    background-color: rgba(220, 20, 60, 0.5);
    color: #000000;
}

#lv_Sucursales {
    width: 100%;
    table-layout: fixed;
}

.plantillaItem {
    display: flex;
    flex-direction: column;
    height: 100%;
    justify-content: center;
    background-color: #eee;
    text-align:center;
    align-items: stretch;
    width: 250px;
}

</style>



</head>
<body>
    <form id="form1" runat="server">
        
            <header>
                <div class="content">
                    <div class="links">
                        <a href="./SeleccionarSucursales.aspx">Listado de Sucursales</a>
                        <a href="./ListadoSucursalesSeleccionadas.aspx">Mostrar Sucursales Seleccionadas</a>
                    </div>
                    <h1>Listado de Sucursales</h1>
                </div>
            </header>
        <main>

            <section class="content">
                <asp:Label ID="lblBusquedaSucursal" runat="server" Text="Busqueda por nombre de Sucursal:"></asp:Label>
                <asp:TextBox ID="txtBoxBuscarSucursal" runat="server" placeholder="Ingrese Sucursal..."></asp:TextBox>
                <asp:Button ID="btnBuscarSucursal" runat="server" OnClick="btnBuscarSucursal_Click" Text="Buscar" />
            </section>

            <div id="centro" class="content">
        
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CommandName="EventoBoton" CommandArgument='<%# Eval("Id_Provincia") %>' Text='<%# Eval("DescripcionProvincia") %>' OnCommand="Button1_Command" />
                        
                    </ItemTemplate>
                </asp:DataList>

                <asp:ListView ID="lv_Sucursales" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Id_Sucursal" GroupItemCount="3" OnPagePropertiesChanging="lv_Sucursales_PagePropertiesChanging" OnDataBound="lv_Sucursales_DataBound">







                    <EditItemTemplate>
                        <td runat="server" style="background-color: #999999;">URL_Imagen_Sucursal:
                            <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                            <br />
                            NombreSucursal:
                            <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                            <br />
                            DescripcionSucursal:
                            <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                            <br />
                            Id_Sucursal:
                            <asp:Label ID="Id_SucursalLabel1" runat="server" Text='<%# Eval("Id_Sucursal") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                            <br />
                        </td>
                    </EditItemTemplate>

                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No se han devuelto datos.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <EmptyItemTemplate>
                        <td runat="server" style="height: 335px; width: 250px" />
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
                            <br />
                            DescripcionSucursal:
                            <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                            <br />
                        </td>
                    </InsertItemTemplate>



                    <ItemTemplate>
                        <asp:HiddenField ID="hfIdSucursal" runat="server" Value='<%# Eval("Id_Sucursal") %>' />
                        <td runat="server" style="height: 335px; width: 250px ">
                            <div class="plantillaItem" >
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("NombreSucursal") %>' style="display: block; padding: 4px" />
                                <div style="display: block; background-color: #ffffff">
                                    <asp:ImageButton ID="ibSur" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>'/>
                                </div>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("DescripcionSucursal") %>' style="display: block; padding: 4px;" />
                                <div style="display: block; margin-top: auto; padding: 4px">
                                    <asp:Button ID="btnSeleccion" runat="server" Text="Seleccionar" CommandArgument='<%# Eval("nombreSucursal") + ";" + Eval("DescripcionSucursal") + ";" +  Eval("Id_Sucursal") %>' CommandName="eventoSeleccionar" OnCommand="btnSeleccion_Command" style="cursor: pointer;" />
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
                            <td runat="server" style="text-align: center;background-color: crimson;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" LastPageText="Ultimo" FirstPageText="Primero" NextPageText="Siguiente" PreviousPageText="Anterior" ShowLastPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" LastPageText="Ultimo" FirstPageText="Primero" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>



                <SelectedItemTemplate>
                    <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">URL_Imagen_Sucursal:
                        <asp:Label ID="URL_Imagen_SucursalLabel" runat="server" Text='<%# Eval("URL_Imagen_Sucursal") %>' />
                        <br />
                        NombreSucursal:
                        <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                        <br />
                        DescripcionSucursal:
                        <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                        <br />
                        Id_Sucursal:
                        <asp:Label ID="Id_SucursalLabel" runat="server" Text='<%# Eval("Id_Sucursal") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
           
                    
                
                </asp:ListView>

            </div> <%--id="centro" --%>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>" SelectCommand="SELECT [URL_Imagen_Sucursal], [NombreSucursal], [DescripcionSucursal], [Id_Sucursal] FROM [Sucursal]"></asp:SqlDataSource>
        </main>
     
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString %>" SelectCommand="SELECT [DescripcionProvincia], [Id_Provincia] FROM [Provincia]"></asp:SqlDataSource>
    </form>
</body>
</html>
