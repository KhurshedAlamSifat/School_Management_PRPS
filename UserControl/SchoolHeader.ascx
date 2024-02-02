<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SchoolHeader.ascx.cs" Inherits="UserControl_SchoolHeader" %>
<div class="row">
    <div class="col-sm-12">
        <div class="row">
            <div class="col-sm-4 text-left">
                
            </div>
            <div class="col-sm-4 text-center">
                <img src="../../Images/Common/PRPS1.png" height="70" alt="PRPS" />
            </div>
            <div class="col-sm-4 text-right">
               
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 text-center">
                <asp:Label ID="lblSchoolName" CssClass="school-heading" runat="server"> </asp:Label><br />
                <asp:Label ID="lblAddress" runat="server"> </asp:Label>
            </div>
        </div>
    </div>
</div>
<div>
    <hr />
</div>
