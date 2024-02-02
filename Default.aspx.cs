using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Web.Security;
using System.Globalization;

public partial class _Default : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpCookie cookie = Request.Cookies["CurrentLanguage"];
            if (cookie == null && cookie.Value == null)
            {
                string lang = "en-US";
                CultureInfo Cul = CultureInfo.CreateSpecificCulture(lang);
                System.Threading.Thread.CurrentThread.CurrentUICulture = Cul;
                System.Threading.Thread.CurrentThread.CurrentCulture = Cul;

                HttpCookie cookie_new = new HttpCookie("Language");
                cookie_new.Value = lang;
                cookie_new.Expires = DateTime.Now.AddMonths(6);
                Response.SetCookie(cookie_new);
            }
        }
    }
}
