<%@ Page Title="Student List" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="Pages_Student_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="panel panel-success">
        <div class="panel-body">
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Application,Year %>"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlYear" runat="server" DataTextField="Year" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator16" runat="server" ValidationGroup="classInfo"
                                ErrorMessage="Select year" ControlToValidate="ddlYear">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlClass" runat="server" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator17" runat="server" ValidationGroup="classInfo"
                                ErrorMessage="Select class" ControlToValidate="ddlClass">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator18" runat="server" ValidationGroup="classInfo"
                                ErrorMessage="Select group" ControlToValidate="ddlGroup">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Application,Gender %>"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlGender" runat="server" DataTextField="Gender" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" runat="server" ValidationGroup="classInfo"
                                ErrorMessage="Select Gender" ControlToValidate="ddlGender">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Application,RegistratinNo %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxRegNo" runat="server" placeholder="Enter Registration No." CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator19" runat="server" ValidationGroup="classInfo"
                                ErrorMessage="Select shift" ControlToValidate="ddlShift">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator20" runat="server" ValidationGroup="classInfo"
                                ErrorMessage="Select section" ControlToValidate="ddlSection">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Application,Religion %>"></asp:Label><span class="required">*</span></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlReligion" runat="server" DataTextField="Religion" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" runat="server" ValidationGroup="classInfo"
                                ErrorMessage="Select Religion" ControlToValidate="ddlReligion">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label20" runat="server" Text="Adm. fee Paid"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlIsAdmitted" runat="server" CssClass="form-control dropdown">
                                <asp:ListItem Value="">All</asp:ListItem>
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label21" runat="server" Text="ApplicationId"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxApplicationId" runat="server" placeholder="Enter Application ID" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-success" />
        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-body">
            <asp:Repeater ID="rpt" runat="server">
                <HeaderTemplate>
                    <table id="example1" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Application,Roll %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Application,RegistratinNo %>"></asp:Label></th>

                                <th>
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,NameEng %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Application,Mobile %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Gender %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Application,Religion %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Class %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label></th>
                                <th>
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Application,Action %>"></asp:Label></th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("RollNo") %></td>
                        <td><%#Eval("RegistrationNo") %></td>
                        <td><%#Eval("NameEng") %><br />
                            <%#Eval("NameBan") %></td>
                        <td><%#Eval("Mobile") %></td>
                        <td><%#Eval("Gender") %></td>
                        <td><%#Eval("Religion") %></td>
                        <td><%#Eval("Class") %></td>
                        <td><%#Eval("GroupName") %></td>
                        <td><%#Eval("Section") %></td>
                        <td><%#Eval("Shift") %></td>
                        <td>
                            <a href='<%#string.Concat("/Pages/Student/View.aspx?Id=",Eval("Id")) %>'><i class="fa fa-2x fa-eye"></i></a>
                            <asp:ImageButton ID="btnEdit" runat="server" OnCommand="btnEdit_Command" CommandArgument='<%# Eval("Id")%>' ImageUrl="~/Images/Common/edit.png" ToolTip="Edit" />
                            <asp:LinkButton ID="btnDelete" runat="server" OnCommand="btnDelete_Command" CommandArgument='<%# Eval("Id")%>' CssClass="fa fa-2x fa-trash-o" OnClientClick="return confirm('Are you sure?')" /></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                                </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

