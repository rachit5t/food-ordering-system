<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProductDetails.aspx.cs" Inherits="FoodOrderingSystem.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-wrap hero-wrap-2" style="background-image: url('assets/background.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate mb-5 text-center">
                    <p class="breadcrumbs mb-0">
                        <span class="mr-2"><a href="Home.aspx">Home <i class="fa fa-chevron-right"></i></a></span>
                        <span class="mr-2"><a href="AdminDashboard.aspx">Admin Dashboard <i class="fa fa-chevron-right"></i></a></span>
                        <span class="mr-2"><a href="ManageProduct.aspx">Manage Product <i class="fa fa-chevron-right"></i></a></span>
                        <span>Edit Product Details <i class="fa fa-chevron-right"></i></span>
                    </p>
                    <h2 class="mb-0 bread">Edit Product Details</h2>
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
									<h3 class="mb-4">Edit Product Details</h3>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<div class="sort">
													<% =GetImage() %>
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="productImage">Product Image <span class="fa fa-info-circle" id="info" data-bs-toggle="tooltip" data-bs-placement="top" title="You can't change product image."></span></label>
												<asp:TextBox ID="txtProductImage" runat="server" CssClass="form-control" Text="cheese-burger.jpg" ReadOnly="true" />
											</div>
										</div>
										<div class="col-md-12"> 
											<div class="form-group">
												<label class="label" for="txtName">Product Name</label>
												<asp:TextBox runat="server" CssClass="form-control" id="txtName" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="txtPrice">Price</label>
												<div class="input-group">
                                                    <asp:TextBox runat="server" CssClass="form-control w-5" ID="txtCurrency" Text="Rs" Enabled="False" />
													<asp:TextBox runat="server" CssClass="form-control w-75" ID="txtPrice" placeholder="10.0" />
												</div>
												<asp:RequiredFieldValidator
                                                    ID="PriceFieldValidator"
                                                    runat="server"
                                                    ControlToValidate="txtPrice"
                                                    ErrorMessage="Required Field!"
                                                    ForeColor="Red"
                                                    CssClass="ml-2" 
													Display="Dynamic"
													Font-Size="14px" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="txtPassword">Category</label>
												<asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
													<asp:ListItem>Veg</asp:ListItem>
													<asp:ListItem>Non Veg</asp:ListItem>
													<asp:ListItem>Drink</asp:ListItem>
												</asp:DropDownList>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<asp:Button ID="btnUpdate" Text="Update Details" CssClass="btn btn-primary btn-block" runat="server" OnClick="BtnUpdate_Click" />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<a href="ManageProduct.aspx" style="transition: none; color: inherit;">
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
