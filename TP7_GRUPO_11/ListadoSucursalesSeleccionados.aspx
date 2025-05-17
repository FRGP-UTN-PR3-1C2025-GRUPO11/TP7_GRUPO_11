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
    body {
        margin: 0 auto;
        display: grid;
        margin: 0px;
        padding: 3px;
        grid-template-columns: 200px 400px 400px;
        grid-template-areas: 
            ". header header"
            ". main main"
            "nav main main"
            ". footer footer";
        width: 1000px;
        max-width: 100%;
        margin-left: auto;
        margin-right: auto;
    }
        

    form {
        display: contents;

    }
    nav {
        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: 30px;
        grid-area: nav;
        width: 200px;
        min-height: 800px;

    }

    nav input[type=submit] {
        padding: 10px;
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
            
        grid-area: main;
        flex-direction: column;


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
        header {
            display: flex;
            gap: 50px;
            justify-content: center;
            gap: 80px;
             
            grid-area: header;
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
/*            border: 1px solid crimson;*/
        color: crimson;
    }

        #form-header {
            

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
        grid-area: footer;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 50px;
        background-color: #eee;
        text-align: center;
        border: 4px dashed black;
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
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
