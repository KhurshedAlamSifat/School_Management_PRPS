<%@ Page Language="C#" MasterPageFile="~/MasterPage/ThemeLocalMaster.master" AutoEventWireup="true" CodeFile="StudentInfo.aspx.cs" Inherits="Pages_Academic_StudentInfo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">

    <section id="notice" class="section-padding">
        <div class="auto-container">
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <div class="card text-white bg-success mb-3" style="max-width: 18rem;">
                        <div class="card-header">Total Students</div>
                        <div class="card-body">
                            <h2 class="card-title">
                                <asp:Label ID="lblTotalStudent" runat="server"></asp:Label></h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <div class="card text-white bg-primary mb-3" style="max-width: 18rem;">
                        <div class="card-header">Total Male Students</div>
                        <div class="card-body">
                            <h2 class="card-title">
                                <asp:Label ID="lblTotalMaleStudent" runat="server"></asp:Label></h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-6">
                    <div class="card text-white bg-info mb-3" style="max-width: 18rem;">
                        <div class="card-header">Total Female Students</div>
                        <div class="card-body">
                            <h2 class="card-title">
                                <asp:Label ID="lblTotalFemaleStudent" runat="server"></asp:Label></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-sm-12">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">Class Wise Student Count</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <asp:Repeater ID="rpt" runat="server">
                                <HeaderTemplate>
                                    <table id="example1" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <asp:Label ID="Label19" runat="server" Text="Class"></asp:Label></th>
                                                <th>
                                                    <asp:Label ID="Label2" runat="server" Text="Total Student"></asp:Label></th>
                                                <th>
                                                    <asp:Label ID="Label3" runat="server" Text="Male Student"></asp:Label></th>
                                                <th>
                                                    <asp:Label ID="Label1" runat="server" Text="Female Student"></asp:Label></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Class") %></td>
                                        <td><%#Eval("TotalStudent") %></td>
                                        <td><%#Eval("TotalMaleStudent") %></td>
                                        <td><%#Eval("TotalFemaleStudent") %></td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                                </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
