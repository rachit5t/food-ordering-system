<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="FoodOrderingSystem.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-wrap hero-wrap-2" style="background-image: url('assets/background.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate mb-5 text-center">
                    <h2 class="mb-0 bread">Checkout</h2>
                </div>
            </div>
        </div>
    </section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate">
				    <div class="row mt-5 pt-3 d-flex">
	          			<div class="col-md-6 d-flex">
	          				<div class="cart-detail cart-total p-3 p-md-4">
	          					<h3 class="billing-heading mb-4">Cart Total</h3>
	          					<p class="d-flex">
		    						<span>Subtotal</span>
		    						<span>Rs <% =subTotal %></span>
		    					</p>
		    					<p class="d-flex">
		    						<span>Delivery</span>
		    						<span>Rs 5.00</span>
		    					</p>
		    					<hr>
		    					<p class="d-flex total-price">
		    						<span>Total</span>
		    						<span>Rs <% =subTotal+5 %></span>
		    					</p>
							</div>
	          			</div>
	          			<div class="col-md-6">
	          				<div class="cart-detail p-3 p-md-4">
	          					<h3 class="billing-heading mb-4">Payment Method</h3>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label>
												<asp:RadioButton ID="RbTransfer" CssClass="mr-2" runat="server" Text="&nbsp;Direct Bank Transfer" GroupName="payment" />  
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label>
												<asp:RadioButton ID="RbCash" CssClass="mr-2" runat="server" Text="&nbsp;Cash on Delivery" GroupName="payment" />
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label>
												<asp:RadioButton ID="RbPaypal" CssClass="mr-2" runat="server" Text="&nbsp;Paypal" GroupName="payment" />
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="checkbox">
											<label>
												<asp:CheckBox ID="CbTerms" CssClass="mr-2" runat="server" Text="&nbsp;I have read and accept the terms and conditions" />  
											</label>
										</div>
									</div>
								</div>
								<p>
									<asp:Button runat="server" ID="PlaceOrder" CssClass="btn btn-primary py-3 px-4" Text="Place an order" OnClick="PlaceOrder_OnClick"/>
								</p>
							</div>
	          			</div>
					 </div>
				</div>
			</div>
		</div>				
	</section>

</asp:Content>
