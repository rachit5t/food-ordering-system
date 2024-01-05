<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="FoodOrderingSystem.ManageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-wrap hero-wrap-2" style="background-image: url('assets/background.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2"><a href="index.html">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span class="mr-2">Admin Dashboard <i class="fa fa-chevron-right"></i></span>
                        <span class="mr-2">Manage User <i class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Manage User</h2>
				</div>
			</div>
		</div>
    </section>

    <section class="ftco-section">
         <div class="container-fluid w-75">
            <div class="row">
                <div class="col-lg-12 ftco-animate">
                    <h2>User Table</h2>
                    <asp:Panel ID="panelData" runat="server" CssClass="table-wrap">
                        <table class="table table-sm">
                            <thead class="thead-primary">
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email</th>
                                    <th>Contact</th>
                                    <th>Address</th>
                                    <th>Role</th>
                                    <th>&nbsp&nbsp&nbsp</th>
                                    <th>&nbsp&nbsp&nbsp</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% =FetchUserData() %>
                            </tbody>
                        </table>
                    </asp:Panel>
                </div>
                <div class="col-md-12 mt-4">
					<div class="form-group">
						<a href="AdminDashboard.aspx" style="transition: none; color: inherit;">
							<p>
								<span class="fa fa-arrow-left"></span>
								Return to Admin Dashboard
							</p>
						</a>
					</div>
				</div>
            </div>
        </div>
    </section>
</asp:Content>
