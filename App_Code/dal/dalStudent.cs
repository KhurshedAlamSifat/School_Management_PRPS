using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;

/// <summary>
/// Summary description for dalStudent
/// </summary>
public class dalStudent
{
    DatabaseManager dm = new DatabaseManager();
    public dalStudent()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int StudentToClass(int studentId, string year, int classId, int groupId, int shiftId, int sectionId, int rollNo)
    {
        dm.AddParameteres("@StudentId", studentId);
        dm.AddParameteres("@Year", year);
        dm.AddParameteres("@ClassId", classId);
        dm.AddParameteres("@GroupId", groupId);
        dm.AddParameteres("@ShiftId", shiftId);
        dm.AddParameteres("@SectionId", sectionId);
        dm.AddParameteres("@RollNo", rollNo);
        DataTable dt = dm.ExecuteQuery("USP_StudentToClass_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }

    public DataTable GetIdCard(string RegNo)
    {
        try
        {
            dm.AddParameteres("@RegNo", RegNo);
            return dm.ExecuteQuery("USP_Student_IDCard");
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    public int StudentToClassUpdate(int studentId, string year, int classId, int groupId, int shiftId, int sectionId, int rollNo)
    {
        dm.AddParameteres("@StudentId", studentId);
        dm.AddParameteres("@Year", year);
        dm.AddParameteres("@ClassId", classId);
        dm.AddParameteres("@GroupId", groupId);
        dm.AddParameteres("@ShiftId", shiftId);
        dm.AddParameteres("@SectionId", sectionId);
        dm.AddParameteres("@RollNo", rollNo);
        return dm.ExecuteNonQuery("USP_StudentToClass_Update");
    }
    public int UpdateIDCard(int studentId, string CardNo)
    {
        dm.AddParameteres("@StudentId", studentId);
        dm.AddParameteres("@CardNo", CardNo);
        return dm.ExecuteNonQuery("USP_StudentIdCard_Update");
    }
    public int StudentToClassXml(DataTable dt, string year, int classId, int groupId, int shiftId, int sectionId)
    {
        DataSet ds = new DataSet("dsAssign");
        ds.Tables.Add(dt);
        string xml = ds.GetXml();
        dm.AddParameteres("@XML", xml);
        dm.AddParameteres("@Year", year);
        dm.AddParameteres("@ClassId", classId);
        dm.AddParameteres("@GroupId", groupId);
        dm.AddParameteres("@ShiftId", shiftId);
        dm.AddParameteres("@SectionId", sectionId);
        return dm.ExecuteNonQuery("USP_StudentToClass_InsertXML");
    }

    public int Insert(int personId, string regNo, DateTime addmissionDate, string addmissionYear, string createdBy, DateTime createdDate, long AppId)
    {
        dm.AddParameteres("@PersonId", personId);
        dm.AddParameteres("@RegNo", regNo);
        dm.AddParameteres("@AddmissionDate", addmissionDate);
        dm.AddParameteres("@AddmissionYear", addmissionYear);
        dm.AddParameteres("@CreatedBy", createdBy);
        dm.AddParameteres("@CreatedDate", createdDate);
        dm.AddParameteres("@ApplicationId", AppId);
        DataTable dt = dm.ExecuteQuery("USP_Student_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }

    public DataTable GetByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_Student_GetByCriteria");
    }
    public DataTable GetDetailByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_StudentDetail_GetByCriteria");
    }

    public DataTable UnassignStudent(string year)
    {
        dm.AddParameteres("@Year", year);
        return dm.ExecuteQuery("USP_Student_UnassignStudent");
    }
    public DataTable GetStudentInformation(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_Student_GetInformationByCriteria");
    }
    public DataTable GetRptStudentInformation(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_Report_StudentInfo");
    }
    public DataTable GetStudentSubjectWise(int classId, int groupId, int subjectId)
    {
        dm.AddParameteres("@ClassId", classId);
        dm.AddParameteres("@GroupId", groupId);
        dm.AddParameteres("@SubjectId", subjectId);
        return dm.ExecuteQuery("USP_Student_GetStudentSubjectWise");
    }

    public int AttendenceInsert(DataTable dt, string year, string month, string createdBy, DateTime date)
    {
        foreach (DataRow dr in dt.Rows)
        {
            dm.AddParameteres("@Year", year);
            dm.AddParameteres("@Month", month);
            dm.AddParameteres("@CreatedBy", createdBy);
            dm.AddParameteres("@Date", date);
            dm.AddParameteres("@StudentToClassId", dr["StId"]);
            dm.AddParameteres("@IsPresent", dr["Present"]);
            dm.AddParameteres("@AttendenceType", dr["TypeAtt"]);
            dm.ExecuteNonQuery("USP_Student_AttendenceInsert");
        }
        // return dm.ExecuteNonQuery("USP_Student_AttendenceInsertXML");

        return 1;
    }
    public int AttendenceSendMail(DataTable dt)
    {
        foreach (DataRow dr in dt.Rows)
        {
            var Email = dr["Email"].ToString();
            if (!string.IsNullOrEmpty(Email))
            {
                var NameEng = dr["NameEng"].ToString();
                var ClassName = dr["ClassName"].ToString();
                var GroupName = dr["GroupName"].ToString();
                var Shift = dr["Shift"].ToString();
                var Section = dr["Section"].ToString();
                var Present = Convert.ToBoolean(dr["Present"]);
                var PresentOrAbsent = Present ? "PRESENT" : "ABSENT";
                var emailSubject = "PRPS Attendance Notifiaciton";
                var emailBody = "<html><head><meta content='text/html; charset=UTF-8' http-equiv='content-type'><style type='text/css'>ol{margin:0;padding:0}table td,table th{padding:0}" +
                ".c3{color:#000000;font-weight:400;text-decoration:none;vertical-align:baseline;font-size:11pt;font-family:'Arial';font-style:normal}.c2{padding-top:12pt" +
                ";padding-bottom:12pt;line-height:1.15;orphans:2;widows:2;text-align:left}.c0{padding-top:0pt;padding-bottom:0pt;line-height:1.15;orphans:2;widows:2;text" +
                "-align:left}.c6{color:#000000;text-decoration:none;vertical-align:baseline;font-style:normal}.c1{background-color:#ffffff;max-width:468pt;padding:72pt 7" +
                "2pt 72pt 72pt}.c7{font-size:12pt;font-family:'Times New Roman';font-weight:700}.c5{font-size:12pt;font-family:'Times New Roman';font-weight:400}.c4{heig" +
                "ht:11pt}.title{padding-top:0pt;color:#000000;font-size:26pt;padding-bottom:3pt;font-family:'Arial';line-height:1.15;page-break-after:avoid;orphans:2;wid" +
                "ows:2;text-align:left}.subtitle{padding-top:0pt;color:#666666;font-size:15pt;padding-bottom:16pt;font-family:'Arial';line-height:1.15;page-break-after:a" +
                "void;orphans:2;widows:2;text-align:left}li{color:#000000;font-size:11pt;font-family:'Arial'}p{margin:0;color:#000000;font-size:11pt;font-family:'Arial'}" +
                "h1{padding-top:20pt;color:#000000;font-size:20pt;padding-bottom:6pt;font-family:'Arial';line-height:1.15;page-break-after:avoid;orphans:2;widows:2;text-" +
                "align:left}h2{padding-top:18pt;color:#000000;font-size:16pt;padding-bottom:6pt;font-family:'Arial';line-height:1.15;page-break-after:avoid;orphans:2;wid" +
                "ows:2;text-align:left}h3{padding-top:16pt;color:#434343;font-size:14pt;padding-bottom:4pt;font-family:'Arial';line-height:1.15;page-break-after:avoid;or" +
                "phans:2;widows:2;text-align:left}h4{padding-top:14pt;color:#666666;font-size:12pt;padding-bottom:4pt;font-family:'Arial';line-height:1.15;page-break-aft" +
                "er:avoid;orphans:2;widows:2;text-align:left}h5{padding-top:12pt;color:#666666;font-size:11pt;padding-bottom:4pt;font-family:'Arial';line-height:1.15;pag" +
                "e-break-after:avoid;orphans:2;widows:2;text-align:left}h6{padding-top:12pt;color:#666666;font-size:11pt;padding-bottom:4pt;font-family:'Arial';line-heig" +
                "ht:1.15;page-break-after:avoid;font-style:italic;orphans:2;widows:2;text-align:left}</style></head><body class='c1'><p class='c0'><span class='c3'>Dear " +
                "Concern,</span></p><p class='c2'><span class='c7'>" + NameEng + "</span><span class='c5'>, Student of Class Four &nbsp;was </span><span class='c7'>" + PresentOrAbsent + "" +
                "</span><span class='c5'>&nbsp;today </span><span class='c7'>[" + DateTime.Now.ToString("dd/MM/yy") + "]</span><span class='c5 c6'>&nbsp;in PRAN RFL Public School. </span></p><p class='c2'><spa" +
                "n class='c6 c5'>Thank You,</span></p><p class='c2'><span class='c6 c5'>PRPS</span></p><p class='c0 c4'><span class='c3'></span></p></body></html>";

                SendEmail.Send_3(Email, emailSubject, emailBody);
            }
        }
        return 1;
    }
    public int AttendenceSendSMS(DataTable dt)
    {
        foreach (DataRow dr in dt.Rows)
        {
            var Mobile = dr["Mobile"].ToString();
            var Present = Convert.ToBoolean(dr["Present"]);

            if (!string.IsNullOrEmpty(Mobile) && Present != true)
            {
                var NameEng = dr["NameEng"].ToString();
                var ClassName = dr["ClassName"].ToString();
                var PresentOrAbsent = Present ? "PRESENT" : "ABSENT";
                var smsBody = NameEng + ", Student of Class " + ClassName + " was " + PresentOrAbsent + " today [11/06/22] in PRPS.";
                dalCommon.SendSMS("", "", "", Mobile, smsBody);
            }

        }
        return 1;
    }

    public DataTable GetByPersonId(int personId)
    {
        dm.AddParameteres("@PersonId", personId);
        return dm.ExecuteQuery("USP_Student_GetByPersonId");
    }

    public DataTable GetByStudentId(int Id)
    {
        dm.AddParameteres("@Id", Id);
        return dm.ExecuteQuery("USP_Student_GetById");
    }

    public DataTable GetStudentForAllClass(int year)
    {
        dm.AddParameteres("@Year", year);
        return dm.ExecuteQuery("USP_Student_GetByAllClass");
    }

    public DataTable GetStudentForMarksEntry(string criteria, int subjectId)
    {
        dm.AddParameteres("@Criteria", criteria);
        dm.AddParameteres("@SubjectId", subjectId);
        return dm.ExecuteQuery("USP_Student_GetWhoseMarksNotEntry");
    }
    public DataTable GetStudentForMarksEdit(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_Student_GetForMarksEdit");
    }
    public DataTable ClassInfoByUserName(string userName)
    {
        dm.AddParameteres("@UserId", userName);
        return dm.ExecuteQuery("USP_Student_ClassInfoByUserId");
    }

    public DataTable ClassInfoByUserId(int userId)
    {
        dm.AddParameteres("@UserId", userId);
        return dm.ExecuteQuery("USP_Student_ClassInfoByUserId");
    }

    public DataTable GetAttendenceByCriteria(string criteria, int studentToClassId)
    {
        dm.AddParameteres("@Criteria", criteria);
        dm.AddParameteres("@StudentToClassId", studentToClassId);
        return dm.ExecuteQuery("USP_Student_GetAttendenceByCriteria");
    }

    public DataTable AttendenceByDateAndCriteria(DateTime date, int attendanceType)
    {
        dm.AddParameteres("@Date", date);
        dm.AddParameteres("@AttendanceType", attendanceType);
        return dm.ExecuteQuery("USP_Student_AttendenceByDateAndType");
    }
    public int StudentBasicInformationInsert(string nameEn, string nameBd, int gender, int religionId, DateTime dob, string birthCertificate, string phone
        , string mobile, string phnHome, string mobileHome, int bloodGroup, string userName)
    {
        dm.AddParameteres("@NameEng", nameEn);
        dm.AddParameteres("@NameBan", nameBd);
        dm.AddParameteres("@GenderId", gender);
        dm.AddParameteres("@ReligionId", religionId);
        dm.AddParameteres("@DateofBirth", dob);
        dm.AddParameteres("@BirthCertificate", birthCertificate);
        dm.AddParameteres("@PhoneNo", phone);
        dm.AddParameteres("@Mobile", mobile);
        dm.AddParameteres("@PhoneHome", phnHome);
        dm.AddParameteres("@MobileHome", mobileHome);
        dm.AddParameteres("@BloodGroup", bloodGroup);
        dm.AddParameteres("@UserName", userName);
        DataTable dt = dm.ExecuteQuery("USP_Student_BasicInformationInsert");
        return Convert.ToInt32(dt.Rows[0][0].ToString());
    }
    public DataTable GetRollByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_Student_GetLastRoll");
    }
    public string GetStudentRegNo(int ClassId, string year)
    {

        DataTable dtClass = new dalClass().GetById(ClassId);
        int Class = Convert.ToInt32(dtClass.Rows[0]["ClassNumber"]);
        string cls = Class.ToString();
        if (Class < 100)
        {
            cls = "00" + Class.ToString();
        }
        string id = "";
        year = year.Substring(2, 2);
        string month = (DateTime.Now.Month).ToString();
        DataTable dt = dm.ExecuteQuery("USP_Student_RegNo");
        string RegNo = "11" + year + cls + "000001";
        int stId = 0;
        if (dt.Rows.Count > 0)
        {
            stId = Convert.ToInt32(dt.Rows[0]["RegNos"]);
            stId += 1;
            if (stId < 10)
            {
                id = "00000" + stId.ToString();
            }
            else if (stId < 100)
            {
                id = "0000" + stId.ToString();
            }
            else if (stId < 1000)
            {
                id = "000" + stId.ToString();
            }
            else if (stId < 10000)
            {
                id = "00" + stId.ToString();
            }
            else if (stId < 100000)
            {
                id = "0" + stId.ToString();
            }
            else
            {
                id = stId.ToString();
            }
            if (dt.Rows.Count > 0)
            {
                RegNo = "11" + year + cls + id;
            }
        }


        return RegNo;
    }

    public void UpdateRegNo(int PersonId, string RegNo)
    {
        dm.AddParameteres("@PersonId", PersonId);
        dm.AddParameteres("@RegNo", RegNo);
        dm.ExecuteNonQuery("USP_UpdateRegNo");
    }
    public void StudentTC(string RegNo, string reason)
    {
        dm.AddParameteres("@RegNo", RegNo);
        dm.AddParameteres("@Remarks", reason);
        dm.ExecuteNonQuery("USP_TC_Insert");
    }
}