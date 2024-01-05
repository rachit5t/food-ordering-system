<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="FoodOrderingSystem.ProductDetails1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-wrap hero-wrap-2" style="background-image: url('assets/background.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate mb-5 text-center">
                    <p class="breadcrumbs mb-0">
                        <span>Product Details</span>
                    </p>
                    <h2 class="mb-0 bread">Product Details</h2>
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
										<div class="col-md-6">
											<div class="form-group">
												<div class="sort">
													<% =GetImage() %>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-12 text-center">
													<asp:Label runat="server" ID="lblProductName" CssClass="h2" Text="Beef Burger" />
												</div>
												<div class="col-md-12 text-center">
													<asp:Label runat="server" ID="lblProductPrice" CssClass="h4" Text="Rs 10" />
												</div>
											</div>
										</div>
										<div class="col-md-12 p-2">
											<div class="form-group ml-4">
												<label class="label">Quantity</label>
												<asp:TextBox runat="server" ID="qty" CssClass="d-block" type="number" Text="0" />
												<asp:RangeValidator
													ID="ProductQuantityRangeValidator"
													runat="server"
													ControlToValidate="qty"
													ErrorMessage="Quantity can't be 0 or below 0!"
													ForeColor="Red"
													CssClass="ml-2 mt-2"
													Display="Dynamic"
													Font-Size="14px"
													MinimumValue="1"
													MaximumValue="99" />
											</div>
										</div>
										<div class="col-md-12 p-2">
											<div class="form-group ml-4">
												<asp:CheckBox runat="server" ID="cbCutlery"  />
												<label class="label" for="cbCutlery">Include Cutlery</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<asp:Button ID="btnAdd" Text="Add to cart" CssClass="btn btn-primary btn-block" runat="server" OnClick="btnAdd_OnClick" />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<a href="Menu.aspx" style="transition: none; color: inherit;">
													<p>
														<span class="fa fa-arrow-left"></span>
														Return to menu
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
