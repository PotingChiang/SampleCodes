<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ShoppingProduct.aspx.cs" Inherits="Pages_Sales_ShoppingProduct" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="my" TagName="MessageUserControl" %>


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
    <my:MessageUserControl runat="server" ID="MessageUserControl" />

    <div class="row">
        <div class="pull-left">      
            <h3>Browse By Category</h3>
            <asp:GridView ID="AllCategories_GL" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataSourceID="ALLCategories_ODS" 
                GridLines="None" PageSize="15" Width="221px"
                DataKeyNames="CategoryID">
                <Columns>  
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="CategoryID" runat="server" Text='<%# Eval("CategoryID") %>'
                                Visible="False"></asp:Label>
                            <asp:LinkButton ID="ShowProductByCategory" runat="server"
                                 CommandName="Select" CssClass="btn btn-link">
                                <span><%# Eval("CategoryDes") %></span>
                            </asp:LinkButton>
                            <asp:Label ID="ProductCount_LB" runat="server">
                                <span class="badge"><%# Eval("ProductCount") %></span> 
                            </asp:Label>                    
                            <br />
                        </ItemTemplate>
                        <ControlStyle Font-Size="Medium" />
                    </asp:TemplateField>         
                </Columns>

                <EmptyDataTemplate>
                    No Data Available Now
                </EmptyDataTemplate>

                <HeaderStyle Font-Size="Medium" />

                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" NextPageText="Next" Position="Top" PreviousPageText="Previous" />

            </asp:GridView>
        </div>
        <div class="pull-right">
            <h3>Product</h3>
            <asp:GridView ID="ProductByCate_GL" runat="server" 
                AutoGenerateColumns="False" GridLines="None" AllowPaging="True" PageSize="5"
                ItemType="eToolsSystem.Entities.POCOs.CategoryProduct" DataSourceID="ProductByCate_ODS" 
                Width="628px" Height="16px"
                OnRowCommand="ProductByCate_GL_RowCommand">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="well">
                                <asp:Button ID="Btn_Login" runat="server" Text="Login" Height="30px" Width="50px"
                                        Visible='<%# !IsLoggedIn() %>' CssClass="btn btn-success btn-xs"
                                         OnCommand="Btn_Login_Command" CommandName="Login"/>

                                <asp:Button ID="Btn_Add" runat="server" Text="Add" Height="30px" Width="50px"
                                        Visible='<%# IsLoggedIn() %>' CssClass="btn btn-primary btn-xs" 
                                        CommandArgument="<%# Item.StockItemID %>"
                                        CommandName="AddToCart"/>

                                <asp:TextBox ID="QYB_TextBox" runat="server"
                                    TextMode="Number" Text="1"></asp:TextBox>
                                (Enter Quantities you want to buy)
                                <br />
                                <br />
                                <asp:Label ID="ProductCategoryDes_LB" runat="server"  
                                   Font-Size="Medium" Text="<%# Item.ProdcutCategoryDes %>"></asp:Label>
                                <br />
                                <asp:Label ID="ProductDes_LB" runat="server" 
                                    Text="<%# Item.ProductDes %>"></asp:Label>
                                <asp:Label ID="SellingPrice_LB" runat="server" 
                                    Text=<%# "Price: " + ((decimal)Eval("SellingPrice")).ToString("C") %>></asp:Label>                                     
                                <asp:Label ID="QOH_LB" runat="server" 
                                    Text='<%# "In Stock: " + Eval("QOH") %>'></asp:Label>                                 
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    No Data Available now
                </EmptyDataTemplate>                  
                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" NextPageText="Next" Position="Top" PreviousPageText="Previous" />
            </asp:GridView>
        </div>
    </div>
    <asp:ObjectDataSource ID="ALLCategories_ODS" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetCategories" 
        TypeName="eToolsSystem.BLL.eToolsSalesController">
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="ProductByCate_ODS" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetProductByCategory" 
        TypeName="eToolsSystem.BLL.eToolsSalesController">
        <SelectParameters>
            <asp:ControlParameter ControlID="AllCategories_GL" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>  

</asp:Content>

