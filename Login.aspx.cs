using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : BasePage
{
    dalUser objUser = new dalUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDropdown();
        }
    }
    protected void LoadDropdown()
    {
        var categoryList = new Dictionary<string, string>() { { "1", "Narsingdi" }, { "2", "Habiganj" }, { "3", "Danga" } };
        var CampusNo = Request.QueryString["CampusNo"] ?? "1";
        ddlBranch.DataSource = categoryList;
        ddlBranch.DataValueField = "Key";
        ddlBranch.DataTextField = "Value";
        ddlBranch.DataBind();
        ddlBranch.SelectedValue = CampusNo;
    }
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/Admin/SiteMap.aspx");
    }
    protected void _LoginButton_Click(object sender, EventArgs e)
    {
        SessionManager.SessionName.Branch = Convert.ToInt32(ddlBranch.SelectedValue);
        dalUser objUser = new dalUser();
        DataTable dt = objUser.GetLoginInfo(tbxUserName.Text.Trim(), EncryptionDecryption.Encrypt(tbxPassword.Text.Trim(), true));
        if (dt.Rows.Count > 0)
        {
            SessionManager.SessionName.UserId = Convert.ToInt32(dt.Rows[0]["Id"]);
            SessionManager.SessionName.UserName = dt.Rows[0]["UserName"].ToString();
            SessionManager.SessionName.RoleId = Convert.ToInt32(dt.Rows[0]["RoleId"]);
            SessionManager.SessionName.RolePriority = Convert.ToInt32(dt.Rows[0]["Priority"]);
            SessionManager.SessionName.PersonId = Convert.ToInt32(dt.Rows[0]["PersonId"]);

            dalTaskManager objTask = new dalTaskManager();
            DataTable dtTaskList = objTask.GetAllByRoleId(Convert.ToInt32(dt.Rows[0]["RoleId"]));
            SessionManager.SessionName.TaskList = dtTaskList;
            if (Convert.ToInt32(dt.Rows[0]["RoleId"]) == 4)
            {
                DataTable dtstudent = new dalStudent().ClassInfoByUserName(dt.Rows[0]["Id"].ToString());
                {
                    if (dtstudent.Rows.Count > 0)
                    {
                        Common.SessionInfo.StudentId = Convert.ToInt32(dtstudent.Rows[0]["StudentId"].ToString());
                        Common.SessionInfo.StudentToClassId = Convert.ToInt32(dtstudent.Rows[0]["ID"].ToString());
                        Common.SessionInfo.ClassId = Convert.ToInt32(dtstudent.Rows[0]["ClassId"].ToString());
                        Common.SessionInfo.GroupId = Convert.ToInt32(dtstudent.Rows[0]["GroupId"].ToString());
                        Common.SessionInfo.ShiftId = Convert.ToInt32(dtstudent.Rows[0]["ShiftId"].ToString());
                        Common.SessionInfo.SectionId = Convert.ToInt32(dtstudent.Rows[0]["SectionId"].ToString());
                        Common.SessionInfo.RegNo = dtstudent.Rows[0]["RegNo"].ToString();
                    }
                }
            }
            string returnUrl = "~/Pages/Admin/SiteMap.aspx";
            if (Request.QueryString["returnUrl"] != null)
            {
                returnUrl = Request.QueryString["returnUrl"];
            }
            Response.Redirect(returnUrl);
        }
        else
        {
            FailureText.Text = "Invalid Username or Password";
        }

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        SessionManager.SessionName.Branch = Convert.ToInt32(ddlBranch.SelectedValue);
        DataTable dtAnyUser = objUser.GetUserByUserName(tbxUserName.Text.Trim());
        if (dtAnyUser.Rows.Count > 0)
        {
            var CHECK_HRIS_LOGIN = System.Configuration.ConfigurationManager.AppSettings["CHECK_HRIS_LOGIN"];
            var RoleId = Convert.ToInt32(dtAnyUser.Rows[0]["RoleId"]);
            if (CHECK_HRIS_LOGIN == "1" && RoleId != 4)
            {
                try
                {
                    var res = "";
                    var httpWebRequest = (System.Net.HttpWebRequest)System.Net.WebRequest.Create("http://hris.prangroup.com:8686/api/hrisapi.svc/UserLoginValidate");
                    httpWebRequest.ContentType = "application/json";
                    httpWebRequest.Method = "POST";

                    using (var streamWriter = new System.IO.StreamWriter(httpWebRequest.GetRequestStream()))
                    {
                        string json = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(new
                        {
                            Key = "HR1S019XX78LOGIN",
                            UserName = tbxUserName.Text.Trim(),
                            Password = tbxPassword.Text.Trim()
                        });

                        streamWriter.Write(json);
                    }

                    var httpResponse = (System.Net.HttpWebResponse)httpWebRequest.GetResponse();
                    using (var streamReader = new System.IO.StreamReader(httpResponse.GetResponseStream()))
                    {
                        res = streamReader.ReadToEnd();
                    }
                    if (res == "\"Success\"")
                    {

                        new dalUser().ChangePassword(tbxUserName.Text.Trim(), tbxPassword.Text.Trim());
                        SessionManager.SessionName.UserId = Convert.ToInt32(dtAnyUser.Rows[0]["Id"]);
                        SessionManager.SessionName.UserName = dtAnyUser.Rows[0]["UserName"].ToString();
                        SessionManager.SessionName.RoleId = Convert.ToInt32(dtAnyUser.Rows[0]["RoleId"]);
                        SessionManager.SessionName.RolePriority = Convert.ToInt32(dtAnyUser.Rows[0]["Priority"]);
                        SessionManager.SessionName.PersonId = Convert.ToInt32(dtAnyUser.Rows[0]["PersonId"]);

                        dalTaskManager objTask = new dalTaskManager();
                        DataTable dtTaskList = objTask.GetAllByRoleId(Convert.ToInt32(dtAnyUser.Rows[0]["RoleId"]));
                        SessionManager.SessionName.TaskList = dtTaskList;



                        string returnUrl = "~/Pages/Admin/SiteMap.aspx";
                        if (Request.QueryString["returnUrl"] != null)
                        {
                            returnUrl = Request.QueryString["returnUrl"];
                        }
                        Response.Redirect(returnUrl);
                    }
                    else
                    {
                        FailureText.Text = "Invalid Username or Password";
                    }
                }
                catch (Exception exception)
                {
                    FailureText.Text = exception.Message;
                }
            }
            else
            {
                DataTable dt = objUser.GetLoginInfo(tbxUserName.Text.Trim(), EncryptionDecryption.Encrypt(tbxPassword.Text.Trim(), true));
                if (dt.Rows.Count > 0)
                {
                    SessionManager.SessionName.UserId = Convert.ToInt32(dt.Rows[0]["Id"]);
                    SessionManager.SessionName.UserName = dt.Rows[0]["UserName"].ToString();
                    SessionManager.SessionName.RoleId = Convert.ToInt32(dt.Rows[0]["RoleId"]);
                    SessionManager.SessionName.RolePriority = Convert.ToInt32(dt.Rows[0]["Priority"]);
                    SessionManager.SessionName.PersonId = Convert.ToInt32(dt.Rows[0]["PersonId"]);

                    dalTaskManager objTask = new dalTaskManager();
                    DataTable dtTaskList = objTask.GetAllByRoleId(Convert.ToInt32(dt.Rows[0]["RoleId"]));
                    SessionManager.SessionName.TaskList = dtTaskList;
                    if (Convert.ToInt32(dt.Rows[0]["RoleId"]) == 4)
                    {
                        DataTable dtstudent = new dalStudent().ClassInfoByUserName(dt.Rows[0]["Id"].ToString());
                        {
                            if (dtstudent.Rows.Count > 0)
                            {
                                Common.SessionInfo.StudentId = Convert.ToInt32(dtstudent.Rows[0]["StudentId"].ToString());
                                Common.SessionInfo.StudentToClassId = Convert.ToInt32(dtstudent.Rows[0]["ID"].ToString());
                                Common.SessionInfo.ClassId = Convert.ToInt32(dtstudent.Rows[0]["ClassId"].ToString());
                                Common.SessionInfo.GroupId = Convert.ToInt32(dtstudent.Rows[0]["GroupId"].ToString());
                                Common.SessionInfo.ShiftId = Convert.ToInt32(dtstudent.Rows[0]["ShiftId"].ToString());
                                Common.SessionInfo.SectionId = Convert.ToInt32(dtstudent.Rows[0]["SectionId"].ToString());
                                Common.SessionInfo.RegNo = dtstudent.Rows[0]["RegNo"].ToString();
                            }
                        }
                    }
                    string returnUrl = "~/Pages/Admin/SiteMap.aspx";
                    if (Request.QueryString["returnUrl"] != null)
                    {
                        returnUrl = Request.QueryString["returnUrl"];
                    }
                    Response.Redirect(returnUrl);
                }
                else
                {
                    FailureText.Text = "Invalid Username or Password";
                }
            }
        }
        else
        {
            FailureText.Text = "Invalid Username.";
        }

    }
}