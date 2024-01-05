<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FoodOrderingSystem.Login" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-wrap hero-wrap-2" style="background-image: url('assets/background.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
    </section>

    <section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper px-md-4">
						<div class="row no-gutters">
							<div class="col-md-12">
								<div class="contact-wrap w-75 p-md-5 p-4 mx-auto">
									<h3 class="mb-4 text-center">Login</h3>
									<form method="POST" id="contactForm" name="contactForm" class="contactForm">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="txtEmail">Email</label>
													<asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="txtEmail" placeholder="john.doe@mail.com" />
                                                    <asp:RequiredFieldValidator
                                                        ID="EmailRequiredFieldValidator"
                                                        runat="server"
                                                        ControlToValidate="txtEmail"
                                                        ErrorMessage="Required Field!"
                                                        ForeColor="Red"
                                                        CssClass="ml-2" 
														Display="Dynamic" 
														Font-Size="14px" />
												</div>
											</div>
											<div class="col-md-12"> 
												<div class="form-group">
													<label class="label" for="txtPassword">Password</label>
													<asp:TextBox runat="server" TextMode="Password" CssClass="form-control" id="txtPassword" placeholder="12345678" />
													<asp:RequiredFieldValidator 
														ID="PasswordRequiredFieldValidator" 
														runat="server" 
														ControlToValidate="txtPassword" 
														ErrorMessage="Required Field!" 
														ForeColor="Red" 
														CssClass="ml-2" 
														Display="Dynamic"
														Font-Size="14px" />
												</div>
											</div>
										</div>
										<div class="col-md-12 mb-2">
											<div class="form-check">
												<asp:CheckBox id="checkRemember" runat="server" CssClass="form-check-input" />
												<label class="form-check-label" for="checkRemember">Remember me</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<asp:Button ID="btnSubmit" Text="Login" CssClass="btn btn-primary btn-block" runat="server" OnClick="btnSubmit_Click" />
												<div class="submitting"></div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>
