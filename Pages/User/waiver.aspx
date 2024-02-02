<%@ Page Title="Tuition fee's waiver policy" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="waiver.aspx.cs" Inherits="Pages_User_waiver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <table class="table table-hover table-responsive table-bordered">
        <thead>
            <tr>
                <th>PRG Employees’ Salary Range</th>
                <th>Tuition fees waiver for kids (one kid)
                </th>
                <th>Exam Result</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Up to Tk.10000</td>
                <td class="col-md-5">50%</td>
                <td>60%</td>
            </tr>
            <tr>
                <td>Above  Tk.10,000 to Tk.25,000</td>
                <td>25%</td>
                <td>60%</td>
            </tr>
            <tr>
                <td>Scholarship holders</td>
                <td>100%</td>
                <td>60%</td>
            </tr>
            <tr>
                <td>Meritorious but needy(outsiders)*</td>
                <td>Will be considered by SMC based on status</td>
                <td>60%</td>
            </tr>
        </tbody>
    </table>
    <p>*Conditions Applicable</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

