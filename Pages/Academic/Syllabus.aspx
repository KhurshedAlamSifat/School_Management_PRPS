<%@ Page Language="C#" MasterPageFile="~/MasterPage/ThemeLocalMaster.master" AutoEventWireup="true" CodeFile="Syllabus.aspx.cs" Inherits="Pages_Academic_Syllabus" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">

    <section id="notice" class="section-padding">
         <div class="auto-container">
            <div class="row">
               	<div class="col-12">
					<div class="notice-board">
						<table class="table table-hover">
							<thead class="thead-inverse">
								<tr>
									<th>Syllabus</th>
									<th>Download </th>
								</tr>
							</thead>
							<tbody class="mt-3">
								<asp:Repeater ID="rptData" runat="server">
									<ItemTemplate>
										<tr>
											<td><%#Eval("Title") %></td>
											<td><%# (Eval("ImageLink") != null) ? "<a href='/Pages/Admin/LocalHomePageFileDownload.aspx?FileName="+ Eval("ImageLink") + "&VisibleFileName="+Eval("Title")+"'>Download</a>"  : "" %></td>
										</tr>
									</ItemTemplate>
									</asp:Repeater>
							</tbody>
						</table>
					</div>
                </div>
               <!-- end col -->
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
