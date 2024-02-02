using System;
using System.Data;
using System.Net;
using System.Net.Mail;
public class SendEmail
{
    public SendEmail()
    {
    }
    public static bool SendSimpleMail(string mailTo, string emailSubject, string emailBody)
    {
        try
        {
            if (mailTo.Contains(";"))
            {
                string[] tos = mailTo.Split(';');
                if (tos.Length > 0)
                {
                    for (int i = 0; i < tos.Length; i++)
                    {
                        Send(tos[i].ToString(), emailSubject, emailBody);
                    }
                }
            }
            else
            {
                Send(mailTo, emailSubject, emailBody);
            }
            return true;
        }
        catch (Exception)
        {
            return false;
        }
    }
    public bool SendSimpleMail(string EmailFrom, string EmailTo, string emailSubject, string emailBody)
    {
        return SendSimpleMail(EmailTo, emailSubject, emailBody);
    }
    private static void Send(string mailTo, string emailSubject, string emailBody)
    {
        SmtpClient objClient;
        MailMessage objMessage;
        MailAddress From;
        DataTable dt = new Common().GetAll("EmailConfig");
        if (dt.Rows.Count == 0) return;
        From = new MailAddress(dt.Rows[0]["DisplayEmail"].ToString(), dt.Rows[0]["DisplayName"].ToString());
        if (mailTo == "")
            mailTo = dt.Rows[0]["ReplyToEmail"].ToString();
        MailAddress To = new MailAddress(mailTo);
        objMessage = new MailMessage(From, To);
        objMessage.ReplyToList.Add(dt.Rows[0]["ReplyToEmail"].ToString()); //
        objMessage.IsBodyHtml = true;
        objMessage.Subject = emailSubject;
        objMessage.Body = emailBody;
        objMessage.Priority = MailPriority.Normal;
        objClient = new SmtpClient();
        objClient.Port = Convert.ToInt32(dt.Rows[0]["Port"].ToString());
        objClient.EnableSsl = Convert.ToBoolean(dt.Rows[0]["SSL"].ToString()); // SSL should be false
        objClient.DeliveryMethod = SmtpDeliveryMethod.Network;
        objClient.UseDefaultCredentials = Convert.ToBoolean(dt.Rows[0]["Authentication"].ToString());
        objClient.Host = dt.Rows[0]["SMTPServer"].ToString(); // mail host or server 
        if (Convert.ToBoolean(dt.Rows[0]["Authentication"].ToString()))
            objClient.Credentials = new NetworkCredential(dt.Rows[0]["UserName"].ToString(),
                dt.Rows[0]["Password"].ToString());
        objClient.Send(objMessage);
    }

    public static void Send_2(string mailTo, string emailSubject, string emailBody)
    {
        try
        {
            MailMessage Msg = new MailMessage();
            MailAddress fromMail = new MailAddress("admin@prps.edu.bd", "PRPS");
            Msg.From = fromMail;
            Msg.To.Add(mailTo);
            Msg.Subject = emailSubject;
            Msg.Body = emailBody;
            Msg.IsBodyHtml = true;
            string sSmtpServer = "";
            sSmtpServer = "172.17.2.12";
            SmtpClient a = new SmtpClient();
            a.Host = sSmtpServer;
            a.EnableSsl = false;
            //a.EnableSsl = true; // if true then not send mail
            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
            //NetworkCred.UserName = "rsms";
            //NetworkCred.Password = "mis@W3lc0m3";
            NetworkCred.UserName = "rsms";
            NetworkCred.Password = "mis@W3lc0m3";
            a.UseDefaultCredentials = true;
            a.Credentials = NetworkCred;
            a.Send(Msg);
        }
        catch (Exception ex)
        {
            //Debug.WriteLine(ex.ToString());
        }
    }

    public static void Send_3(string mailTo, string emailSubject, string emailBody) {

        try
        {
            var _email = "automation@mis.prangroup.com";
            var _epass = "aaaaAAAA0000";
            MailMessage mail = new MailMessage();
            mail.To.Add(mailTo);
            mail.From = new MailAddress("admin@prps.edu.bd", "PRPS");
            mail.Subject = emailSubject;
            mail.Body = emailBody;
            mail.IsBodyHtml = true;
            SmtpClient sc = new SmtpClient("mail.mis.prangroup.com");
            //SmtpClient sc = new SmtpClient("172.17.4.106");
            sc.EnableSsl = false;
            sc.Credentials = new NetworkCredential(_email, _epass);
            sc.Port = 25;
            sc.Send(mail);
        }
        catch (Exception e)
        {

        }
      
    }
    public static string PostRequest(string uri, System.Collections.Specialized.NameValueCollection pairs)
    {
        byte[] response = null;
        using (WebClient client = new WebClient())
        {
            response = client.UploadValues(uri, pairs);
        }
        return System.Text.Encoding.UTF8.GetString(response);
    }
}
