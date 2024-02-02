<%@ Page Language="C#" MasterPageFile="~/MasterPage/ThemeLocalMaster.master" AutoEventWireup="true" CodeFile="TeacherInfo.aspx.cs" Inherits="Pages_SchoolInformaiton_TeacherInfo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <style>
        .card {
            margin-bottom: 10px;
        }

        .card-img-top {
            margin-top: 5px;
            width: 100%;
            height: 300px;
        }

        .card-title {
            text-align: center;
        }

        .card-text {
            text-align: center;
        }
    </style>
    <section id="overview" class="welcome-section-padding">
        <div class="auto-container">
            <div class="row">

                <%--                <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                    <img class="card-img-top" src="/Images/Common/smc_pip_1.png" alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">Commander M Shamsul Alam Miah, BN (Retd)</h4>
                        <h5 class="card-text">President</h5>
                    </div>
                </div>

                    <%#Eval("Name") %>
                --%>

                <asp:Repeater ID="rptData" runat="server">
                    <ItemTemplate>
                        <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                            <img class="card-img-top" src='/VariableContent/Person/<%#Eval("PersonImage") %>' alt="Card image">
                            <div class="card-body">
                                <h4 class="card-title"><%#Eval("NameEng") %></h4>
                                <h5 class="card-text"></h5>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <!--- END CONTAINER -->
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


</asp:Content>
