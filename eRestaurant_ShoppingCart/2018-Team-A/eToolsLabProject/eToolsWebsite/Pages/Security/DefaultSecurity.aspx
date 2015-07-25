﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DefaultSecurity.aspx.cs" Inherits="Pages_Security_DefaultSecurity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row jumbotron">
        <h1>Site Administration</h1>
    </div>
    <div class="row">
        <div class="col-md-9">
            <h2>Users</h2>
            <asp:ListView ID="UserListView" runat="server"
    ItemType="eToolsSystem.Entities.Security.ApplicationUser"
    OnItemCommand="UserListView_ItemCommand">
    <EmptyDataTemplate>
        <table runat="server">
            <tr>
                <td>
                    No users in this site.
                    <asp:LinkButton runat="server" CommandName="AddEmployees" Text="Add Employees as users" ID="AddEmployeesButton" />
                </td>
            </tr>
        </table>
    </EmptyDataTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <asp:Label Text='<%# Item.UserName %>' runat="server" ID="UserNameLabel" /></td>
            
            <td><em>password is hashed</em></td>
            <td>
                <asp:Label Text='<%# Item.OnlineCustomerID %>' runat="server" ID="EmployeeIDLabel" />
                <asp:DropDownList ID="EmployeeIDDropDown_Item" runat="server"
                    AppendDataBoundItems="true" SelectedValue='<%# Item.OnlineCustomerID %>'
                    DataSourceID="EmployeeDataSource" Enabled="false"
                    DataTextField="FullName" DataValueField="EmployeeID">
                    <asp:ListItem Value="">[none]</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label runat="server" ID="RolesCountLabel"
                    Text='<%# string.Join(", ", Item.Roles.Select(x=>x.RoleId).ToArray()) %>' />
            </td>
        </tr>
    </ItemTemplate>
    <LayoutTemplate>
        <table runat="server">
            <tr runat="server">
                <td runat="server">
                    <table runat="server" id="itemPlaceholderContainer"
                        class="table table-condensed table-hover table-striped">
                        <tr runat="server">
                            <th runat="server">User Name</th>
                            <th runat="server">Password</th>
                            <th runat="server">Employee</th>
                            <th runat="server">Roles</th>
                        </tr>
                        <tr runat="server" id="itemPlaceholder"></tr>
                    </table>
                </td>
            </tr>
            <tr runat="server">
                <td runat="server">
                    <asp:DataPager runat="server" ID="DataPager1">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                        </Fields>
                    </asp:DataPager>
                </td>
            </tr>
        </table>
    </LayoutTemplate>
</asp:ListView>
        </div>
        <div class="col-md-3">
            <h2>Roles</h2>
            <asp:ListView ID="RoleListView" runat="server"
    ItemType="Microsoft.AspNet.Identity.EntityFramework.IdentityRole"
    OnItemCommand="RoleListView_ItemCommand">
    <EmptyDataTemplate>
        <table runat="server">
            <tr>
                <td>
                    No roles in this site.
                    <asp:LinkButton runat="server" CommandName="AddDefaultRoles" Text="Add default security roles" ID="AddDefaultRolesButton" />
                </td>
            </tr>
        </table>
    </EmptyDataTemplate>
    <ItemTemplate>
        <tr>
            <td><asp:Label Text='<%# Item.Name %>' runat="server" ID="NameLabel" /></td>
            <td><asp:Label Text='<%# Item.Users.Count %>' runat="server" ID="UsersCountLabel" /></td>
        </tr>
    </ItemTemplate>
    <LayoutTemplate>
        <table runat="server">
            <tr runat="server">
                <td runat="server">
                    <table runat="server" id="itemPlaceholderContainer"
                        class="table table-condensed table-hover table-striped">
                        <tr runat="server">
                            <th runat="server">Role Name</th>
                            <th runat="server">Users</th>
                        </tr>
                        <tr runat="server" id="itemPlaceholder"></tr>
                    </table>
                </td>
            </tr>
            <tr runat="server">
                <td runat="server">
                    <asp:DataPager runat="server" ID="DataPager2">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                        </Fields>
                    </asp:DataPager>
                </td>
            </tr>
        </table>
    </LayoutTemplate>
</asp:ListView>
        </div>
    </div>
    <%--List of Employees--%>
    <asp:ObjectDataSource runat="server" ID="EmployeeDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="Employee_List" TypeName="eToolsSystem.BLL.eToolsPurchasingController"></asp:ObjectDataSource>
</asp:Content>

