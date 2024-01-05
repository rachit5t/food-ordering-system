<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="FoodOrderingSystem.AdminDashboard" %>
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
					</p>
					<h2 class="mb-0 bread">Admin Dashboard</h2>
				</div>
			</div>
		</div>
    </section>

	<section class="ftco-section">
        <div class="container">
            <div class="row d-flex">
                
                <div class="col-lg-6 d-flex align-items-stretch ftco-animate">
                    <div class="blog-entry d-md-flex">
                        <div class="p-4 bg-light w-100">
                            <div class="meta">
              	                <p><span class="fa fa-user"></span> Admin Controls</p>
                            </div>
                            <a href="MyAccount.aspx" class="btn btn-primary btn-block">My Account management</a>
                            <a href="ManageUser.aspx" class="btn btn-primary btn-block">Manage Users</a>
                            <a href="ManageProduct.aspx" class="btn btn-primary btn-block">Manage Products</a>
                            <a href="ManageOrder.aspx" class="btn btn-primary btn-block">Manage Orders</a>
                            <p class="mt-2">
                                <span class="fa fa-sign-out" style="font-size: 12px; color: #b7472a;"></span>
                                <asp:LinkButton runat="server" CssClass="btn-custom" Text=" Logout" OnClick="Logout_Click" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
