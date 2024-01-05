<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="FoodOrderingSystem.UserDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-wrap hero-wrap-2" style="background-image: url('assets/background.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate mb-5 text-center">
                    <p class="breadcrumbs mb-0">
                       </p>
                    <h2 class="mb-0 bread">User Details</h2>
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
									<h3 class="mb-4">Edit User Details</h3>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="txtFName">First Name</label>
												<asp:TextBox runat="server" CssClass="form-control" id="txtFName" placeholder="John"/>
											</div>
										</div>
										<div class="col-md-6"> 
											<div class="form-group">
												<label class="label" for="txtLName">Last Name</label>
												<asp:TextBox runat="server" CssClass="form-control" id="txtLName" placeholder="Doe" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="txtEmail">Email Address</label>
												<asp:TextBox runat="server" TextMode="Email" CssClass="form-control" id="txtEmail" placeholder="john.doe@mail.com" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="txtContact">Contact No</label>
												<div class="input-group">
													<asp:TextBox runat="server" CssClass="form-control" ID="txtContact" placeholder="+6012345678" />
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="txtAddress">Address</label>
												<asp:TextBox runat="server" CssClass="form-control" id="txtAddress" placeholder="Cecilia Chapman 711-2880 Nulla St. Mankato Mississippi 96522" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="txtAddress">Role</label>
												<asp:DropDownList runat="server" id="ddlRole" CssClass="form-control">
													<asp:ListItem Text="Customer" />
													<asp:ListItem Text="Admin" />
												</asp:DropDownList>	
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<asp:Button ID="btnEdit" Text="Update Details" CssClass="btn btn-primary btn-block" runat="server" OnClick="BtnEdit_Click" />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<a href="ManageUser.aspx" style="transition: none; color: inherit;">
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
