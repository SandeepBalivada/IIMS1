<%@ Page Language="VB" AutoEventWireup="false" EnableSessionState="True"
    EnableViewState="true" CodeFile="Home.aspx.vb" Inherits="Home" MaintainScrollPositionOnPostback="true" %>  

<%--<%@ Page Language="VB" CodeFile="Home.aspx.vb" Inherits="Home" MaintainScrollPositionOnPostback="true" %>  --%>
  
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
</head>  
<body style="overflow-x: hidden;">  
        <div style="background-color: #fff; border: 15px solid #337ab7; height: 90px">
            <div id="centeredmenu" style="height: 60px; padding-top: 6px;">
                <span class="logo" style="outline: none; top: -16px;" tabindex="1">
                    <img style="height: 50px; width: 50px; float: left; margin-left: 20px;" src="LoginContent/eilround.gif" /></span>
                    <h2 runat="server" id="webheading" style="color: #000; font-size: 25px; color: #337ab7; font-weight: bold; margin-top: 9px; margin-left: 80px;">Infrastructure Incident Management System (IIMS)</h2>
            </div>
        </div>
        <div class="importantext-sec ">
                <marquee behavior="scroll" direction="left" onmouseout="this.start();" onmouseover="this.stop();"> Engineers India Limited - net Zero by 2035<span class="mark-con" style="display:inline-block;margin-left:800px;">Delivering Excellence through People</span><span class="mark-con" style="display:inline-block;margin-left:800px;">हर काम देश के नाम - Har Kaam Desh Ke Naam </span></marquee>
        </div>

        <form autocomplete="on" runat="server" class="form-horizontal">
            <div class="row">&nbsp;</div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10 col-12">
                    <div class="panel panel-primary" style="width: 50%; max-width: 600px; margin: auto; margin-top: 2%;" runat="server" id="loginData">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <span aria-hidden="true" class="glyphicon glyphicon-tasks"></span>&nbsp;&nbsp;&nbsp;Incident Details
                            </h3>
                        </div>
                        <div class="panel-body">
                            <%--<form autocomplete="on" runat="server" class="form-horizontal">--%>
                                <asp:ScriptManager runat="server"></asp:ScriptManager>
                                <div class="form-group fontsizselabel">
                                    <label class="col-sm-3 control-label" for="txtDate">Date</label>
                                    <div class="col-sm-9" style="display: flex;">
                                        <div class="input-group">
                                            <asp:TextBox runat="server" ID="txtDate" placeholder="DD-MM-YY" CssClass="form-control fontsizse" />
        <%--                                    <asp:Calendar runat="server" ID="txtEmpno" placeholder="DD-MM-YY" Visible="False" CssClass="form-control fontsizse" autocomplete="off" />--%>
                                            <asp:HiddenField ID="aesKeyField" runat="server" Value="" />
                                            <span class="input-group-addon" id="basic-addon1"><i aria-hidden="true" class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group fontsizselabel">
                                    <label class="col-sm-3 control-label" for="txtSystemName">System Name</label>
                                    <div class="col-sm-9" style="display: flex;">
                                        <div class="input-group" style="font-size: 1.5rem;">
                                            <asp:TextBox runat="server" ID="txtSystemName" placeholder="System Name" CssClass="form-control fontsizse" />
                                            <span class="input-group-addon" id="basic-addon2"><i aria-hidden="true" class="	glyphicon glyphicon-hdd"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group fontsizselabel">
                                    <label class="col-sm-3 control-label" for="txtDetails">Details of the Event</label>
                                    <div class="col-sm-9" style="display: flex;">
                                        <div class="input-group" style="font-size: 1.5rem;">
                                            <asp:TextBox runat="server" ID="txtDetails" placeholder="Enter event details" CssClass="form-control fontsizse" />
                                            <span class="input-group-addon" id="basic-addon3"><i aria-hidden="true" class="glyphicon glyphicon-folder-open"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group fontsizselabel">
                                    <label class="col-sm-3 control-label" for="txtImpact">Impact of the Event</label>
                                    <div class="col-sm-9" style="display: flex;">
                                        <div class="input-group" style="font-size: 1.5rem;">
                                            <asp:TextBox runat="server" ID="txtImpact" placeholder="Enter impact details" CssClass="form-control fontsizse" />
                                            <span class="input-group-addon" id="basic-addon4"><i aria-hidden="true" class="glyphicon glyphicon-star"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group fontsizselabel">
                                    <label class="col-sm-3 control-label" for="txtActionTaken">Action taken</label>
                                    <div class="col-sm-9" style="display: flex;">
                                        <div class="input-group" style="font-size: 1.5rem;">
                                            <asp:TextBox runat="server" ID="txtActionTaken" placeholder="Action taken" CssClass="form-control fontsizse" />
                                            <span class="input-group-addon" id="basic-addon5"><i aria-hidden="true" class="glyphicon glyphicon-ok"></i></span>
                                        </div>
                                    </div>
                                </div>
                        
                                <div class="form-group fontsizselabel">
                                    <label class="col-sm-3 control-label" for="txtActionTakenBy">Action taken by</label>
                                    <div class="col-sm-9" style="display: flex;">
                                        <div class="input-group" style="font-size: 1.5rem;">
                                            <asp:TextBox runat="server" ID="txtActionTakenBy" placeholder="Action taken by" CssClass="form-control fontsizse" />
                                            <span class="input-group-addon" id="basic-addon6"><i aria-hidden="true" class="glyphicon glyphicon-user"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom: 0; font-size: 1.5rem">
                                    <div class="col-md-offset-4 col-md-9">
                                            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" CssClass="btn btn-primary fontsizse" Style="margin-bottom: 10px; margin-top: 0;" />
                                    </div>
                     </div>


                                 <table>
                                    <tr>
                                        <td  >
                                            &nbsp;
                                            <asp:Label ID="errmsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                                                ForeColor="Firebrick" Width="473px" Height="20px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>                    
                        </div>
                    </div>

                </div>
                <div class="col-md-1"></div>

            </div>
            <div class="row">
              <div class="panel-heading"></div>
              <div class="col-md-5"></div>
              <div class="col-md-4" >
                <asp:Button ID="btnConfirm" runat="server" Text="View Records" PostBackUrl="~/ViewRecords.aspx" CssClass="btn btn-primary fontsizse" Style="margin-bottom: 10px; margin-top: 0;" />
               </div>
              <div class="col-md-3"></div>
            </div>


            </form>
</body>  
</html> 