<%@ Page Title="Gallery" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Pages_User_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <div class="widget-main">
        <div class="widget-inner">
            <div class="gallery-small-thumbs clearfix">
                <div class="row">
                    <asp:Repeater ID="rptGallery" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3">
                                <div class="thumb-small-gallery" style="border: 5px solid #1c3572; width: 170px; height: 150px;">
                                    <a class="fancybox" rel="gallery1" href='<%# Eval("ImageUrl") %>' title='<%# Eval("Title") %>'>
                                        <img src='<%# Eval("ImageUrl") %>' />
                                    </a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
</asp:Content>

