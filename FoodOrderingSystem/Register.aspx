<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FoodOrderingSystem.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-wrap hero-wrap-2" style="background-image: url('assets/background.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate mb-5 text-center">
                    <h2 class="mb-0 bread">New User Registration</h2>
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
									<h3 class="mb-4">Registration</h3>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="txtFName">First Name</label>
												<asp:TextBox runat="server" CssClass="form-control" id="txtFName" placeholder="John"/>
												<asp:RequiredFieldValidator
                                                    ID="FNameRequiredFieldValidator"
                                                    runat="server"
                                                    ControlToValidate="txtFName"
                                                    ErrorMessage="Required Field!"
                                                    ForeColor="Red"
                                                    CssClass="ml-2" 
													Display="Dynamic"
													Font-Size="14px" />
											</div>
										</div>
										<div class="col-md-6"> 
											<div class="form-group">
												<label class="label" for="txtLName">Last Name</label>
												<asp:TextBox runat="server" CssClass="form-control" id="txtLName" placeholder="Doe" />
												<asp:RequiredFieldValidator
                                                    ID="LNameRequiredFieldValidator"
                                                    runat="server"
                                                    ControlToValidate="txtLName"
                                                    ErrorMessage="Required Field!"
                                                    ForeColor="Red"
                                                    CssClass="ml-2" 
													Display="Dynamic"
													Font-Size="14px" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="txtEmail">Email Address</label>
												<asp:TextBox runat="server" TextMode="Email" CssClass="form-control" id="txtEmail" placeholder="john.doe@mail.com" />
												<asp:RequiredFieldValidator
                                                    ID="EmailFieldValidator"
                                                    runat="server"
                                                    ControlToValidate="txtEmail"
                                                    ErrorMessage="Required Field!"
                                                    ForeColor="Red"
                                                    CssClass="ml-2" 
													Display="Dynamic"
													Font-Size="14px" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="txtContact">Contact No</label>
												<div class="input-group">
													<asp:TextBox runat="server" CssClass="form-control w-5" ID="txtPrefix" placeholder="+60" />
													<asp:TextBox runat="server" CssClass="form-control w-75" ID="txtContact" placeholder="12345678" />
												</div>
												<asp:RequiredFieldValidator
                                                    ID="ContactFieldValidator"
                                                    runat="server"
                                                    ControlToValidate="txtContact"
                                                    ErrorMessage="Required Field!"
                                                    ForeColor="Red"
                                                    CssClass="ml-2" 
													Display="Dynamic"
													Font-Size="14px" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="txtPassword">Password</label>
												<asp:TextBox runat="server" TextMode="Password" CssClass="form-control" id="txtPassword" placeholder="Password" />
												<asp:RequiredFieldValidator
                                                    ID="PasswordFieldValidator"
                                                    runat="server"
                                                    ControlToValidate="txtPassword"
                                                    ErrorMessage="Required Field!"
                                                    ForeColor="Red"
                                                    CssClass="ml-2" 
													Display="Dynamic"
													Font-Size="14px" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="txtConfirmPassword">Confirm Password</label>
												<asp:TextBox runat="server" TextMode="Password" CssClass="form-control" id="txtConfirmPassword" placeholder="Confirm Password" />
												<asp:RequiredFieldValidator
                                                    ID="ConfirmPasswordFieldValidator"
                                                    runat="server"
                                                    ControlToValidate="txtConfirmPassword"
                                                    ErrorMessage="Required Field!"
                                                    ForeColor="Red"
                                                    CssClass="ml-2" 
													Display="Dynamic"
													Font-Size="14px" />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="txtAddress">Address</label>
												<asp:TextBox runat="server" CssClass="form-control" id="txtAddress" placeholder="Cecilia Chapman 711-2880 Nulla St. Mankato Mississippi 96522" />
												<asp:RequiredFieldValidator
                                                    ID="AddressFieldValidator"
                                                    runat="server"
                                                    ControlToValidate="txtAddress"
                                                    ErrorMessage="Required Field!"
                                                    ForeColor="Red"
                                                    CssClass="ml-2" 
													Display="Dynamic"
													Font-Size="14px" />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<asp:Button ID="btnRegister" Text="Register" CssClass="btn btn-primary btn-block" runat="server" OnClick="BtnRegister_Click" />
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
