<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageOrder.aspx.cs" Inherits="FoodOrderingSystem.ManageOrder" %>
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
					<h2 class="mb-0 bread">Manage Order</h2>
				</div>
			</div>
		</div>
    </section>

    <section class="ftco-section">
         <div class="container-fluid w-75">
            <div class="row">
                <div class="col-lg-12 ftco-animate">
                    <h2>Order Table</h2>
                    <asp:Panel ID="panelDataa" runat="server" CssClass="table-wrap">
                        <table class="table table-sm">
                            <thead class="thead-primary">
                                <tr>
                                    <th>User Id</th>
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>Date</th>
                                    <th>Total</th>
                                    <th>&nbsp&nbsp&nbsp</th>
                                    <th>&nbsp&nbsp&nbsp</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% =FetchOrderData() %>
                            </tbody>
                        </table>
                    </asp:Panel>
                </div>
                <div class="col-md-12 mt-4">
					<div class="form-group">
						<a href="AdminDashboard.aspx" style="transition: none; color: inherit;">
							<p>
								<span class="fa fa-arrow-left"></span>
								Return to Admin Dashboard
							</p>
						</a>
					</div>
				</div>
            </div>
        </div>
    </section>
</asp:Content>
