<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuDrink.aspx.cs" Inherits="FoodOrderingSystem.MenuDrink" %>
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
						<span class="mr-2">About <i class="fa fa-chevron-right"></i></span>
						<span class="mr-2">Menu <i class="fa fa-chevron-right"></i></span>
						<span>Drinks <i class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Drinks</h2>
				</div>
			</div>
		</div>
    </section>

    <section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="sidebar-box ftco-animate">
						<div class="categories">
							<h3>Menu Directory</h3>
							<ul class="p-0">
                				<li><a href="VegFoods.aspx">Veg <span class="fa fa-chevron-right"></span></a></li>
								<li><a href="NonVegFoods.aspx">Non Veg <span class="fa fa-chevron-right"></span></a></li>
								
								<li><a href="MenuDrink.aspx">Drinks <span class="fa fa-chevron-right"></span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<div class="row">
						<% =FetchDrinkData() %>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>
