<%@ Page Language="C#" MasterPageFile="~/MasterPage/ThemeLocalMaster.master" AutoEventWireup="true" CodeFile="StaffInfo.aspx.cs" Inherits="Pages_SchoolInformaiton_StaffInfo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <style>
        .card-img-top {
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
            <asp:Panel ID="pnlCampus1" runat="server" Visible="false">
                <div class="row">
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_pip_1.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Commander M Shamsul Alam Miah, BN (Retd)</h4>
                            <h5 class="card-text">President</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_pip_2.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Md. Ajijul Haque</h4>
                            <h5 class="card-text">General Teacher Member</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_pip_3.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Subarna Mili</h4>
                            <h5 class="card-text">General Teacher Member</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_pip_4.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Zubayda Sultana</h4>
                            <h5 class="card-text">Guardian Member</h5>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_pip_5.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Md. Monirul Islam</h4>
                            <h5 class="card-text">Guardian Member</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_pip_6.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Tahmina Sharmin</h4>
                            <h5 class="card-text">Reserved Female Guardian Member</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_pip_7.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Shah Md. Jewel Reza (Head Teacher)</h4>
                            <h5 class="card-text">Member Secretary</h5>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlCampus2" runat="server" Visible="false">
                <div class="row">
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_hip_1.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">M. Shamsul Alam Miah</h4>
                            <h5 class="card-text">President</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_hip_2.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Md. Mubinul Hoq Chowdhury</h4>
                            <h5 class="card-text">Member Secretary</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_hip_3.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Mofakkar Uddin</h4>
                            <h5 class="card-text">Teachers’ Representative</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_hip_4.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Md. Sanaullah</h4>
                            <h5 class="card-text">Teachers’ Representative</h5>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_hip_5.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Tariq Bin Babu</h4>
                            <h5 class="card-text">Guardians’ Representative</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_hip_6.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Md. Abul Bashar</h4>
                            <h5 class="card-text">Guardians’ Representative</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_hip_7.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Mst. Ruzina Akter</h4>
                            <h5 class="card-text">Guardians’ Representative (Female)</h5>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlCampus3" runat="server" Visible="false">
                <div class="row">
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_dip_1.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">M. Shamsul Alam Miah</h4>
                            <h5 class="card-text">President</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_dip_2.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Md. Shahidur Rahman Khan</h4>
                            <h5 class="card-text">Member Secretary</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_dip_3.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Mosharaf Hossain</h4>
                            <h5 class="card-text">Teachers’ Representative</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_dip_4.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Marufa</h4>
                            <h5 class="card-text">Teachers’ Representative</h5>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_dip_5.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Md. Nanna Mia</h4>
                            <h5 class="card-text">Guardians’ Representative</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_dip_6.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Md. Abdul Awal</h4>
                            <h5 class="card-text">Guardians’ Representative</h5>
                        </div>
                    </div>
                    <div class="card col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <img class="card-img-top" src="/Images/Common/smc_dip_7.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Mst. Lina Akter</h4>
                            <h5 class="card-text">Guardians’ Representative (Female)</h5>
                        </div>
                    </div>
                </div>
            </asp:Panel>
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
