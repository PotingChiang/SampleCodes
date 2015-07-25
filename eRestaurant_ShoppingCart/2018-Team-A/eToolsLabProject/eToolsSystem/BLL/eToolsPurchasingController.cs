using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.Entity;
using eToolsSystem.Entities;
using eToolsSystem.DAL;

namespace eToolsSystem.BLL
{
    [DataObject]
    public class eToolsPurchasingController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Vendor> Vendor_List()
        {
            using (eToolContext context = new eToolContext())
            {
                var results = from item in context.Vendors
                              orderby item.VendorName
                              select item;
                return results.ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Employee> Employee_List()
        {
            using (eToolContext context = new eToolContext())
            {
                var results = from item in context.Employees
                              orderby item.LastName
                              select item;
                return results.ToList();
            }
        }

        //[DataObjectMethod(DataObjectMethodType.Select, false)]
        //public List<StockItem> Purchase(int vendorID)
        //{
        //    using (eToolContext context = new eToolContext())
        //    {
        //        return context.StockItems.Where(anItem => anItem.VendorID == vendorID).ToList();
        //    }
        //}

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<StockItem> Purchase(String vendorID)
        {
            using (eToolContext context = new eToolContext())
            {
                return context.StockItems.Where(anItem => anItem.VendorID == anItem.VendorID).ToList();
            }
        }
    }
}