<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Receiving.aspx.cs" Inherits="Pages_Receiving" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Receiving</h1>
    <asp:GridView ID="OutstandingPOGridView" runat="server" 
        DataSourceID="ODSListOutstandingPurchaseOrders" 
        DataKeyNames="PurchaseOrderID" 
        OnSelectedIndexChanged="OutstandingPOGridView_SelectedIndexChanged">
        <Columns>
            <asp:CommandField SelectText="View Order" ShowSelectButton="True" />
        </Columns>
        <EmptyDataTemplate>
            All Purchase Orders have been received.
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource ID="ODSListOutstandingPurchaseOrders" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="OutstandingPurchaseOrder_List" TypeName="eToolsSystem.BLL.eToolsReceivingController"></asp:ObjectDataSource>
    <br />
    <asp:Label ID ="PONumber" runat="server" />&nbsp;&nbsp;
    <asp:Label ID ="Vendor" runat="server" />&nbsp;&nbsp;
    <asp:Label ID ="ContactPhone" runat="server" />
    <br />
    <asp:GridView ID="PODetailsGrid" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText="Stock #">
                <asp:ItemTemplate>
                    <asp:Label ID="Stock" runat="server"
                        Text='<%#Eval("StockItemID") %>'></asp:Label><!--whatever I called it in my POCO-->
                    </asp:ItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <asp:ItemTemplate>
                    <asp:Label ID ="Description" runat ="server">
                        Text='<%#Eval("Description") %>'></asp:Label>
                </asp:ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ordered">
                <asp:ItemTemplate>
                    <asp:Label ID ="Quantity" runat ="server">
                        Text='<%#Eval("Quantity") %>'></asp:Label>
                </asp:ItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Receive">
                <ItemTemplate>
                    <asp:TextBox ID="Receive" runat="server" Text ="0" Width="50px"></asp:TextBox>
                </ItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="Return">
                <ItemTemplate>
                    <asp:TextBox ID="Return" runat="server" Text ="0" Width="50px"></asp:TextBox>
                </ItemTemplate>
           </asp:TemplateField>
           <asp:TemplateField HeaderText="Reason">
                <ItemTemplate>
                    <asp:TextBox ID="Reason" runat="server"></asp:TextBox>
                </ItemTemplate>
           </asp:TemplateField>
            
        </Columns>
    </asp:GridView>
    <asp:LinkButton ID="ReceiveButton" runat="server" Visible="false" OnClick="ReceiveButton_Click">Receive</asp:LinkButton>
    <br />
    <asp:LinkButton ID="ForceClose" runat="server" Visible="false">Force Close</asp:LinkButton>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Force Close Reason: " Visible="false"></asp:Label><asp:TextBox ID="ForceCloseReason" runat="server" Width="240px" Visible="false"></asp:TextBox>
</asp:Content>

