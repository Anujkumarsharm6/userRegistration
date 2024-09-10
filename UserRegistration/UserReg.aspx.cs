using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace UserRegistration
{
    public partial class UserReg : System.Web.UI.Page
    {
        string connctionstring = "Data source = localhost\\sqlexpress; database= Sample; Integrated Security = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clear();
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int userID = Convert.ToInt32(Request.QueryString["id"]);
                    using(SqlConnection con = new SqlConnection(connctionstring))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter("sp_userviewbyid",con);
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;
                        da.SelectCommand.Parameters.AddWithValue("@UserID", userID);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        hfuserid.Value = userID.ToString();
                        txtfirstName.Text = dt.Rows[0][1].ToString();
                        txtlastname.Text = dt.Rows[0][2].ToString();
                        txtcontact.Text = dt.Rows[0][3].ToString();
                        ddlgender.Items.FindByValue(dt.Rows[0][4].ToString()).Selected= true;
                        txtaddress.Text = dt.Rows[0][5].ToString();
                        txtusername.Text = dt.Rows[0][6].ToString();
                        txtpassword.Text = dt.Rows[0][7].ToString();
                        txtpassword.Attributes.Add("value", dt.Rows[0][7].ToString());
                        txtconfirmpassord.Text = dt.Rows[0][7].ToString();
                        txtconfirmpassord.Attributes.Add("value", dt.Rows[0][7].ToString());
                    }
                }
            }

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (txtusername.Text == "" || txtpassword.Text == "")
                lblerrormessage.Text = "Please fill mandotorily filleds";
            else if (txtpassword.Text != txtconfirmpassord.Text)
                lblerrormessage.Text = "Password do not match each other";
            else
            {

                using (SqlConnection sqlcon = new SqlConnection(connctionstring))
                {
                    sqlcon.Open();
                    SqlCommand cmd = new SqlCommand("sp_useraddoredit", sqlcon);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(hfuserid.Value == "" ? "0" : hfuserid.Value));
                    cmd.Parameters.AddWithValue("@FirstName", txtfirstName.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastName", txtlastname.Text.Trim());
                    cmd.Parameters.AddWithValue("@Contact", txtcontact.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", ddlgender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", txtaddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@UserName", txtusername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtpassword.Text.Trim());
                    cmd.ExecuteNonQuery();
                    lblsuccessmessage.Text = "Submitted successfully!!";

                }

            }
        }
        void clear()
        {
            txtfirstName.Text = txtlastname.Text = txtcontact.Text = txtaddress.Text = txtusername.Text = txtpassword.Text = txtconfirmpassord.Text = "";
            hfuserid.Value = "";
            lblsuccessmessage.Text = lblerrormessage.Text = "";
        }

    }
};