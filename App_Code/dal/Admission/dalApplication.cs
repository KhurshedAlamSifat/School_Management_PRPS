using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

public class dalApplication
{
    DatabaseManager dm = new DatabaseManager();
    public dalApplication()
    {
    }
    public int Insert(string Name, string FathersName, string MothersName, string Mobile, string Address, string PostOffice, string PostCode,
        int ThanaId, string MobileHome, int GenderId, int ReligionId, long CircularId, DateTime DateofBirth, string Image, string Email, string Nationality, int GroupId)
    {
        dm.AddParameteres("@Name", Name);
        dm.AddParameteres("@FathersName", FathersName);
        dm.AddParameteres("@MothersName", MothersName);
        dm.AddParameteres("@Mobile", Mobile);
        dm.AddParameteres("@Address", Address);
        dm.AddParameteres("@PostOffice", PostOffice);
        dm.AddParameteres("@PostCode", PostCode);
        dm.AddParameteres("@ThanaId", ThanaId);
        dm.AddParameteres("@MobileHome", MobileHome);
        dm.AddParameteres("@GenderId", GenderId);
        dm.AddParameteres("@ReligionId", ReligionId);
        dm.AddParameteres("@CircularId", CircularId);
        dm.AddParameteres("@DateofBirth", DateofBirth);
        dm.AddParameteres("@Image", Image);
        dm.AddParameteres("@Email", Email);
        dm.AddParameteres("@Nationality", Nationality);
        dm.AddParameteres("@GroupId", GroupId);
        DataTable dt = dm.ExecuteQuery("USP_AddmisionApplication_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public int QuotaInsert(int QuotaId, long ApplicationId)
    {
        dm.AddParameteres("@QuotaId", QuotaId);
        dm.AddParameteres("@ApplicationId", ApplicationId);
        return dm.ExecuteNonQuery("USP_AddmisionQuota_Insert");
    }
    public int QuotaDelete(long ApplicationId)
    {
        dm.AddParameteres("@ApplicationId", ApplicationId);
        return dm.ExecuteNonQuery("USP_AddmisionQuota_Delete");
    }
    public int Update(int Id, string Name, string FathersName, string MothersName, string Mobile, string Address, string PostOffice, string PostCode,
    int ThanaId, string MobileHome, int GenderId, int ReligionId, long CircularId, DateTime DateofBirth, string Image, string Email, string Nationality)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@Name", Name);
        dm.AddParameteres("@FathersName", FathersName);
        dm.AddParameteres("@MothersName", MothersName);
        dm.AddParameteres("@Mobile", Mobile);
        dm.AddParameteres("@Address", Address);
        dm.AddParameteres("@PostOffice", PostOffice);
        dm.AddParameteres("@PostCode", PostCode);
        dm.AddParameteres("@ThanaId", ThanaId);
        dm.AddParameteres("@MobileHome", MobileHome);
        dm.AddParameteres("@GenderId", GenderId);
        dm.AddParameteres("@CircularId", CircularId);
        dm.AddParameteres("@DateofBirth", DateofBirth);
        dm.AddParameteres("@Image", Image);
        dm.AddParameteres("@Email", Email);
        dm.AddParameteres("@Nationality", Nationality);
        return dm.ExecuteNonQuery("USP_AddmisionApplication_Update");
    }
    public int PaymentUpdate(long Id, int AdmissionFormFee, int PaymentMethodId, string TransactionId)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@AdmissionFormFee", AdmissionFormFee);
        dm.AddParameteres("@PaymentMethodId", PaymentMethodId);
        dm.AddParameteres("@TransactionId", TransactionId);
        dm.AddParameteres("@UpdatedBy", SessionManager.SessionName.UserName);
        return dm.ExecuteNonQuery("USP_AddmisionApplicationPayment_Update");
    }
    public int PaymentUpdateByApplicant(long Id, int PaymentMethodId, string TransactionId)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@PaymentMethodId", PaymentMethodId);
        dm.AddParameteres("@TransactionId", TransactionId);
        dm.AddParameteres("@UpdatedBy", Id.ToString());
        return dm.ExecuteNonQuery("USP_AddmisionPayment_ByApplicant");
    }
    public int ReferenceUpdate(long Id, string ReferenceName)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@Reference", ReferenceName);
        dm.AddParameteres("@UpdatedBy", SessionManager.SessionName.UserName);
        return dm.ExecuteNonQuery("USP_AddmisionApplicationReference_Update");
    }
    public int AdmissionUpdate(long Id)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@UpdatedBy", SessionManager.SessionName.UserName);
        return dm.ExecuteNonQuery("USP_AddmisionStatus_Update");
    }
    public DataTable GetSearchData(string Conditions)
    {
        dm.AddParameteres("@Conditions", Conditions);
        return dm.ExecuteQuery("USP_AddmisionApplication_Search");
    }
    public DataTable GetById(long id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_AddmisionApplication_GetById");
    }
    public DataTable GetAmitCard(long id, string TransactionId)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@TransactionId", TransactionId);
        return dm.ExecuteQuery("USP_AddmisionAdmitCard");
    }
    public DataTable GetQuotaByApplicationId(long ApplicationId)
    {
        dm.AddParameteres("@ApplicationId", ApplicationId);
        return dm.ExecuteQuery("USP_AddmisionQuota_GetById");
    }
}