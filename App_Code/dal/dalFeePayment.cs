
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalLibrary
/// </summary>
public class dalFeePayment
{
    DatabaseManager dm = new DatabaseManager();
    public dalFeePayment()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region FeeHead
    public DataRow FeeHead_Insert(
          string FcCode
        , string FullName
        , string DisplayName
        , int ClassId
        , string ChargeBy
        , string IsActive_ForWaiver
        , decimal DefaultAmount
        , int PriorityOrder
        , string IsActive
        , string IsActive_ForDueGenerationBySytem
        , string CreatedBy
        )
    {
        dm.AddParameteres("@FcCode", FcCode);
        dm.AddParameteres("@FullName", FullName);
        dm.AddParameteres("@DisplayName", DisplayName);
        if (ClassId != 0)
        {
            dm.AddParameteres("@ClassId", ClassId);
        }
        else
        {
            dm.AddParameteres("@ClassId", DBNull.Value);
        }
        dm.AddParameteres("@ChargeBy", ChargeBy);
        dm.AddParameteres("@IsActive_ForWaiver", IsActive_ForWaiver);
        dm.AddParameteres("@DefaultAmount", DefaultAmount);
        dm.AddParameteres("@PriorityOrder", PriorityOrder);
        dm.AddParameteres("@IsActive", IsActive);
        dm.AddParameteres("@IsActive_ForDueGenerationBySytem", IsActive_ForDueGenerationBySytem);
        dm.AddParameteres("@CreatedBy", CreatedBy);

        DataTable dt = dm.ExecuteQuery("USP_FeeHead_Insert");
        return dt.Rows[0];
    }
    public DataRow FeeHead_Update(
              int Id
            , string FcCode
            , string FullName
            , string DisplayName
            , int ClassId
            , string ChargeBy
            , string IsActive_ForWaiver
            , decimal DefaultAmount
            , int PriorityOrder
            , string IsActive
            , string IsActive_ForDueGenerationBySytem
            , string UpdatedBy
            )
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@FcCode", FcCode);
        dm.AddParameteres("@FullName", FullName);
        dm.AddParameteres("@DisplayName", DisplayName);
        if (ClassId != 0)
        {
            dm.AddParameteres("@ClassId", ClassId);
        }
        else
        {
            dm.AddParameteres("@ClassId", DBNull.Value);
        }
        dm.AddParameteres("@ChargeBy", ChargeBy);
        dm.AddParameteres("@IsActive_ForWaiver", IsActive_ForWaiver);
        dm.AddParameteres("@DefaultAmount", DefaultAmount);
        dm.AddParameteres("@PriorityOrder", PriorityOrder);
        dm.AddParameteres("@IsActive", IsActive);
        dm.AddParameteres("@IsActive_ForDueGenerationBySytem", IsActive_ForDueGenerationBySytem);
        dm.AddParameteres("@UpdatedBy", UpdatedBy);


