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
    public class EmployeeSecurity : IdentityUser
    {
        public int? EmployeeID { get; set; }
    }
}
