<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FoodOrderingSystem.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-wrap" style="background-image: url('assets/homepage-bg.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-8 ftco-animate d-flex align-items-end">
          	        <div class="w-100 text-center">
	                    <h1 class="mb-4"> <span>"Discover Nepal, One Bite at a Time – Order Now!"</span></h1>
	                    <p>
                            <a href="Menu.aspx" class="btn btn-primary py-2 px-4">Start Taste Journey &rarr;</a> 
                           
	                    </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-intro">
    	<div class="container" ">
    		<div class="row no-gutters">
    			<div class="col-md-4 d-flex mx-3 my-3">
    				<div class="intro d-lg-flex w-100 ftco-animate">
    					<div class="icon">
    					</div>
    					<div class="text">
    						<h2>Neplai Taste</h2>
    						<p>We provide authentic nepali food at your doorstep.</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-4 d-flex mx-3 my-3" >
    				<div class="intro color-1 d-lg-flex w-100 ftco-animate">
    					<div class="icon">
    					</div>
    					<div class="text">
    						<h2>Quality Assured</h2>
    						<p>All the resturents patnered with us go through strict quality inspections.</p>
    					</div>
    				</div>
    			</div>
    			    		</div>
    	</div>
    </section>
</asp:Content>
