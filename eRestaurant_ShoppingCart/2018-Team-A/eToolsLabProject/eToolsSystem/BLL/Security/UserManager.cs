using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region AdditionalNamespaces
using Microsoft.AspNet.Identity;
using eToolsSystem.Entities.Security;
using eToolsSystem.DAL.Security;
using Microsoft.AspNet.Identity.EntityFramework;
using eToolsSystem.DAL;
#endregion
namespace eToolsSystem.BLL.Security
{
    public class UserManager : UserManager<ApplicationUser>
    {
        #region Constants
        //THIS CODE IS FROM THE DEMO SITE AND IS UNALTERED
        //-Aaron
        private const string STR_DEFAULT_PASSWORD = "Pa$$word1";
        /// <summary>Requires FirstName and LastName</summary>
        private const string STR_USERNAME_FORMAT = "{0}";
        /// <summary>Requires UserName</summary>
        //private const string STR_EMAIL_FORMAT = "{0}@eRestaurant.tba";
        private const string STR_WEBMASTER_USERNAME = "Webmaster";
        #endregion

        

        public UserManager() : base(new UserStore<ApplicationUser>(new ApplicationDbContext()))
        {
        }

        public void AddDefaultUsers()
        {
            using (var context = new eToolContext())
            {
                var onlineCustomers = from data in context.OnlineCustomers
                                      select data;
                foreach (var onlineCustomer in onlineCustomers)
                {
                    // Check if they exist
                    if (!Users.Any(u => u.OnlineCustomerID.HasValue && u.OnlineCustomerID.Value == onlineCustomer.OnlineCustomerID))
                    {
                        string userName = string.Format(STR_USERNAME_FORMAT, onlineCustomer.UserName);
                        var appUser = new ApplicationUser()
                        {
                            UserName = userName,
                            OnlineCustomerID = onlineCustomer.OnlineCustomerID
                        };
                        // NOTE: The following needs to use the this keyword in order to have access to the extension method
                        //       Create(ApplicationUser user, string password)
                        this.Create(appUser, STR_DEFAULT_PASSWORD);
                    }
                }
                // Add a web  master user
                if (!Users.Any(u => u.UserName.Equals(STR_WEBMASTER_USERNAME)))
                {
                    var webMasterAccount = new ApplicationUser()
                    {
                        UserName = STR_WEBMASTER_USERNAME
                    };
                    this.Create(webMasterAccount, STR_DEFAULT_PASSWORD);
                }
            }
        }
    }
}
