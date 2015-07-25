<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ShoppingProductFailed.aspx.cs" Inherits="Pages_Sales_ShoppingProduct" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="my" TagName="MessageUserControl" %>


<asp:Content ID="Content_ShoppingProduct" ContentPlaceHolderID="MainContent" Runat="Server">
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
        <h1 style="text-align:center; color:white;">Product By Category</h1>
        <p style="text-align:center;font-size:medium; color:#BDBDBD;">
            <span class="glyphicon glyphicon-hand-right"></span> 
            Available Online & In-Store <span class="glyphicon glyphicon-hand-left"></span>
        </p>
    </div> 

    <my:MessageUserControl runat="server" ID="MessageUserControl" />

    <table style="width: 100%;">
        <thead>
            <tr>
                <td>
                    <h2>Browse By Category</h2>
                </td>
                <td>
                    <h2>Product</h2>

                </td>
                
            </tr>
        </thead>
            <tr>
                <td>
                <asp:Repeater ID="Rp_ProductByCategory" runat="server" DataSourceID="ODS_ProductByCategory">
                    <ItemTemplate>
                        <h4>
                            <asp:LinkButton ID="LinkButton_ProductByCategory" runat="server"
                                    OnCommand="LinkButton_ProductByCategory_Command" CommandArgument='<%# Eval("CategoryDes") %>'
                                    CommandName="CategoryDes">
                                <%# Eval("CategoryDes") %>
                            </asp:LinkButton>
                                    
                            <span class="badge"> <%# Eval("ProductCount") %></span>
                        </h4>
                    </ItemTemplate>
                </asp:Repeater>
                </td>
                <td>
                    <asp:Repeater ID="AllProductList" runat="server">
                        <ItemTemplate>                
                            <%--<div class="well">
                                <label id="Label_ProductCategoryDes" class="label label-success" style="font-size:16px;">
                                    <%# Eval("ProdcutCategoryDes")%>
                                </label>
                                <h4>
                                    <%# Eval("ProductDes") %>
                                </h4>
                                <h5>
                                    <span>
                                        <strong>Price :</strong>                                    
                                        <%# ((decimal)Eval("SellingPrice")).ToString("C") %>, 
                                    </span>                                  
                                    <span>
                                        <strong>In Stock :</strong>
                                         <%# Eval("QOH") %>
                                    </span>                           
                                </h5>                               
                                <asp:Button ID="Btn_Login" runat="server" Text="Login" 
                                    Visible='<%# !IsLoggedIn() %>' CssClass="btn btn-success"
                                     OnCommand="Btn_Login_Command" CommandName="Login"/>
                                <asp:Button ID="Btn_Add" runat="server" Text="Add" 
                                        Visible='<%# IsLoggedIn() %>' CssClass="btn btn-primary" 
                                     OnCommand="Btn_Add_Command"  CommandArgument='<%# Eval("StockItemID") %>'
                                     CommandName="AddToCart"/>
                                <span>
                                    <input id="Text_QBuy" type="text" value="1"/>
                                    (Enter Quantities you want to buy)
                                </span>
                            </div>--%>
                        </ItemTemplate>
                    </asp:Repeater>  
                </td>
            </tr> 
    </table>
    <asp:ObjectDataSource ID="ODS_ProductByCategory" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetCategories" 
        TypeName="eToolsSystem.BLL.eToolsSalesController">
    </asp:ObjectDataSource>
</asp:Content>
--%>
