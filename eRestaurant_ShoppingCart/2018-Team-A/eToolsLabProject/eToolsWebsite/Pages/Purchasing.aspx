<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Purchasing.aspx.cs" Inherits="Pages_Purchasing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <table style="width: 50%">
        <tr>
            <td style="text-align: right; width: 126px;">Vendor:</td>
            <td style="height: 25px; width: 216px">
                <asp:DropDownList ID="VendorDropDownList" runat="server" DataSourceID="VendorDDLObjectDataSource" DataTextField="VendorName" DataValueField="VendorID" Width="200px" AppendDataBoundItems="True" OnSelectedIndexChanged="VendorDropDownList_SelectedIndexChanged">
                    <asp:ListItem>--Select Vendor--</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="height: 25px">
                <asp:LinkButton ID="Button1" runat="server" Text="Refresh" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 126px;">Employee:</td>
            <td style="height: 25px; width: 216px">
                <asp:DropDownList ID="EmployeeDropDownList" runat="server" DataSourceID="EmployeeDDLObjectDataSource" DataTextField="FullName" DataValueField="EmployeeID" Width="200px" AppendDataBoundItems="true">
                    <asp:ListItem Selected="True">--Select Employee--</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>

    <asp:ObjectDataSource ID="VendorDDLObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Vendor_List" TypeName="eToolsSystem.BLL.eToolsPurchasingController"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="EmployeeDDLObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Employee_List" TypeName="eToolsSystem.BLL.eToolsPurchasingController"></asp:ObjectDataSource>
             
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="PurchaseOrderGridViewODS">
        <Columns>
            <asp:BoundField DataField="VendorID" HeaderText="VendorID" SortExpression="VendorID" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
        </Columns>
    </asp:GridView>
             
    <br />
             
    <asp:ObjectDataSource ID="PurchaseOrderGridViewODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Purchase" TypeName="eToolsSystem.BLL.eToolsPurchasingController">
        <SelectParameters>
            <asp:ControlParameter ControlID="VendorDropDownList" Name="vendorID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

