﻿<%@ Page Language="VB" AutoEventWireup="false" EnableSessionState="True"
    EnableViewState="true" CodeFile="Login.aspx.vb" Inherits="Login" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html>

<head>
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
    <webopt:bundlereference runat="server" path="~/Content/css" />
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

    <script type="text/javascript" src="Scripts/aes.js"></script>
    <script type="text/javascript">

       <%-- function RefreshCaptcha() {
            var img = document.getElementById("<%=imgCaptcha.ClientID%>");
            img.src = "Captcha.ashx?query=" + Math.random();

        }--%>

        function SubmitsEncry() {

            var txtpassword = document.getElementById("<%=txtPwd.ClientID%>").value;
            var txtUserName = document.getElementById("<%=txtEmpno.ClientID%>").value;

            if (txtpassword == "" || txtUserName == "") {
                alert('Error: Kindly enter Valid Username and Password!');
                return false;
            }

            else {

                var aesValue = document.getElementById("<%=aesKeyField.ClientID %>").value;
                var key = CryptoJS.enc.Utf8.parse(aesValue);
                var iv = CryptoJS.enc.Utf8.parse(aesValue);
                var encryptedpassword = CryptoJS.AES.encrypt(CryptoJS.enc.Utf8.parse(txtpassword), key,

               {
                   keySize: 128 / 8,
                   iv: iv,
                   mode: CryptoJS.mode.CBC,
                   padding: CryptoJS.pad.Pkcs7

               });

                document.getElementById("<%=txtPwd.ClientID%>").value = encryptedpassword;
                document.getElementById("<%=aesKeyField.ClientID %>").value = null;

            }
        }

    </script>
</head>

<body style="overflow-x: hidden;">

    <div style="background-color: #fff; border: 15px solid #337ab7; height: 90px">
        <div id="centeredmenu" style="height: 60px; padding-top: 6px;">
            <span class="logo" style="outline: none; top: -16px;" tabindex="1">
                <img style="height: 50px; width: 50px; float: left; margin-left: 20px;" src="LoginContent/eilround.gif" /></span>
                <h2 runat="server" id="webheading" style="color: #000; font-size: 25px; color: #337ab7; font-weight: bold; margin-top: 9px; margin-left: 80px;">Infrastructure Incident Management System (IIMS)</h2>
        </div>
    </div>

    <div class="row">&nbsp;</div>
    <div class="row">&nbsp;</div>
    <div class="row">&nbsp;</div>
    <div class="row">&nbsp;</div>

    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-5">
            <br />

            <h3 style="font-size: 2rem; font-weight: 600;">Infrastructure Incident Management System (IIMS)</h3>

            <h5 class="fontsizse">The Planning & Scheduling Department at EIL ensures effective and timely implementation of projects through detailed assessment of work quantum, meticulous planning, micro level scheduling and dynamic monitoring. State of the art, international software packages on project management along with a supporting set of in-house developed software packages are used for detailed scheduling. The schedules are reviewed, updated and project completion outlook analyzed by planning engineers having vast experience in all phases of project Planning.<br />
                <br />
                The department primarily uses spreadsheet (MS Excel) for management of data/information related to EIL Projects. To overcome the shortcomings such as more time taken in creating, revising and managing the flow of data/documents; this web-based software was envisaged.<br />
            </h5>
        </div>
        <div class="col-md-6 col-12">
            <div class="panel panel-primary" style="width: 50%; max-width: 600px; margin: auto; margin-top: 2%;" runat="server" id="loginData">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span aria-hidden="true" class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;&nbsp;Sign into IIMS
                    </h3>
                </div>
                <div class="panel-body">
                    <form autocomplete="on" runat="server" class="form-horizontal">
                        <asp:ScriptManager runat="server"></asp:ScriptManager>
                        <div class="form-group fontsizselabel">
                            <label class="col-sm-3 control-label" for="txtEmpno">Emp No.</label>
                            <div class="col-sm-9" style="display: flex;">
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtEmpno" placeholder="Employee Number" CssClass="form-control fontsizse" autocomplete="off" />
                                    <asp:HiddenField ID="aesKeyField" runat="server" Value="" />
                                    <span class="input-group-addon" id="basic-addon1"><i aria-hidden="true" class="glyphicon glyphicon-user"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group fontsizselabel">
                            <label class="col-sm-3 control-label" for="txtPwd">Password</label>
                            <div class="col-sm-9" style="display: flex;">
                                <div class="input-group" style="font-size: 1.5rem;">
                                    <asp:TextBox runat="server" ID="txtPwd" placeholder="Timesheet Password" TextMode="Password" CssClass="form-control fontsizse" />
                                    <span class="input-group-addon" id="basic-addon"><i aria-hidden="true" class="glyphicon glyphicon-pencil"></i></span>
                                </div>
                            </div>
                        </div>
<%--                        <div class="form-group fontsizselabel">
                            <asp:Label runat="server" CssClass="col-md-4 control-label"><a href="#" onclick="javascript:RefreshCaptcha();"><b>Refresh</b></a></asp:Label>
                            <div class="col-md-6" style="align-content: flex-start;">
                                <asp:Image ID="imgCaptcha" runat="server" ImageUrl="Captcha.ashx" CssClass="form-control" Height="50" Width="180"></asp:Image>
                            </div>
                        </div>--%>
                       <%-- <div class="form-group fontsizselabel">
                            <label class="col-sm-3 control-label">Captcha</label>
                            <div class="col-sm-7">
                                <div class="input-group">
                                    <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control fontsizse" placeholder="Enter Captcha" autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                        </div>--%>
<%--                        <div class="row">
                            <div class="col-md-12 fontsizselabel">
                                <asp:Label ID="lblError" runat="server" Font-Bold="true" ForeColor="Firebrick"></asp:Label>
                            </div>
                        </div>--%>
                        <div class="form-group" style="margin-bottom: 0; font-size: 1.5rem">
                            <div class="col-md-offset-4 col-md-9">
                                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" OnClientClick="SubmitsEncry()" Text="Sign In" CssClass="btn btn-primary fontsizse" Style="margin-bottom: 10px; margin-top: 0;" />
<%--                                <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn btn-primary fontsizse" Style="margin-bottom: 10px; margin-top: 0;" />--%>

                            </div>
                        </div>
                        <div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid well mobile" style="margin-bottom: 0; position: fixed; left: 0; bottom: 0; width: 100%; background-color: #e6f9ff; font-size: 1.4rem;" runat="server" id="pagefooter">
        <div class="row col-md-12">
            <div class="col-md-1"></div>
            <div class="col-md-3">
                <b>Developer Contact:</b><br />
                <p>&copy;
                Sandeep Balivada, Icom: +91-11-26768177 </p>
            </div>
            <div class="col-md-3">
                <b>ITS Contact:</b><br />
                Charanjeet Singh, Icom: +91-11-26762333
                <br />
                Somesh Pabbi, Icom: +91-11-26763211
                <br />
                Sandeep Balivada, Icom: +91-11-26768177
            </div>
            <div class="col-md-5" style="text-align: right;">
                <b>Developed By: Engineers India Limited</b>
                <br />
                *Site Best Viewed in Google Chrome, Internet Explorer 10 and Above
            </div>
        </div>
    </div>
</body>
</html>
