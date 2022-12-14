using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Data;
using System.IO;
using System.Configuration;
//using com.eil.DAL;



public partial class ViewRecords : System.Web.UI.Page
{


    //static string conn = ConfigurationManager.ConnectionStrings["EILPF_ODP"].ConnectionString;
    static string conn = ConfigurationManager.ConnectionStrings["strConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sUserId"] == "" || Session["sUserId"] == null)
        {
            //Response.Redirect("../Login.aspx");
        }        
        if (!IsPostBack)
        {
            bindvouchergrid();
        }
               
    }
    protected void gvTransfer_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void gvTransfer_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gvTransfer_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            //Response.Redirect("PF_credit_voucher_details.aspx?vid=" + e.CommandArgument);
            Response.Write("<script>window.open ('PF_credit_voucher_details.aspx?vid=" + e.CommandArgument + "','_blank');</script>");
        }
        else if (e.CommandName == "")
        {

        }
    }

    public void bindvouchergrid()
    {


        string sql = "select * from IIMSRECORDS order by recordid DESC";


        OracleConnection con = new OracleConnection(conn);
        con.Open();
        OracleCommand Comm = new OracleCommand(sql, con);
        OracleDataReader rdr = Comm.ExecuteReader();
        gvTransfer.DataSource = rdr;
        gvTransfer.DataBind();
        con.Close();
    }








}
