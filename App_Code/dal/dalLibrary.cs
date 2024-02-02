
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalLibrary
/// </summary>
public class dalLibrary
{
    DatabaseManager dm = new DatabaseManager();
    public dalLibrary()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region Managed Book
    public int InsertBook(int categoryId, int subCategoryId, int countryId, int publisherId, int languageId, int editionId, string trackingId, string status,
        string titleEng, string titleBang, string author, string isbn, string volume, string selfNo, string cellNo, string keyWord,
        string description, string coverPhoto, string createBy)
    {
        dm.AddParameteres("@CategoryId", categoryId);
        dm.AddParameteres("@SubCategoryId", subCategoryId);
        dm.AddParameteres("@CountryId", countryId);
        dm.AddParameteres("@PublisherId", publisherId);
        dm.AddParameteres("@LanguageId", languageId);
        dm.AddParameteres("@EditionId", editionId);
        dm.AddParameteres("@TrackingId", trackingId);
        dm.AddParameteres("@Status", status);
        dm.AddParameteres("@TitleEng", titleEng);
        dm.AddParameteres("@TitleBan", titleBang);
        dm.AddParameteres("@Author", author);
        dm.AddParameteres("@ISBN", isbn);
        dm.AddParameteres("@VolumeNo", volume);
        dm.AddParameteres("@SelfNo", selfNo);
        dm.AddParameteres("@CellNo", cellNo);
        dm.AddParameteres("@KeyWords", keyWord);
        dm.AddParameteres("@Description", description);
        dm.AddParameteres("@CoverPhoto", coverPhoto);
        dm.AddParameteres("@CreatedBy", createBy);
        //return dm.ExecuteNonQuery("USP_Book_Insert");
        DataTable dt = dm.ExecuteQuery("USP_Book_Insert");
        return Convert.ToInt32(dt.Rows[0][0].ToString());
    }

    public int UpdateBook(int id, int categoryId, int subCategoryId, int countryId, int publisherId, int languageId, int editionId, string trackingId, string status,
        string titleEng, string titleBang, string author, string isbn, string volume, string selfNo, string cellNo, string keyWord,
        string description, string coverPhoto, string updatedBy)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@CategoryId", categoryId);
        dm.AddParameteres("@SubCategoryId", subCategoryId);
        dm.AddParameteres("@CountryId", countryId);
        dm.AddParameteres("@PublisherId", publisherId);
        dm.AddParameteres("@LanguageId", languageId);
        dm.AddParameteres("@EditionId", editionId);
        dm.AddParameteres("@TrackingId", trackingId);
        dm.AddParameteres("@Status", status);
        dm.AddParameteres("@TitleEng", titleEng);
        dm.AddParameteres("@TitleBan", titleBang);
        dm.AddParameteres("@Author", author);
        dm.AddParameteres("@ISBN", isbn);
        dm.AddParameteres("@VolumeNo", volume);
        dm.AddParameteres("@SelfNo", selfNo);
        dm.AddParameteres("@CellNo", cellNo);
        dm.AddParameteres("@KeyWords", keyWord);
        dm.AddParameteres("@Description", description);
        dm.AddParameteres("@CoverPhoto", coverPhoto);
        dm.AddParameteres("@UpdatedBy", updatedBy);
        return dm.ExecuteNonQuery("USP_Book_Update");
    }
    public DataTable GetBookByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_Book_GetByCriteria");
    }
    public DataTable GetBookById(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_Book_GetById");
    }
    public DataTable GetBookByTrackingId(string TrackingId)
    {
        dm.AddParameteres("@TrackingId", TrackingId);
        return dm.ExecuteQuery("USP_Book_GetByTrackingId");
    }
    #endregion

    #region Book Lending
    public DataTable InsertBookLending(int BookId, int UserId, DateTime IssueDate, DateTime TargatedReturnDate, string Note)
    {
        dm.AddParameteres("@BookId", BookId);
        dm.AddParameteres("@UserId", UserId);
        dm.AddParameteres("@IssueDate", IssueDate);
        dm.AddParameteres("@TargatedReturnDate", TargatedReturnDate);
        dm.AddParameteres("@Status", "Given");
        dm.AddParameteres("@Note", Note);
        dm.AddParameteres("@CreatedBy", SessionManager.SessionName.UserName);
        return dm.ExecuteQuery("USP_BookLending_Insert");
    }
    public DataTable UpdateBookLending(int Id, DateTime StatusUpdationDate, string Status, string Note)
    {
        dm.AddParameteres("@Id", Id);
        dm.AddParameteres("@StatusUpdationDate", StatusUpdationDate);
        dm.AddParameteres("@Status", Status);
        dm.AddParameteres("@Note", Note);
        dm.AddParameteres("@UpdatedBy", SessionManager.SessionName.UserName);
        return dm.ExecuteQuery("USP_BookLending_Update");
    }
    public DataTable GetBookLendingByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_BookLending_GetByCriteria");
    }
    public DataTable GetBookLendingById(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_BookLending_GetById");
    }
    public DataTable GetBookLendingHoistoryByCriteria(string criteria)
    {
        dm.AddParameteres("@Criteria", criteria);
        return dm.ExecuteQuery("USP_BookLending_GetHistoryByCriteria");
    }
    #endregion

}