<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewRecords.aspx.cs" Inherits="ViewRecords" %>


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

                        <%--<asp:GridView ID="GridView1" runat="server">
                        </asp:GridView>--%>
                        <asp:GridView ID="gvTransfer"  class="panel panel-primary" runat="server" DataKeyNames="RECORDID" AutoGenerateColumns="False" OnRowCommand="gvTransfer_RowCommand"
                            AllowSorting="true" OnRowDataBound="gvTransfer_RowDataBound" CssClass="myTable_New" OnRowDeleting="gvTransfer_RowDeleting">

                            <HeaderStyle HorizontalAlign="Left" BackColor="#337ab7" ForeColor="White" CssClass="GVFixedHeader" />
                            <Columns>
                                <asp:TemplateField HeaderText="SNo" HeaderStyle-Width="5%">
                                    <ItemStyle CssClass="myGridTextItem" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <HeaderStyle CssClass="myGridHeader" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <span>
                                            <%# Container.DataItemIndex +1 %> 
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Record ID" HeaderStyle-Width="5%">
                                    <ItemStyle CssClass="myGridTextItem" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <HeaderStyle CssClass="myGridHeader" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblVOUCHER_NO" Text='<%# Bind("RECORDID")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="INCDATE" HeaderText="Incident Date" HeaderStyle-Width="10%">
                                    <ItemStyle CssClass="myGridTextItem" HorizontalAlign="center" />
                                    <HeaderStyle CssClass="myGridHeader" HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SYS_NAME" HeaderText="System Name" HeaderStyle-Width="10%">
                                    <ItemStyle CssClass="myGridTextItem" HorizontalAlign="right" />
                                    <HeaderStyle CssClass="myGridHeader" HorizontalAlign="right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DETAILS" HeaderText="Details" HeaderStyle-Width="20%">
                                    <ItemStyle CssClass="myGridTextItem" HorizontalAlign="center" />
                                    <HeaderStyle CssClass="myGridHeader" HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="IMPACT" HeaderText="Impact" HeaderStyle-Width="10%">
                                    <ItemStyle CssClass="myGridTextItem" HorizontalAlign="center" />
                                    <HeaderStyle CssClass="myGridHeader" HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ACTION_TAKEN" HeaderText="Action Taken" HeaderStyle-Width="20%">
                                    <ItemStyle CssClass="myGridTextItem" HorizontalAlign="left" />
                                    <HeaderStyle CssClass="myGridHeader" HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ACTION_TAKEN_BY" HeaderText="Action Taken By" HeaderStyle-Width="5%">
                                    <ItemStyle CssClass="myGridTextItem" HorizontalAlign="right" />
                                    <HeaderStyle CssClass="myGridHeader" HorizontalAlign="right" />
                                </asp:BoundField>
                                <%--                            <asp:BoundField DataField="W_INT_EMP" HeaderText="W Int Emp" HeaderStyle-Width="9%">
                                <ItemStyle CssClass="myGridTextItem" HorizontalAlign="right" />
                                <HeaderStyle CssClass="myGridHeader" HorizontalAlign="right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_INT_EMPLYR" HeaderText="W Amt Emplyr" HeaderStyle-Width="9%">
                                <ItemStyle CssClass="myGridTextItem" HorizontalAlign="right" />
                                <HeaderStyle CssClass="myGridHeader" HorizontalAlign="right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="W_AMT_TOT" HeaderText="W Amt Total" HeaderStyle-Width="9%">
                                <ItemStyle CssClass="myGridTextItem" HorizontalAlign="right" />
                                <HeaderStyle CssClass="myGridHeader" HorizontalAlign="right" />
                            </asp:BoundField>

                                --%>

                                <asp:TemplateField HeaderText="Changes" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="myGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle CssClass="myGridTextItem" HorizontalAlign="center" />
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hlView" runat="server" ImageUrl="/Content/Images/edit.jpg" ToolTip="Edit" />
                                        <%--&nbsp; &nbsp;<asp:HyperLink ID="hlPrint" runat="server" CommandName="print" ImageUrl="/Content//Images/print.jpg" ToolTip="Print" />--%>
                                        &nbsp;&nbsp;<asp:ImageButton ID="imgDelete" CommandName="delete" ImageUrl="/Content/Images/del.jpg" runat="server" Width="16px" Height="15px" OnClientClick="return confirm('Are you sure to delete this voucher.')" ToolTip="Delete" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataRowStyle CssClass="myPageHeader" ForeColor="Red" />
                            <EmptyDataTemplate />
                            <SelectedRowStyle CssClass="myGridSelectedItemStyle" />
                            <AlternatingRowStyle CssClass="myGridAlternatingItemStyle" />
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
