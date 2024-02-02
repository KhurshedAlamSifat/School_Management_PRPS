<%@ Page Title="Fees" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="Fees.aspx.cs" Inherits="Pages_User_Fees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="page-header">
        <h2 class="panel-title">PRPS All Academic Fees</h2>
    </div>
    <table class="table table-responsive table-bordered table-hover">
        <thead>
            <tr>
                <th>Class</th>
                <th>Admission</th>
                <th>Session</th>
                <th>Tuition*</th>
                <th>Exam</th>
                <th>Coaching</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Class-1</td>
                <td>2000/=</td>
                <td>1000/=</td>
                <td>400/=</td>
                <td>250/=</td>
                <td></td>
            </tr>
            <tr>
                <td>Class-2</td>
                <td>2000/=</td>
                <td>1000/=</td>
                <td>400/=</td>
                <td>250/=</td>
                <td></td>
            </tr>
            <tr>
                <td>Class-3</td>
                <td>2500/=</td>
                <td>1200/=</td>
                <td>500/=</td>
                <td>300/=</td>
                <td></td>
            </tr>
            <tr>
                <td>Class-4</td>
                <td>2500/=</td>
                <td>1200/=</td>
                <td>500/=</td>
                <td>300/=</td>
                <td></td>
            </tr>
            <tr>
                <td>Class-5</td>
                <td>2500/=</td>
                <td>1200/=</td>
                <td>500/=</td>
                <td>300/=</td>
                <td>500/=</td>
            </tr>
            <tr>
                <td>Class-6</td>
                <td>3000/=</td>
                <td>1500/=</td>
                <td>600/=</td>
                <td>350/=</td>
                <td></td>
            </tr>
            <tr>
                <td>Class-7</td>
                <td>3000/=</td>
                <td>1500/=</td>
                <td>600/=</td>
                <td>350/=</td>
                <td></td>
            </tr>
            <tr>
                <td>Class-8</td>
                <td>3000/=</td>
                <td></td>
                <td>600/=</td>
                <td>350/=</td>
                <td>600/=</td>
            </tr>
        </tbody>
    </table>
    <p>*Waiver applicable (as per <a href="/Pages/User/waiver.aspx">PRPS Waiver policy</a>)</p>
    <label>Special Care Class	:</label>
    250.00/per subject (Maths & English)<br />
    <label>Evening Class	:</label>
    300.00/per subject (Maths, Science & English)<br />
    <label>Weekend Class	:</label>
    300.00/per subject (Art & Dance)

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

