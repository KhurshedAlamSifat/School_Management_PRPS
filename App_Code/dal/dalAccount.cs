
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dalAccount
/// </summary>
public class dalAccount
{
    DatabaseManager dm = new DatabaseManager();
	public dalAccount()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    #region Income
    public int InsertIncomeCategory(string name)
    {
        dm.AddParameteres("@Category", name);
        DataTable dt = dm.ExecuteQuery("USP_IncomeCategory_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public int UpdateIncomeCategory(int id, string name)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@Category", name);
        return dm.ExecuteNonQuery("USP_IncomeCategory_Update");
    }
    public DataTable GetByIncomeCategoryId(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_IncomeCategory_GetById");
    }
    public int IncomeInsert(int categoryId, DateTime date, double amount, string attachment, string note, string createdBy, DateTime createdDate)
    {
        dm.AddParameteres("@CategoryId",categoryId);
        dm.AddParameteres("@Date", date);
        dm.AddParameteres("@Amount", amount);
        dm.AddParameteres("@Attachment", attachment);
        dm.AddParameteres("@Note", note);
        dm.AddParameteres("@CreatedBy", createdBy);
        dm.AddParameteres("@CreatedDate", createdDate);
        return dm.ExecuteNonQuery("USP_Income_Insert");
    }
    public DataTable GetIncome()
    {
        return dm.ExecuteQuery("USP_Income_GetAll");
    }
    public DataTable GetIncomeById(int id)
    {
        dm.AddParameteres("@Id",id);
        return dm.ExecuteQuery("USP_Income_GetById");
    }
    #endregion

    #region Expense
    public int InsertExpenseCategory(string name)
    {
        dm.AddParameteres("@Category", name);
        DataTable dt = dm.ExecuteQuery("USP_ExpenseCategory_Insert");
        return Convert.ToInt32(dt.Rows[0][0]);
    }
    public int UpdateExpenseCategory(int id, string name)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@Category", name);
        return dm.ExecuteNonQuery("USP_ExpenseCategory_Update");
    }
    public DataTable GetByExpenseCategoryId(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_ExpenseCategory_GetById");
    }
    public int ExpenseInsert(int categoryId, DateTime date, double amount, string attachment, string note, string createdBy, DateTime createdDate)
    {
        dm.AddParameteres("@CategoryId", categoryId);
        dm.AddParameteres("@Date", date);
        dm.AddParameteres("@Amount", amount);
        dm.AddParameteres("@Attachment", attachment);
        dm.AddParameteres("@Note", note);
        dm.AddParameteres("@CreatedBy", createdBy);
        dm.AddParameteres("@CreatedDate", createdDate);
        return dm.ExecuteNonQuery("USP_Expense_Insert");
    }
    public DataTable GetExpense()
    {
        return dm.ExecuteQuery("USP_Expense_GetAll");
    }
    public DataTable GetExpenseById(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_Expense_GetById");
    }
    #endregion
}