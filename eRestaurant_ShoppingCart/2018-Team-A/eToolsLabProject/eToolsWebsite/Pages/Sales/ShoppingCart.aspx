<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="Pages_Sales_ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <nav>
        <ul class="nav nav-pills">
            <li><a href="../Sales/ShoppingProduct.aspx" title="Shopping_Product">Continue Shopping
                <span class="glyphicon glyphicon-arrow-left"></span>
                </a></li>
            <li><a href="../Sales/ShoppingCart.aspx" title="View/Edit_Cart">View/Edit Cart
                <span class="glyphicon glyphicon-shopping-cart"></span>
                </a></li>
            <li><a href="../Sales/Customer_Info.aspx" title="Customer_Information">Customer Information
                <span class="glyphicon glyphicon-info-sign"></span>
                </a></li>
            <li><a href="../Receiving.aspx" title="Place_Order">Place Order
                <span class="glyphicon glyphicon-credit-card"></span>
                </a></li>
        </ul>
    </nav>

    <div class="well" style="background-color:#337ab7;">
        <h1 style="text-align:left; color:white;">
            Your Shopping Cart
        </h1>
    </div>

</asp:Content>

