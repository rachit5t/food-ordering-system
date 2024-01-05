<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="FoodOrderingSystem.ViewCart"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-wrap hero-wrap-2" style="background-image: url('assets/background.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-end justify-content-center">
                <div class="col-md-9 ftco-animate mb-5 text-center">
                    <h2 class="mb-0 bread">View Cart</h2>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
    			<div class="table-wrap">

                    <asp:ListView ID="CartList" runat="server">
                        <LayoutTemplate>
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr>
								        <th>&nbsp;</th>
								        <th>Product Name</th>
								        <th>Price</th>
								        <th>Quantity</th>
								        <th>Total</th>
								        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr class="alert" role"alert">
                                <td>
                                    <div class="img" style="background-image: url(assets/<%# Eval("ProdImg") %>);"></div>
                                </td>
                                <td> <%# Eval("ProdName") %> </td>
                                <td>Rs <%# Eval("ProdPrice") %> </td>
                                <td> <%# Eval("OrderQty") %> </td>
                                <td> <%# Eval("Total") %> </td>
                                <td>
                                    <asp:Button 
                                        runat="server" 
                                        ID="BtnRemove" 
                                        CssClass="btn btn-danger"
                                        CommandArgument='<%# Eval("ProdId") %>' 
                                        CommandName="RemoveBtnClick" 
                                        OnClick="BtnRemove_OnClick"
                                        Text="Remove" />
                                    <!--
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close" runat="server" onserverclick="BtnRemove_OnClick">
				            	        <span aria-hidden="true"><i class="fa fa-close"></i></span>
                                    </button>
                                    -->
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>

    		    </div>
    	    </div>
            <div class="row justify-content-end">
    			<div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>Cart Totals</h3>
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
    				<p class="text-center"><a href="Checkout.aspx" class="btn btn-primary py-3 px-4">Proceed to Checkout</a></p>
    			</div>
    		</div>
        </div>
    </section>
</asp:Content>
