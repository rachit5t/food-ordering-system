<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="FoodOrderingSystem.ChangePassword" %>
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
						<span class="mr-2">My Account <i class="fa fa-chevron-right"></i></span>
						<span class="mr-2">Edit Account <i class="fa fa-chevron-right"></i></span>
						<span>Change Password <i class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Change Password</h2>
				</div>
			</div>
		</div>
    </section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper px-md-4">
						<div class="row no-gutters">
							<div class="col-md-12">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4">Change Password</h3>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="txtEmail">Email Address</label>
												<p>
													<% =currentUser.email %> &nbsp&nbsp<span class="fa fa-info-circle" id="info" data-bs-toggle="tooltip" data-bs-placement="top" title="You can't change email address."></span>
												</p>
											</div>
										</div>
										<div class="col-md-12"> 
											<div class="form-group">
												<label class="label" for="txtPassword">Old Password</label>
												<asp:TextBox runat="server" TextMode="Password" CssClass="form-control" id="txtOldPassword" placeholder="Old password" />
												<asp:Label runat="server" ID="lblPasswordNotMatch" CssClass="label text-danger" Text="Password does not match!" Visible="false" />
											</div>
										</div>
										<div class="col-md-12"> 
											<div class="form-group">
												<label class="label" for="txtPassword">New Password</label>
												<asp:TextBox runat="server" TextMode="Password" CssClass="form-control" id="txtNewPassword" placeholder="New password" />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<asp:Button ID="BtnUpdate" Text="Change Password" CssClass="btn btn-primary btn-block" runat="server" OnClick="BtnUpdate_Click"/>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<a href="EditAccount.aspx" style="transition: none; color: inherit;">
													<p>
														<span class="fa fa-arrow-left"></span>
														Previous
													</p>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>
