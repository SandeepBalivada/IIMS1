<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewRecords.aspx.vb" Inherits="ViewRecords" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Infrastructure Incident Management System (IIMS) </title>
    <%--<title>Infrastructure Incident Management System (IIMS)</title>--%>
    <meta content="public" http-equiv="Cache-control" />
    <meta charset="utf-8" />
    <meta content="IE=edge" http-equiv="X-UA-Compatible" />

    <meta content="width=device-width, initial-scale=1" name="viewport" />

    <%--<meta charset="utf-8" />--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <asp:PlaceHolder runat="server">
        <%--<%: Scripts.Render("~/bundles/modernizr") %>--%>
    </asp:PlaceHolder>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <%--<link href="~/EILlogo.ico" rel="shortcut icon" type="image/x-icon" />--%>
    <link rel="icon" type="image/png" href="http://example.com/myicon.png"></link>



    <link href="LoginContent/edms.css" media="all" rel="stylesheet" type="text/css" />
    <link href="LoginContent/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="Content/bootstrap-5.1.0-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/Content/jquery-3.6.0/jquery-3.6.0.min.js")%>"></script>


    <style>
        table.form-table {
            display: table;
            border-collapse: separate;
            border-spacing: 2px;
        }

        .btn:not(.footer) {
            margin-bottom: 20px;
            margin-top: 20px;
        }

        .btn {
            margin-right: 16px;
        }


        @media only screen and (max-width: 600px) {
            #pagefooter {
                position: relative !important;
            }
        }

        @media only screen and (max-width: 600px) {
            #loginData {
                width: 70% !important;
            }
        }

        @media only screen and (max-width: 600px) {
            #webheading {
                font-size: 17px !important;
            }
        }
    </style>
    <style>
        #header-fixed {
            position: fixed;
            top: 0px;
            display: none;
            background-color: white;
        }
    </style>
    <style>
        .breadcrumb {
            margin-bottom: 0px !important;
        }

        div.FixedHeader_Cloned th,
        div.FixedHeader_Cloned td {
            background-color: #337AB7 !important;
        }

        div.FixedHeader_Cloned th,
        div.FixedHeader_Cloned td {
            color: #fff !important;
        }

        .bigdrop {
            max-width: 600px;
        }

        body {
            margin: 0px;
        }

        table.fixed {
            table-layout: fixed;
        }

            table.fixed td {
                overflow: hidden;
            }

        .fontsizse {
            font-size: 1.5rem;
            text-align: justify;
        }

        .fontsizselabel {
            font-size: 1.3rem;
        }
    </style>
</head>
<body style="overflow-x: hidden;">
    <div style="background-color: #fff; border: 15px solid #337ab7; height: 90px">
        <div id="centeredmenu" style="height: 60px; padding-top: 6px;">
            <span class="logo" style="outline: none; top: -16px;" tabindex="1">
                <img style="height: 50px; width: 50px; float: left; margin-left: 20px;" src="LoginContent/eilround.gif" /></span>
            <h2 runat="server" id="webheading" style="color: #000; font-size: 25px; color: #337ab7; font-weight: bold; margin-top: 9px; margin-left: 80px;">Infrastructure Incident Management System (IIMS)</h2>
        </div>
    </div>
    <form autocomplete="on" runat="server" class="form-horizontal">
        <div class="row">&nbsp;</div>
        <div class="row">
            <%-- <div class="col-md-1"></div>--%>
            <div class="col-md-12">
                <div class="panel panel-primary" style="width: 95%; max-width: 1800px; margin: auto; margin-top: 2%;" runat="server" id="loginData">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <span aria-hidden="true" class="glyphicon glyphicon-tasks"></span>&nbsp;&nbsp;&nbsp;View Records
                        </h3>
                    </div>
                    <div class="panel-body">
                        <%--<form autocomplete="on" runat="server" class="form-horizontal">--%>
                        <%--<asp:ScriptManager runat="server"></asp:ScriptManager>--%>




                        <%--                                <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn btn-primary fontsizse" Style="margin-bottom: 10px; margin-top: 0;" />--%>

                        <asp:GridView ID="GridView1" runat="server">
                        </asp:GridView>

                    </div>
                </div>


            </div>
        </div>

        </div>
      <%--  <div class="col-md-1"></div>--%>

    </div>
    <div class="row">
        <div class="panel-heading">
            <%-- <h3 class="panel-title">
                        <span aria-hidden="true" class="glyphicon glyphicon-tasks"></span>&nbsp;&nbsp;&nbsp;Incident Details
                    </h3>--%>
        </div>
        <div class="col-md-5"></div>
        <div class="col-md-4">
            <asp:Button ID="btnConfirm" runat="server" Text="Print Data" PostBackUrl="~/Print.aspx" CssClass="btn btn-primary fontsizse" Style="margin-bottom: 10px; margin-top: 0;" />
        </div>
        <div class="col-md-3"></div>
    </div>


    </form>
</body>
</html>