        DataTable dt = dm.ExecuteQuery("USP_FeeHead_Update");
        return dt.Rows[0];
    }


    public DataTable FeeHead_GetByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_FeeHead_GetByCriteria");
    }
    #endregion

    #region StudentFeeMapping
    public DataRow StudentFeeMapping_InsertOrUpdate(
          int Id
        , int StudentId
        , int FeeHeadId
        , decimal DefaultAmount
        , decimal WaiverPercentage
        , decimal ConsumptionUnit
        , decimal FullAmount
        , decimal AppliedAmount
        , string IsActive
        , string EntryBy
        )
    {
        if (Id != 0)
        {
            dm.AddParameteres("@Id", Id);
        }
        else
        {
            dm.AddParameteres("@Id", DBNull.Value);
        }
        dm.AddParameteres("@StudentId", StudentId);
        dm.AddParameteres("@FeeHeadId", FeeHeadId);
        dm.AddParameteres("@DefaultAmount", DefaultAmount);
        if (WaiverPercentage != -1)
        {
            dm.AddParameteres("@WaiverPercentage", WaiverPercentage);
        }
        else
        {
            dm.AddParameteres("@WaiverPercentage", DBNull.Value);
        }
        if (ConsumptionUnit != -1)
        {
            dm.AddParameteres("@ConsumptionUnit", ConsumptionUnit);
        }
        else
        {
            dm.AddParameteres("@ConsumptionUnit", DBNull.Value);
        }
        dm.AddParameteres("@FullAmount", FullAmount);
        dm.AddParameteres("@AppliedAmount", AppliedAmount);
        dm.AddParameteres("@IsActive", IsActive);
        dm.AddParameteres("@EntryBy", EntryBy);

        DataTable dt = dm.ExecuteQuery("USP_StudentFeeMapping_InsertOrUpdate");
        return dt.Rows[0];
    }
    public DataTable StudentFeeMapping_Setup_GetByCriteria(string ClassId, string FeeHeadId, string GroupId = "", string ShiftId = "", string SectionId = "", string RegistrationNumber = "")
    {

        dm.AddParameteres("@ClassId", ClassId);
        dm.AddParameteres("@FeeHeadId", FeeHeadId);

        if (!string.IsNullOrEmpty(GroupId))
        {
            dm.AddParameteres("@GroupId", GroupId);
        }
        if (!string.IsNullOrEmpty(ShiftId))
        {
            dm.AddParameteres("@ShiftId", ShiftId);
        }
        if (!string.IsNullOrEmpty(SectionId))
        {
            dm.AddParameteres("@SectionId", SectionId);
        }
        if (!string.IsNullOrEmpty(RegistrationNumber))
        {
            dm.AddParameteres("@RegistrationNumber", RegistrationNumber);
        }
        return dm.ExecuteQuery("USP_StudentFeeMapping_Setup_GetByCriteria");
    }

    public DataTable StudentFeeMapping_GetByCriteria(
        string FeeHeadIsActive
        , string StudentFeeMappingIsActive
        , string ClassId = ""
        , string FeeHeadId = ""
        , string GroupId = ""
        , string ShiftId = ""
        , string SectionId = ""
        , string RegistrationNumber = ""
        , string FeeHeadIsActive_ForDueGenerationBySytem = ""

      )
    {
        dm.AddParameteres("@FeeHeadIsActive", FeeHeadIsActive);
        dm.AddParameteres("@StudentFeeMappingIsActive", StudentFeeMappingIsActive);

        if (!string.IsNullOrEmpty(ClassId))
        {
            dm.AddParameteres("@ClassId", ClassId);
        }
        if (!string.IsNullOrEmpty(FeeHeadId))
        {
            dm.AddParameteres("@FeeHeadId", FeeHeadId);
        }
        if (!string.IsNullOrEmpty(GroupId))
        {
            dm.AddParameteres("@GroupId", GroupId);
        }
        if (!string.IsNullOrEmpty(ShiftId))
        {
            dm.AddParameteres("@ShiftId", ShiftId);
        }
        if (!string.IsNullOrEmpty(SectionId))
        {
            dm.AddParameteres("@SectionId", SectionId);
        }
        if (!string.IsNullOrEmpty(RegistrationNumber))
        {
            dm.AddParameteres("@RegistrationNumber", RegistrationNumber);
        }
        if (!string.IsNullOrEmpty(FeeHeadIsActive_ForDueGenerationBySytem))
        {
            dm.AddParameteres("@FeeHeadIsActive_ForDueGenerationBySytem", FeeHeadIsActive_ForDueGenerationBySytem);
        }
        return dm.ExecuteQuery("USP_StudentFeeMapping_GetByCriteria");
    }
    #endregion

    #region StudentDue
    public DataRow StudentDue_Insert_BySystem(
          string TransectionIdentifier
        , int EffectiveYear
        , int EffectiveMonthSerial
        , int StudentId
        , int FeeHeadId
        , decimal DefaultAmount
        , decimal ConsumptionUnit
        , decimal WaiverPercentage
        , decimal FullAmount
        , decimal AppliedAmount
        , string ChargeBy
        , string ShortStatus
        , string LongStatus
        , string EntryBy
        , int StudentFeeMappingId
        , string Note
        , string DeveloperNote
        )
    {
        dm.AddParameteres("@TransectionIdentifier", TransectionIdentifier);
        dm.AddParameteres("@EffectiveYear", EffectiveYear);
        dm.AddParameteres("@EffectiveMonthSerial", EffectiveMonthSerial);
        dm.AddParameteres("@StudentId", StudentId);
        dm.AddParameteres("@FeeHeadId", FeeHeadId);
        dm.AddParameteres("@DefaultAmount", DefaultAmount);
        if (ConsumptionUnit != -1)
        {
            dm.AddParameteres("@ConsumptionUnit", ConsumptionUnit);
        }
        else
        {
            dm.AddParameteres("@ConsumptionUnit", DBNull.Value);
        }
        if (WaiverPercentage != -1)
        {
            dm.AddParameteres("@WaiverPercentage", WaiverPercentage);
        }
        else
        {
            dm.AddParameteres("@WaiverPercentage", DBNull.Value);
        }
        dm.AddParameteres("@FullAmount", FullAmount);
        dm.AddParameteres("@AppliedAmount", AppliedAmount);
        dm.AddParameteres("@ChargeBy", ChargeBy);
        dm.AddParameteres("@ShortStatus", ShortStatus);
        dm.AddParameteres("@LongStatus", LongStatus);
        dm.AddParameteres("@EntryBy", EntryBy);
        dm.AddParameteres("@StudentFeeMappingId", StudentFeeMappingId);
        dm.AddParameteres("@Note", Note);
        dm.AddParameteres("@DeveloperNote", DeveloperNote);

        DataTable dt = dm.ExecuteQuery("USP_StudentDue_InsertBySystem");
        return dt.Rows[0];
    }
    public DataRow StudentFeeMapping_GetAppliedAmount(int FeeHeadId, int StudentId)
    {
        dm.AddParameteres("@FeeHeadId", FeeHeadId);
        dm.AddParameteres("@StudentId", StudentId);

        DataTable dt = dm.ExecuteQuery("USP_StudentFeeMapping_GetAppliedAmount");
        return dt.Rows[0];
    }
    public DataRow StudentDue_Insert_ByUser(
          string TransectionIdentifier
        , bool IsMultipleEntry
        , int EffectiveYear
        , int EffectiveMonthSerial
        , int StudentId
        , int FeeHeadId
        , decimal DefaultAmount
        , decimal ConsumptionUnit
        , decimal WaiverPercentage
        , decimal FullAmount
        , decimal AppliedAmount
        , string ChargeBy
        , string ShortStatus
        , string LongStatus
        , string EntryBy
        , int StudentFeeMappingId
        , string Note
        , string DeveloperNote
        )
    {
        dm.AddParameteres("@TransectionIdentifier", TransectionIdentifier);
        dm.AddParameteres("@IsMultipleEntry", IsMultipleEntry);
        dm.AddParameteres("@EffectiveYear", EffectiveYear);
        dm.AddParameteres("@EffectiveMonthSerial", EffectiveMonthSerial);
        dm.AddParameteres("@StudentId", StudentId);
        dm.AddParameteres("@FeeHeadId", FeeHeadId);
        dm.AddParameteres("@DefaultAmount", DefaultAmount);
        if (ConsumptionUnit != -1)
        {
            dm.AddParameteres("@ConsumptionUnit", ConsumptionUnit);
        }
        else
        {
            dm.AddParameteres("@ConsumptionUnit", DBNull.Value);
        }
        if (WaiverPercentage != -1)
        {
            dm.AddParameteres("@WaiverPercentage", WaiverPercentage);
        }
        else
        {
            dm.AddParameteres("@WaiverPercentage", DBNull.Value);
        }
        dm.AddParameteres("@FullAmount", FullAmount);
        dm.AddParameteres("@AppliedAmount", AppliedAmount);
        dm.AddParameteres("@ChargeBy", ChargeBy);
        dm.AddParameteres("@ShortStatus", ShortStatus);
        dm.AddParameteres("@LongStatus", LongStatus);
        dm.AddParameteres("@EntryBy", EntryBy);
        if (StudentFeeMappingId != -1)
        {
            dm.AddParameteres("@StudentFeeMappingId", StudentFeeMappingId);
        }
        else
        {
            dm.AddParameteres("@StudentFeeMappingId", DBNull.Value);
        }
        dm.AddParameteres("@Note", Note);
        dm.AddParameteres("@DeveloperNote", DeveloperNote);

        DataTable dt = dm.ExecuteQuery("USP_StudentDue_InsertByUser");
        return dt.Rows[0];
    }
    public DataTable StudentDue_Transectional_GetByCriteria(
        string ClassId = "",
        string FeeHeadId = "",
        string GroupId = "",
        string ShiftId = "",
        string SectionId = "",
        string StudentId = "",
        string RegistrationNumber = "",
        string EffectiveYearAndMonthSeeialFrom = "",
        string EffectiveYearAndMonthSeeialTo = "",
        string ShortStatus = "",
        string PaidDateFrom = "",
        string PaidDateTo = "",
        string TransectionIdentifier = "",
        string Invoice_TransectionIdentifier = "",
        string Invoice_TrackingId = "")
    {
        if (!string.IsNullOrEmpty(ClassId))
        {
            dm.AddParameteres("@ClassId", ClassId);
        }
        if (!string.IsNullOrEmpty(FeeHeadId))
        {
            dm.AddParameteres("@FeeHeadId", FeeHeadId);
        }
        if (!string.IsNullOrEmpty(GroupId))
        {
            dm.AddParameteres("@GroupId", GroupId);
        }
        if (!string.IsNullOrEmpty(ShiftId))
        {
            dm.AddParameteres("@ShiftId", ShiftId);
        }
        if (!string.IsNullOrEmpty(SectionId))
        {
            dm.AddParameteres("@SectionId", SectionId);
        }
        if (!string.IsNullOrEmpty(StudentId))
        {
            dm.AddParameteres("@StudentId", StudentId);
        }
        if (!string.IsNullOrEmpty(RegistrationNumber))
        {
            dm.AddParameteres("@RegistrationNumber", RegistrationNumber);
        }
        if (!string.IsNullOrEmpty(EffectiveYearAndMonthSeeialFrom))
        {
            dm.AddParameteres("@EffectiveYearAndMonthSeeialFrom", EffectiveYearAndMonthSeeialFrom);
        }
        if (!string.IsNullOrEmpty(EffectiveYearAndMonthSeeialTo))
        {
            dm.AddParameteres("@EffectiveYearAndMonthSeeialTo", EffectiveYearAndMonthSeeialTo);
        }
        if (!string.IsNullOrEmpty(ShortStatus))
        {
            dm.AddParameteres("@ShortStatus", ShortStatus);
        }
        if (!string.IsNullOrEmpty(PaidDateFrom))
        {
            var _PaidDateFrom = DateTime.ParseExact(PaidDateFrom, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString();
            dm.AddParameteres("@PaidDateFrom", _PaidDateFrom);
        }
        if (!string.IsNullOrEmpty(PaidDateTo))
        {
            var _PaidDateTo = DateTime.ParseExact(PaidDateTo, "dd/MM/yyyy", CultureInfo.InvariantCulture).AddDays(1).ToString();
            dm.AddParameteres("@PaidDateTo", _PaidDateTo);
        }
        if (!string.IsNullOrEmpty(TransectionIdentifier))
        {
            dm.AddParameteres("@TransectionIdentifier", TransectionIdentifier);
        }
        if (!string.IsNullOrEmpty(Invoice_TransectionIdentifier))
        {
            dm.AddParameteres("@Invoice_TransectionIdentifier", Invoice_TransectionIdentifier);
        }
        if (!string.IsNullOrEmpty(Invoice_TrackingId))
        {
            dm.AddParameteres("@Invoice_TrackingId", Invoice_TrackingId);
        }
        return dm.ExecuteQuery("USP_StudentDue_Transectional_GetByCriteria");
    }
    public DataTable StudentDue_GetSummaryByStudent(
        string ClassId = "",
        string GroupId = "",
        string ShiftId = "",
        string SectionId = "",
        string StudentId = "",
        string RegistrationNumber = ""
        )
    {
        if (!string.IsNullOrEmpty(ClassId))
        {
            dm.AddParameteres("@ClassId", ClassId);
        }
        if (!string.IsNullOrEmpty(GroupId))
        {
            dm.AddParameteres("@GroupId", GroupId);
        }
        if (!string.IsNullOrEmpty(ShiftId))
        {
            dm.AddParameteres("@ShiftId", ShiftId);
        }
        if (!string.IsNullOrEmpty(SectionId))
        {
            dm.AddParameteres("@SectionId", SectionId);
        }
        if (!string.IsNullOrEmpty(StudentId))
        {
            dm.AddParameteres("@StudentId", StudentId);
        }
        if (!string.IsNullOrEmpty(RegistrationNumber))
        {
            dm.AddParameteres("@RegistrationNumber", RegistrationNumber);
        }
        return dm.ExecuteQuery("USP_StudentDue_GetSummaryByStudent");
    }
    #endregion

    #region StudentInvoice
    public DataRow StudentInvoice_Insert_ByInternalUser(
       string TransectionIdentifier
     , int StudentId
     , decimal DepositedAmount
     , string Status
     , string CreatedBy
     , string Note
     , string DeveloperNote
     )
    {
        dm.AddParameteres("@TransectionIdentifier", TransectionIdentifier);
        dm.AddParameteres("@StudentId", StudentId);
        dm.AddParameteres("@DepositedAmount", DepositedAmount);
        dm.AddParameteres("@Status", Status);
        dm.AddParameteres("@CreatedBy", CreatedBy);
        dm.AddParameteres("@Note", Note);
        dm.AddParameteres("@DeveloperNote", DeveloperNote);

        DataTable dt = dm.ExecuteQuery("USP_StudentInvoice_Insert_ByInternalUser");
        return dt.Rows[0];
    }
    public DataTable StudentInvoice_Transectional_GetByCriteria(
        string ClassId = "",
        string GroupId = "",
        string ShiftId = "",
        string SectionId = "",
        string StudentId = "",
        string RegistrationNumber = "",
        string Status = "",
        string PaidDateFrom = "",
        string PaidDateTo = "",
        string TransectionIdentifier = "")
    {
        if (!string.IsNullOrEmpty(ClassId))
        {
            dm.AddParameteres("@ClassId", ClassId);
        }
        if (!string.IsNullOrEmpty(GroupId))
        {
            dm.AddParameteres("@GroupId", GroupId);
        }
        if (!string.IsNullOrEmpty(ShiftId))
        {
            dm.AddParameteres("@ShiftId", ShiftId);
        }
        if (!string.IsNullOrEmpty(SectionId))
        {
            dm.AddParameteres("@SectionId", SectionId);
        }
        if (!string.IsNullOrEmpty(StudentId))
        {
            dm.AddParameteres("@StudentId", StudentId);
        }
        if (!string.IsNullOrEmpty(RegistrationNumber))
        {
            dm.AddParameteres("@RegistrationNumber", RegistrationNumber);
        }
        if (!string.IsNullOrEmpty(Status))
        {
            dm.AddParameteres("@Status", Status);
        }
        if (!string.IsNullOrEmpty(PaidDateFrom))
        {
            var _PaidDateFrom = DateTime.ParseExact(PaidDateFrom, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString();
            dm.AddParameteres("@PaidDateFrom", _PaidDateFrom);
        }
        if (!string.IsNullOrEmpty(PaidDateTo))
        {
            var _PaidDateTo = DateTime.ParseExact(PaidDateTo, "dd/MM/yyyy", CultureInfo.InvariantCulture).AddDays(1).ToString();
            dm.AddParameteres("@PaidDateTo", _PaidDateTo);
        }
        if (!string.IsNullOrEmpty(TransectionIdentifier))
        {
            dm.AddParameteres("@TransectionIdentifier", TransectionIdentifier);
        }
        return dm.ExecuteQuery("USP_StudentInvoice_Transectional_GetByCriteria");
    }
    public DataRow StudentDue_Transectional_Pay_ByInternalUser(
     string TransectionIdentifier
     , string Invoice_TransectionIdentifier
     , string PaidBy
     , string ShallPay
     )
    {
        dm.AddParameteres("@TransectionIdentifier", TransectionIdentifier);
        dm.AddParameteres("@Invoice_TransectionIdentifier", Invoice_TransectionIdentifier);
        dm.AddParameteres("@PaidBy", PaidBy);
        dm.AddParameteres("@ShallPay", ShallPay);

        DataTable dt = dm.ExecuteQuery("USP_StudentDue_Transectional_Pay_ByInternalUser");
        return dt.Rows[0];
    }
    public DataRow StudentDue_Transectional_Pay_ByProcess(
     string TransectionIdentifier
     , string Invoice_TransectionIdentifier
     , string PaidBy
     , string ShallPay
     )
    {
        dm.AddParameteres("@TransectionIdentifier", TransectionIdentifier);
        dm.AddParameteres("@Invoice_TransectionIdentifier", Invoice_TransectionIdentifier);
        dm.AddParameteres("@PaidBy", PaidBy);
        dm.AddParameteres("@ShallPay", ShallPay);

        DataTable dt = dm.ExecuteQuery("USP_StudentDue_Transectional_Pay_ByProcess");
        return dt.Rows[0];
    }

    public DataTable PaymentSummaryReport_Format1(
    string PaidDateFrom = "",
        string PaidDateTo = "",
        string EffectiveYearAndMonthSerial = ""
     )
    {
        if (!string.IsNullOrEmpty(PaidDateFrom))
        {
            //var _PaidDateFrom = DateTime.ParseExact(PaidDateFrom, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString();
            dm.AddParameteres("@PaidDateFrom", PaidDateFrom);
        }
        if (!string.IsNullOrEmpty(PaidDateTo))
        {
            //var _PaidDateTo = DateTime.ParseExact(PaidDateTo, "dd/MM/yyyy", CultureInfo.InvariantCulture).AddDays(1).ToString();
            dm.AddParameteres("@PaidDateTo", PaidDateTo);
        }
        if (!string.IsNullOrEmpty(EffectiveYearAndMonthSerial))
        {
            dm.AddParameteres("@EffectiveYearAndMonthSerial", EffectiveYearAndMonthSerial);
        }
        return dm.ExecuteQuery("USP_PaymentSummaryReport_Format1");
    }
    #endregion
}