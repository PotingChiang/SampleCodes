﻿using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using eToolsWebsite;

#region AdditionalNamespaces
using eToolsSystem.BLL.Security;
using eToolsSystem.Entities.Security;
#endregion

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = UserName.Text };
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }
}