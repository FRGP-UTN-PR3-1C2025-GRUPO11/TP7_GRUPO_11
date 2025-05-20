<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoSucursalesSeleccionadas.aspx.cs" Inherits="TP7_GRUPO_11.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TP 7 - Grupo 11 | ListadoSucursalesSelccionadas.aspx</title>
    <style>
* {
    box-sizing: border-box;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
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


.content 
{
    margin: 0px auto;
    width: 960px;
/*                        border: 1px dashed black;*/
}

header.content
{
    background-color: crimson;
    height: 100px;


/*                        border: 1px dashed black;*/
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

#sucursales_seleccionadas
{
    text-align:
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
            <h1>Mostrar Sucursales Seleccionadas</h1>
        </div>
    </header>
        <div id="sucursales_seleccionadas" class="content">
            [ LISTADO DE SUCURSALES SELECCIONADAS ]

        </div>
    </form>
</body>
</html>
