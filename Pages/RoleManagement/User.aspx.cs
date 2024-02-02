using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
public partial class Pages_RoleManagement_User : BasePage
{
    dalUser objUser = new dalUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/RoleManagement/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        else if (!dalCommon.IsPermitted(url))
        {
            Response.Redirect("~/Login.aspx");
        }
        if (Request.QueryString["UN"] != null && Request.QueryString["UN"].ToString().Length > 0)
        {
            Button btnAddEditUser = (Button)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("btnAddEditUser");
            btnAddEditUser.Text = "Edit User";

            TextBox tbxUserName = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("UserName");
            TextBox tbxPassword = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("Password");
            TextBox tbxConfirmPassword = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("ConfirmPassword");
            TextBox tbxQuestion = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("Question");
            TextBox tbxAnswer = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("Answer");
            RequiredFieldValidator PasswordRequired = (RequiredFieldValidator)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("PasswordRequired");
            RequiredFieldValidator ConfirmPasswordRequired = (RequiredFieldValidator)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("ConfirmPasswordRequired");
            RequiredFieldValidator QuestionRequired = (RequiredFieldValidator)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("QuestionRequired");
            RequiredFieldValidator AnswerRequired = (RequiredFieldValidator)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("AnswerRequired");
            Label lblMessage = (Label)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("lblMessage");

            lblMessage.Text = "";
            tbxUserName.Enabled = false;
            tbxPassword.Enabled = false;
            tbxConfirmPassword.Enabled = false;
            tbxQuestion.Enabled = false;
            tbxAnswer.Enabled = false;
            PasswordRequired.ValidationGroup = "";
            ConfirmPasswordRequired.ValidationGroup = "";
            QuestionRequired.ValidationGroup = "";
            AnswerRequired.ValidationGroup = "";
        }

        if (!IsPostBack)
        {

            BindRole();
            LoadUser();
            Button btnAddEditUser = (Button)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("btnAddEditUser");
            TextBox tbxUserName = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("UserName");
            TextBox tbxPassword = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("Password");
            TextBox tbxConfirmPassword = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("ConfirmPassword");
            RequiredFieldValidator PasswordRequired = (RequiredFieldValidator)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("PasswordRequired");
            RequiredFieldValidator ConfirmPasswordRequired = (RequiredFieldValidator)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("ConfirmPasswordRequired");
            RequiredFieldValidator QuestionRequired = (RequiredFieldValidator)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("QuestionRequired");
            RequiredFieldValidator AnswerRequired = (RequiredFieldValidator)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("AnswerRequired");

            if (Request.QueryString["UN"] != null && Request.QueryString["UN"].ToString().Length > 0)
            {
                btnAddEditUser.Text = "Edit User";
                tbxUserName.Enabled = false;
                tbxPassword.Enabled = false;
                tbxConfirmPassword.Enabled = false;
                PasswordRequired.ValidationGroup = "";
                ConfirmPasswordRequired.ValidationGroup = "";
                QuestionRequired.ValidationGroup = "";
                AnswerRequired.ValidationGroup = "";
                LoadControls();
            }
            else
            {
                btnAddEditUser.Text = "Create User";
            }
        }
    }

    private void BindRole()
    {
        DropDownList lbxAssignRole = (DropDownList)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("lbxAssignRole");
        lbxAssignRole.DataSource = new dalRole().GetAllRole();
        lbxAssignRole.DataBind();
    }

    private void LoadControls()
    {
        TextBox tbxUserName = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("UserName");
        TextBox tbxEmail = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("Email");
        DropDownList lbxAssignRole = (DropDownList)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("lbxAssignRole");

        MembershipUser mu = Membership.GetUser(Request.QueryString["UN"].ToString());
        tbxUserName.Text = mu.UserName;
        tbxEmail.Text = mu.Email;
        lbxAssignRole.SelectedValue = Roles.GetRolesForUser(Request.QueryString["UN"].ToString())[0];
    }

    protected void LoadUser()
    {
        //String[] roles = System.Web.Security.Roles.GetRolesForUser();
        //DataTable dt = objUser.GetAll(roles[0].ToString());
        //rptUser.DataSource = dt;
        //rptUser.DataBind();
    }

    protected void btnAddEditUser_Click(object sender, EventArgs e)
    {
        Label lblMessage = (Label)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("lblMessage");
        TextBox tbxUserName = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("UserName");
        TextBox tbxPassword = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("Password");
        TextBox tbxConfirmPassword = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("ConfirmPassword");
        TextBox tbxEmail = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("Email");
        //TextBox tbxQuestion = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("Question");
        //TextBox tbxAnswer = (TextBox)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("Answer");
        DropDownList lbxAssignRole = (DropDownList)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("lbxAssignRole");
        Button btnAddEditUser = (Button)CreateUserWizardStep_1.ContentTemplateContainer.FindControl("btnAddEditUser");

        if (btnAddEditUser.Text == "Create User") // Create
        {
            if (Membership.FindUsersByName(tbxUserName.Text).Count != 0)
            {
                MessageController.Show("User Name Already Exists",MessageType.Error,Page);
                return;
            }
            // Create user
            MembershipCreateStatus mcsStatus;
            Membership.CreateUser(tbxUserName.Text, tbxPassword.Text, tbxEmail.Text, "color", "black", true, out mcsStatus);

            // Insert role
            Roles.AddUserToRole(tbxUserName.Text, lbxAssignRole.SelectedValue);
            new dalPerson().UserInsert(tbxUserName.Text,tbxEmail.Text);
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Error, Page);
        }
        else // Update
        {
            MembershipUser mu = Membership.GetUser(Request.QueryString["UN"].ToString());

            mu.Email = tbxEmail.Text;
            Membership.UpdateUser(mu);

            Roles.RemoveUserFromRole(Request.QueryString["UN"].ToString(), Roles.GetRolesForUser(Request.QueryString["UN"].ToString())[0]);
            Roles.AddUserToRole(tbxUserName.Text, lbxAssignRole.SelectedValue);
        }
    }

    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {

    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
    }
}