<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Customer_Info.aspx.cs" Inherits="Pages_Sales_Customer_Info" %>

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

    <h1>Purchase Details</h1>
    <p>Enter your information for shipping and billing here</p>
    <label for="Payment_Type">
        <h4>Payment Type</h4>
        <asp:RadioButtonList ID="Payment_Type" runat="server" Width="164px">
            <asp:ListItem Value="0">Credit Card</asp:ListItem>
            <asp:ListItem Value="1">Debit Card</asp:ListItem>
            <asp:ListItem Value="2">Paypal</asp:ListItem>
            <asp:ListItem Value="3">Cash</asp:ListItem>
        </asp:RadioButtonList>
    </label>
    <div class="form-group">
        <h3>Billing Details</h3>
        <div class="form-control">
            <label for="Billing_Name" style="font-size:16px; align-content:center; width:150px;">Name</label>
            &nbsp;
            <input type="text" id="Billing_Name" style="height:20px; width:300px;"/>
        </div>
        <div class="form-control">
            <label for="Billing_Email" style="font-size:16px; align-content:center; width:150px;">Email</label>
            &nbsp;
            <input type="email" id="Billing_Email" style="height:20px; width:300px;"/>
        </div>
        <div class="form-control">
            <label for="Billing_Address" style="font-size:16px; width:150px;">Address</label>
            &nbsp;
            <input id="Billing_Address" style="height:20px;" size="100"/>
        </div>
        <div class="form-control">
            <label for="Billing_Phone" style="font-size:16px; align-content:center; width:150px;">Phone</label>
            &nbsp;
            <input type="tel" id="Billing_Phone" style="height:20px; width:300px;"/>
        </div>
    </div>
    <br />
    <div class="form-group">
        <h3>Shipping Details</h3>
        <div class="form-control">
            <label for="Shipping_Name" style="font-size:16px; align-content:center; width:150px;">Name</label>
            &nbsp;
            <input type="text" id="Shipping_Name" style="height:20px; width:300px;"/>
        </div>
        <div class="form-control">
            <label for="Shipping_Email" style="font-size:16px; align-content:center; width:150px;">Email</label>
            &nbsp;
            <input type="email" id="Shipping_Email" style="height:20px; width:300px;"/>
        </div>
        <div class="form-control">
            <label for="Shipping_Address" style="font-size:16px; width:150px;">Address</label>
            &nbsp;
            <input id="Shipping_Address" style="height:20px;" size="100"/>
        </div>
        <div class="form-control">
            <label for="Shipping_Phone" style="font-size:16px; align-content:center; width:150px;">Phone</label>
            &nbsp;
            <input type="tel" id="Shipping_Phone" style="height:20px; width:300px;"/>
        </div>
    </div>
    <br />
    <button id="Add_CustomerInfo" type="button" class="btn btn-primary">Add Customer</button>

</asp:Content>

