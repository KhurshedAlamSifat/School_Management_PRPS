using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_User_Speech : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Id"] != null)
            {
                string id = Request.QueryString["Id"];
                Speech(id);
            }
        }
    }

    private void Speech(string id)
    {
        if (id == "1")
        {
            lbHeading.Text = "Speech From Principal";
            lblName.Text = "PRINCIPAL";
            ltSpeech.Text = @"PRAN-RFL Public School aims to create a supportive and inclusive environment where students are encouraged to explore their potential and achieve their personal best in all aspects of school life. Students will be challenged and engaged through authentic learning opportunities that inspire them to develop creativity, confidence and resilience to become independent learners.<br/><br/>

We offer a broad curriculum and a range of opportunities for all our students to achieve excellence in academic, creative, social, cultural and sporting endeavours. We value collaborative learning, positive relationships and building capacity amongst our students to effectively allow them to engage in the world of the future. <br/><br/>

We support the individual wellbeing of our students and provide a school environment that allows every student to thrive as they work towards achieving their personal best performance. We set high expectations for our students and work hard to safeguard positive emotions across our school community. <br/><br/>
We encourage our students to develop respectful relationships with their peers, teachers and the broader community. We are proud to be a high performing school and aim to be the selective school of first choice for all families within our community. 
Our students are intelligent, creative, imaginative, disciplined, dedicated to life-long learning and respectful. They are the future leaders and role models of society.
";
        }
        else if (id == "2")
        {
            lbHeading.Text = "Speech From Teachers";
            lblName.Text = "Md. Samsul Islam<br>Senior Teacher";
            ltSpeech.Text = @"PRAN-RFL Public School started its journey in 2014 with the slogan “Where knowledge unfolds”. The main purpose of this institution is to make the students worthy citizens and leaders to serve the country and the world community. And as teachers we are working to achieve the motto. Besides academic programmes, we do duly emphasize on curricular and co-curricular activities to explore their latent talents. The school is really well equipped with all modern facilities like digital classrooms, LED monitors and laptops for teachers. By using these facilities we can easily make the classes interesting and understandable for the students. Another important factor of this school is the managing committee. The SMC (School Managing Committee) is really helpful and cooperative for the development of the students and teachers.  <br><br>
We love our students and pay attention to their needs. What we strongly believe is that no teacher can ensure comprehensive care for students and bring in desired result without passionate approach to them. In this school we always maintain communication with guardians, fellow-teachers and students in different forms as and when required. Because, meeting and communication with them is a must for informing of students’ progress and knowing feedback without which quality education is not possible. <br><br>
We have internet facility with broadaband and wifi connection and air conditioned teachers’ common room and all other financial benefits. So, to me it is really an exciting teaching experience and excellent institution for students and teachers. I am pleased to be a member of this institution.
";
        }
        else if (id == "3")
        {
            lbHeading.Text = "Speech From Students and Guardian";
            lblName.Text = "Guardians";
            ltSpeech.Text = @"<b><u>Speech From Students</u></b><br> I am a student of PRAN-RFL Public School. I am studying in this institution from the beginning. I am here because of some special reasons. This is one of the best schools in this locality. I know students in other school don’t get what facilities I’ve got and enjoyed reading in this school. The teaching method of my school is totally different from the traditional schools. We are getting here the modern technology in our classrooms. We have a nice computer lab with all modern facilities. We have a big library with a huge collection of different books. <br><br>
We have a very qualified teachers’ group. Our teachers are very much friendly and supportive. They love us, take care and work hard for making us good human beings. They not only give knowledge of prescribed books but also provide different knowledge on different subjects beyond prescribed books for building our career. <br>

Most of the famous schools of our country don’t have playground but our school has a very beautiful green field and all sports equipments. Another facility of my school is that on every Thursday we have ECA (Extra Curricular Activities) that includes music, debate, crafts, acting, recitation etc. We celebrate all National Days with colorful cultural program. I am proud to be a student of this school.<br>
<b>Sara Ahmed</b><br>
Class: Eight<br><br>
<b><u>Speech From Guardians</u></b><br>
PRAN-RFL Public School is a famous school in Narsingdi district. The environment of the school is very beautiful. There is a big playground in front of the school. Students play in the ground which help them to develop their mental and physical growth. Teachers’ quality of the school is really appreciable because all of them are well qualified and educated. They teach our children with great care.  Teachers always communicate with us about the condition of our child which help us to take care of them at home accordingly. As teachers are so careful, we don’t have to take any tension for their development. The class room quality and infrastructure of the institution are attractive and modern which help our children to get the quality education by using all modern equipments practically. I am very much pleased that my child is studying in this institution. 
";
        }
    }
}