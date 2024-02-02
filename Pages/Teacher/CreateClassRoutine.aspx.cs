using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Teacher_CreateClassRoutine : System.Web.UI.Page
{
    dalSubject obj = new dalSubject();
    dalRoutine objRoutine = new dalRoutine();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Pages/Teacher/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        else if (!dalCommon.IsPermitted(url))
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            Load();
            SetInitialRow();
        }
    }
    #region Dynamic Row
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlSubject = (DropDownList)Gridview1.Rows[0].Cells[1].FindControl("ddlSubject");
        ddlSubject.Items.Clear();
        FillDropDownList(ddlSubject);
    }
    private ArrayList GetDummyData()
    {
        ArrayList arr = new ArrayList();
        DataTable dt = obj.GetByClassId(Convert.ToInt32(ddlClass.SelectedValue));
        foreach (DataRow dr in dt.Rows)
        {
            arr.Add(new ListItem(dr["SubjectName"].ToString(), dr["ID"].ToString()));
        }
        return arr;
    }

    private void FillDropDownList(DropDownList ddl)
    {
        ArrayList arr = GetDummyData();
        foreach (ListItem item in arr)
        {
            ddl.Items.Add(item);
        }
    }


    private ArrayList GetTeacher()
    {
        ArrayList arr = new ArrayList();
        DataTable dt = new dalTeacher().GetAll();
        foreach (DataRow dr in dt.Rows)
        {
            arr.Add(new ListItem(dr["NameEng"].ToString(), dr["Id"].ToString()));
        }
        return arr;
    }

    private void LoadTeacher(DropDownList ddl)
    {
        ArrayList arr = GetTeacher();
        foreach (ListItem item in arr)
        {
            ddl.Items.Add(item);
        }
    }

    protected DataTable GetRoutine()
    {
        DataTable dt = new DataTable("dtRoutine");
        dt.Columns.Add(new DataColumn("PeriodNo", typeof(int)));
        dt.Columns.Add(new DataColumn("SubjectId", typeof(int)));
        dt.Columns.Add(new DataColumn("StartTime", typeof(string)));
        dt.Columns.Add(new DataColumn("EndTime", typeof(string)));
        dt.Columns.Add(new DataColumn("Teacher", typeof(int)));
        return dt;
    }

    private void SetInitialRow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("PeriodNo", typeof(int)));
        dt.Columns.Add(new DataColumn("SubjectId", typeof(int)));
        dt.Columns.Add(new DataColumn("StartTime", typeof(string)));
        dt.Columns.Add(new DataColumn("EndTime", typeof(string)));
        dt.Columns.Add(new DataColumn("Teacher", typeof(int)));
        dr = dt.NewRow();
        dr["PeriodNo"] = 1;
        dr["StartTime"] = string.Empty;
        dr["EndTime"] = string.Empty;
        dt.Rows.Add(dr);
        //Store the DataTable in ViewState for future reference   
        ViewState["CurrentTable"] = dt;
        //Bind the Gridview   
        Gridview1.DataSource = dt;
        Gridview1.DataBind();
        //After binding the gridview, we can then extract and fill the DropDownList with Data   
        DropDownList ddl1 = (DropDownList)Gridview1.Rows[0].Cells[1].FindControl("ddlSubject");
        DropDownList ddl2 = (DropDownList)Gridview1.Rows[0].Cells[4].FindControl("ddlTeacher");
        FillDropDownList(ddl1);
        LoadTeacher(ddl2);
    }

    private void AddNewRowToGrid()
    {
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;

            if (dtCurrentTable.Rows.Count > 0)
            {
                drCurrentRow = dtCurrentTable.NewRow();
                drCurrentRow["PeriodNo"] = dtCurrentTable.Rows.Count + 1;

                //add new row to DataTable   
                dtCurrentTable.Rows.Add(drCurrentRow);
                //Store the current data to ViewState for future reference   

                ViewState["CurrentTable"] = dtCurrentTable;


                for (int i = 0; i < dtCurrentTable.Rows.Count - 1; i++)
                {

                    //extract the TextBox values   

                    TextBox box1 = (TextBox)Gridview1.Rows[i].Cells[1].FindControl("TextBox1");
                    TextBox box2 = (TextBox)Gridview1.Rows[i].Cells[2].FindControl("TextBox2");

                    dtCurrentTable.Rows[i]["StartTime"] = box1.Text;
                    dtCurrentTable.Rows[i]["EndTime"] = box2.Text;

                    //extract the DropDownList Selected Items   

                    DropDownList ddl1 = (DropDownList)Gridview1.Rows[i].Cells[3].FindControl("ddlSubject");
                    DropDownList ddl2 = (DropDownList)Gridview1.Rows[i].Cells[4].FindControl("ddlTeacher");

                    // Update the DataRow with the DDL Selected Items   

                    dtCurrentTable.Rows[i]["SubjectId"] = ddl1.SelectedValue;
                    dtCurrentTable.Rows[i]["Teacher"] = ddl2.SelectedValue;

                }

                //Rebind the Grid with the current data to reflect changes   
                Gridview1.DataSource = dtCurrentTable;
                Gridview1.DataBind();
            }
        }
        else
        {
            Response.Write("ViewState is null");

        }
        //Set Previous Data on Postbacks   
        SetPreviousData();
    }

    private void SetPreviousData()
    {

        int rowIndex = 0;
        if (ViewState["CurrentTable"] != null)
        {

            DataTable dt = (DataTable)ViewState["CurrentTable"];
            if (dt.Rows.Count > 0)
            {

                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    TextBox box1 = (TextBox)Gridview1.Rows[i].Cells[2].FindControl("TextBox1");
                    TextBox box2 = (TextBox)Gridview1.Rows[i].Cells[3].FindControl("TextBox2");

                    DropDownList ddl1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[1].FindControl("ddlSubject");
                    DropDownList ddl2 = (DropDownList)Gridview1.Rows[rowIndex].Cells[4].FindControl("ddlTeacher");

                    FillDropDownList(ddl1);
                    LoadTeacher(ddl2);

                    if (i < dt.Rows.Count - 1)
                    {

                        //Assign the value from DataTable to the TextBox   
                        box1.Text = dt.Rows[i]["StartTime"].ToString();
                        box2.Text = dt.Rows[i]["EndTime"].ToString();

                        //Set the Previous Selected Items on Each DropDownList  on Postbacks   
                        ddl1.ClearSelection();
                        ddl1.SelectedValue = dt.Rows[i]["SubjectId"].ToString();
                        //ddl1.Items.FindByText(dt.Rows[i]["SubjectId"].ToString()).Selected = true;

                        ddl2.ClearSelection();
                        ddl2.SelectedValue = dt.Rows[i]["Teacher"].ToString();
                        //ddl2.Items.FindByText(dt.Rows[i]["Teacher"].ToString()).Selected = true;

                    }

                    rowIndex++;
                }
            }
        }
    }
    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        AddNewRowToGrid();
    }

    protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];
            LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton1");
            if (lb != null)
            {
                if (dt.Rows.Count > 1)
                {
                    if (e.Row.RowIndex == dt.Rows.Count - 1)
                    {
                        lb.Visible = false;
                    }
                }
                else
                {
                    lb.Visible = false;
                }
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
        int rowID = gvRow.RowIndex;
        if (ViewState["CurrentTable"] != null)
        {

            DataTable dt = (DataTable)ViewState["CurrentTable"];
            if (dt.Rows.Count > 1)
            {
                if (gvRow.RowIndex < dt.Rows.Count - 1)
                {
                    //Remove the Selected Row data and reset row number  
                    dt.Rows.Remove(dt.Rows[rowID]);
                    ResetRowID(dt);
                }
            }

            //Store the current data in ViewState for future reference  
            ViewState["CurrentTable"] = dt;

            //Re bind the GridView for the updated data  
            Gridview1.DataSource = dt;
            Gridview1.DataBind();
        }

        //Set Previous Data on Postbacks  
        SetPreviousData();
    }

    private void ResetRowID(DataTable dt)
    {
        int rowNumber = 1;
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                row[0] = rowNumber;
                rowNumber++;
            }
        }
    }
    #endregion

    #region Load Data
    protected void Load()
    {
        ddlYear.DataSource = new Common().GetAll("bs_Year");
        ddlYear.DataBind();

        ddlClass.DataSource = new Common().GetAll("bs_ClassName");
        ddlClass.DataBind();

        ddlGroup.DataSource = new Common().GetAll("bs_Group");
        ddlGroup.DataBind();

        ddlShift.DataSource = new Common().GetAll("bs_Shift");
        ddlShift.DataBind();

        ddlSection.DataSource = new Common().GetAll("bs_Section");
        ddlSection.DataBind();
        DataTable dt = new dalYear().GetDefault();
        if (dt.Rows.Count > 0)
        {
            ddlYear.SelectedValue = dt.Rows[0][0].ToString();
        }

    }

    #endregion

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            int period = 1;
            DataTable dt = GetRoutine();
            foreach (GridViewRow gr in Gridview1.Rows)
            {
                TextBox box1 = (TextBox)gr.Cells[2].FindControl("TextBox1");
                TextBox box2 = (TextBox)gr.Cells[3].FindControl("TextBox2");
                DropDownList ddl1 = (DropDownList)gr.Cells[1].FindControl("ddlSubject");
                DropDownList ddl2 = (DropDownList)gr.Cells[4].FindControl("ddlTeacher");
                dt.Rows.Add(period++, ddl1.SelectedValue, box1.Text, box2.Text, ddl2.SelectedValue);
            }
            if (dt.Rows.Count > 0)
            {
                objRoutine.ClassRoutineInsert(dt, Convert.ToInt32(ddlYear.SelectedItem.Text), Convert.ToInt32(ddlClass.SelectedValue), Convert.ToInt32(ddlGroup.SelectedValue),
                    Convert.ToInt32(ddlShift.SelectedValue), Convert.ToInt32(ddlSection.SelectedValue), ddlDay.SelectedItem.Text);
            }
            MessageController.Show(MessageCode.SaveSucceeded, MessageType.Information, Page);
        }
        catch
        {
            MessageController.Show(MessageCode.ErrorLog_ClearFailed, MessageType.Error, Page);
        }
    }
}