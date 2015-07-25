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
    public class EmployeeMGR : UserManager<EmployeeSecurity>
    {
        #region Constants
        //THIS CODE IS FROM THE DEMO SITE AND IS UNALTERED
        //-Aaron
        private const string STR_DEFAULT_PASSWORD = "Pa$$word1";
        /// <summary>Requires FirstName and LastName</summary>
        private const string STR_USERNAME_FORMAT = "{0}.{0}";
        /// <summary>Requires UserName</summary>
        //private const string STR_EMAIL_FORMAT = "{0}@eRestaurant.tba";
        private const string STR_WEBMASTER_USERNAME = "Webmaster";
        #endregion

        public EmployeeMGR()
            : base(new UserStore<EmployeeSecurity>(new ApplicationDbContext()))
        {
        }

        public void AddDefaultUsers()
        {
            using (var context = new eToolContext())
            {
                var employees = from data in context.Employees
                                where !data.DateReleased.HasValue
                                select data;
                foreach (var person in employees)
                {
                    // Check if they exist
                    if (!Users.Any(u => u.EmployeeID.HasValue && u.EmployeeID.Value == person.EmployeeID))
                    {
                        string userName = string.Format(STR_USERNAME_FORMAT, person.FirstName, person.LastName);
                        var appUser = new EmployeeSecurity()
                        {
                            UserName = userName,
                            EmployeeID = person.EmployeeID
                        };
                        // NOTE: The following needs to use the this keyword in order to have access to the extension method
                        //       Create(ApplicationUser user, string password)
                        this.Create(appUser, STR_DEFAULT_PASSWORD);
                    }
                }
                // Add a web  master user
                if (!Users.Any(u => u.UserName.Equals(STR_WEBMASTER_USERNAME)))
                {
                    var webMasterAccount = new EmployeeSecurity()
                    {
                        UserName = STR_WEBMASTER_USERNAME
                    };
                    this.Create(webMasterAccount, STR_DEFAULT_PASSWORD);
                }
            }
        }
    }
}
