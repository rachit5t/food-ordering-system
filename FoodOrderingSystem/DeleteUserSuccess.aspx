<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteUserSuccess.aspx.cs" Inherits="FoodOrderingSystem.DeleteUserSuccess" %>
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
					<h2 class="mb-0 bread">User Deleted</h2>
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
							<div class="col-md-6 offset-3">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<div class="row">
										<div class="col-md-12">
											<div class="row">
												<div class="col-md-12 text-center">
													<asp:Label runat="server" ID="lblDeleteSuccess" CssClass="h2" Text="User has been successfully deleted" />
												</div>
											</div>
										</div>
										<div class="col-md-12 mt-4">
											<div class="form-group">
												<a href="ManageUser.aspx" style="transition: none; color: inherit;">
													<p>
														<span class="fa fa-arrow-left"></span>
														Return to manage users
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
