using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


public class dalPaymentMethod
{
    DatabaseManager dm = new DatabaseManager();
	public dalPaymentMethod()
	{
	}
    public int Insert(string name)
    {
        dm.AddParameteres("@PaymentMethod", name);
        return dm.ExecuteNonQuery("USP_PaymentMethod_Insert");
    }
    public int Update(int id, string name)
    {
        dm.AddParameteres("@Id", id);
        dm.AddParameteres("@PaymentMethod", name);
        return dm.ExecuteNonQuery("USP_PaymentMethod_Update");
    }
    public DataTable GetById(int id)
    {
        dm.AddParameteres("@Id", id);
        return dm.ExecuteQuery("USP_PaymentMethod_GetById");
    }
}