using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eToolsSystem.Entities.POCOs
{
    public class CategoryProduct
    {
        // need to add customerID for login or need or whole class for login customer
        //public int CustomerID { get; set; } //return many customerID -> NG
        //public int ShoppingCartID { get; set; } // return many shoppingID -> NG
        // Or try public ShoppingCartItems ShoppingCartItems {get;set;} => return List<ShoppingCartItems>
        public int CategoryID { get; set; }
        public int StockItemID { get; set; }
        public string ProdcutCategoryDes { get; set; }
        public string ProductDes { get; set; }
        public Decimal SellingPrice { get; set; }
        public int QOH { get; set; }
        //public bool Discontinued { get; set; }

    }
}
