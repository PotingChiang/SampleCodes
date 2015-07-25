using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region AdditionalNamespages
using Microsoft.AspNet.Identity.EntityFramework;
#endregion

namespace eToolsSystem.Entities.Security
{
    // You can add User data for the user by adding more properties to your User class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        
        public int? OnlineCustomerID { get; set; }
    }
}
