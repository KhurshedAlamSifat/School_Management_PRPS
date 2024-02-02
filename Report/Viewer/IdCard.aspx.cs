using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report_Viewer_IdCard : BasePage
{
    dalStudent obj = new dalStudent();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "/Report/Viewer/" + Path.GetFileName(Request.PhysicalPath) + Request.Url.Query;
        if (SessionManager.SessionName.UserName == null)
        {
            dalCommon.LoginReturnUrl(url);
        }
        else if (!dalCommon.IsPermitted("/Pages/Admin/StIdCard.aspx"))
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["Id"]))
            {
                try
                {
                    DataTable dts = obj.GetIdCard(Request.QueryString["Id"]);
                    DataTable dt = ImagConvert(dts);

                    if (dt.Rows.Count > 0)
                    {
                        ReportDocument rdoc = new ReportDocument();
                        var cardDesignFile = SessionManager.SessionName.Branch == 1 ? "~/Report/Designer/IdCard1.rpt" : SessionManager.SessionName.Branch == 2 ? "~/Report/Designer/IdCard2.rpt" : "~/Report/Designer/IdCard3.rpt";
                        rdoc.Load(Server.MapPath(cardDesignFile));
                        rdoc.SetDataSource(dt);
                        BinaryReader stream = new BinaryReader(rdoc.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat));
                        Response.ClearContent();
                        Response.ClearHeaders();
                        Response.ContentType = "application/pdf";
                        Response.BinaryWrite(stream.ReadBytes(Convert.ToInt32(stream.BaseStream.Length)));
                        // Response.AddHeader("Content-Disposition", "attachment; filename=Challan_" + tbxTripID.Text.Trim() + ".pdf");
                        Response.Flush();
                        Response.Close();
                        rdoc.Close();
                        rdoc.Dispose();
                        GC.Collect();

                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
    protected DataTable ImagConvert(DataTable dt)
    {
        DataTable dtn = new DataTable("dtn");
        dtn.Columns.Add("STAFFID");
        dtn.Columns.Add("EMPLOYEENAME");
        dtn.Columns.Add("PHOTO", typeof(Byte[]));
        dtn.Columns.Add("BLOODGROUP");
        foreach (DataRow dr in dt.Rows)
        {
            dtn.Rows.Add(dr["STAFFID"], dr["EMPLOYEENAME"], imageCon(dr["PersonImage"].ToString()), dr["BLOODGROUP"]);
        }

        return dtn;
    }
    protected byte[] imageCon(string imgPath)
    {
        FileStream fp;
        BinaryReader br;
        if (File.Exists(Server.MapPath("~/VariableContent/Person/" + imgPath)))
        {
            fp = new FileStream(Server.MapPath("~/VariableContent/Person/" + imgPath), FileMode.Open);
        }
        else
        {
            fp = new FileStream(Server.MapPath("~/Images/Common/dltgrd.png"), FileMode.Open);
        }
        br = new BinaryReader(fp);
        byte[] imgbyte = new byte[fp.Length + 1];
        imgbyte = br.ReadBytes(Convert.ToInt32((fp.Length)));

        br.Close();
        fp.Close();
        fp.Dispose();
        GC.Collect();
        return imgbyte;
    }
}