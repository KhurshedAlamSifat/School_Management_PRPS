<%@ Page Title="Generate Due By System" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="GenerateDueBySystem.aspx.cs" Inherits="Pages_FeePaymentModule_GenerateDueBySystem" EnableEventValidation="false"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="panel panel-success">
        <div class="panel-body">
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label2" runat="server" Text="Class"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlClass" runat="server" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" AutoPostBack="true" DataTextField="ClassName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Application,Shift %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlShift" runat="server" DataTextField="Shift" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Application,Section %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlSection" runat="server" DataTextField="Section" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label1" runat="server" Text="Fee Head"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlFeeHead" runat="server" DataTextField="FullName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Application,Group %>"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="Id" CssClass="form-control dropdown"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4">
                            <asp:Label ID="Label7" runat="server" Text="RegNo"></asp:Label></label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbxRegNo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="panel-footer">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-success" />
            <asp:Button ID="btnToggleWillSave" runat="server" Text="All Will Save [Check/Uncheck]" OnClick="btnToggleWillSave_Click" CssClass="btn btn-success" />
            <asp:Button ID="btnExportToExcel" runat="server" Text="Export To Excell" OnClick="btnExportToExcel_Click" CssClass="btn btn-success" />
            <asp:Label ID="lbl_EntryCount" runat="server"></asp:Label>
        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-body">
            <asp:GridView ID="gvList" runat="server" CssClass="table table-striped dt-responsive display" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="RegistrationNumber">
                        <ItemTemplate>
                            <asp:Label ID="lbl_StudentId" runat="server" Text='<%#Eval("Student_Id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lbl_12" runat="server" Text='<%#Eval("Student_RegistrationNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_NameEng" runat="server" Text='<%#Eval("Student_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Class">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ClassName" runat="server" Text='<%#Eval("Student_Class") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Group">
                        <ItemTemplate>
                            <asp:Label ID="lbl_GroupName" runat="server" Text='<%#Eval("Student_Group") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shift">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Shift" runat="server" Text='<%#Eval("Student_Shift") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Section" runat="server" Text='<%#Eval("Student_Section") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fee Title">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Fee_Id" runat="server" Text='<%#Eval("Fee_Id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lbl_Fee_FullName" runat="server" Text='<%#Eval("Fee_FullName") %>'></asp:Label>
                            <asp:Label ID="lbl_Mapping_DefaultAmount" runat="server" Text='<%#Eval("Mapping_DefaultAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Consumption Unit">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Mapping_Id" runat="server" Text='<%#Eval("Mapping_Id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lbl_Mapping_ConsumptionUnit" runat="server" Text='<%#Eval("Mapping_ConsumptionUnit") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Applied Waiver %">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Mapping_WaiverPercentage" runat="server" Text='<%#Eval("Mapping_WaiverPercentage") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Applied Amount">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Mapping_FullAmount" runat="server" Text='<%#Eval("Mapping_FullAmount") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lbl_Mapping_AppliedAmount" runat="server" Text='<%#Eval("Mapping_AppliedAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Will Save">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbx_WillSave" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comment">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Comment" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="panel-footer">
            <div class="col-sm-3">
                <asp:DropDownList ID="ddlEffectiveYear" runat="server" CssClass="form-control dropdown"></asp:DropDownList>
            </div>
            <div class="col-sm-3">
                <asp:DropDownList ID="ddlEffectiveMonth" runat="server" DataValueField="Key" DataTextField="Value" CssClass="form-control dropdown"></asp:DropDownList>
            </div>
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-success" />

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

