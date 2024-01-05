<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="FoodOrderingSystem.MyAccount" %>
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
                        <span>My Account <i class="fa fa-chevron-right"></i></span>
                    </p>
                    <h2 class="mb-0 bread">My Account</h2>
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
              	                <p><span class="fa fa-user"></span> Account Details</p>
                            </div>
                            <p class="m-0">Email :  <% =currentUser.name %></p>
                            <p class="m-0">Email : <% =currentUser.email %></p>
                            <p>Phone no : <% =currentUser.contact %></p>
                            <p class="m-0">
                                <a href="EditAccount.aspx" class="btn-custom"><span class="fa fa-pencil"></span> Edit Profile</a>
                            </p>
                            <p class="m-0">
                                <span class="fa fa-sign-out" style="font-size: 12px; color: #b7472a;"></span>
                                <asp:LinkButton runat="server" CssClass="btn-custom" Text=" Logout" OnClick="Logout_Click" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row ftco-animate">
                <h2 class="heading mb-3 ml-4">Order History</h2>
    			<div class="w-100">
					<table class="table table-striped">
						<thead>
						    <tr>
								<th style="color: black;">Order #</th>
								<th style="color: black;">Date</th>
								<th style="color: black;">Status</th>
								<th style="color: black;">Total</th>
						    </tr>
						</thead>
						<tbody>
                            <% =Get_Deliveries() %>
						</tbody>
					</table>
				</div>
    		</div>
        </div>
    </section>
</asp:Content>
