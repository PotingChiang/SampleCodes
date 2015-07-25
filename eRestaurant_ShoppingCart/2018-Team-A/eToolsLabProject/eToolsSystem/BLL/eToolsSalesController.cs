using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.Data.Entity;
using eToolsSystem.Entities;
using eToolsSystem.DAL;
using eToolsSystem.Entities.DTOs;
using eToolsSystem.Entities.POCOs;
using System.Security.Principal;
#endregion

namespace eToolsSystem.BLL
{
    [DataObject]
    public class eToolsSalesController
    {
        #region Add to Cart

            #region Shopping Cart
            //[DataObjectMethod(DataObjectMethodType.Insert,false)] it is only for view, e.g: listview....
            public void AddToCart(string currentUserName, int stockItemID, int quantity)
            {
                using (eToolContext context = new eToolContext())
                {
                    var currentCustomer = context.OnlineCustomers.FirstOrDefault( x => x.UserName == currentUserName);
                    if (currentCustomer == null)
                    {
                        OnlineCustomer newCustomer = new OnlineCustomer();
                        newCustomer.UserName = currentUserName;
                        newCustomer.CreatedOn = DateTime.Now;
                        // Or
                        //OnlineCustomer currentCustomer = new OnlineCustomer()
                        //{
                        //    UserName = user.Identity.Name,
                        //    CreatedOn = DateTime.Now
                        //};
                        currentCustomer = context.OnlineCustomers.Add(newCustomer);
                        context.SaveChanges();
                    }

                    var currentShoppingCart = context.ShoppingCarts.FirstOrDefault( x => x.OnlineCustomer.UserName == currentUserName);
                    if (currentShoppingCart == null)
                    {
                        ShoppingCart newShoppingCart = new ShoppingCart()
                        {
                            OnlineCustomerID = currentCustomer.OnlineCustomerID,
                            CreatedOn = DateTime.Now
                        };

                        currentShoppingCart = context.ShoppingCarts.Add(newShoppingCart);
                        context.SaveChanges();
                    }

                    ShoppingCartItem currentCartItem = new ShoppingCartItem()
                    {
                        ShoppingCartID = currentShoppingCart.ShoppingCartID,
                        StockItemID = stockItemID,
                        Quantity = quantity
                    };

                    foreach (ShoppingCartItem cartItem in context.ShoppingCartItems)
                    {
                        if(cartItem.ShoppingCartID == currentShoppingCart.ShoppingCartID
                            && cartItem.StockItemID == stockItemID)
                        {
                            context.Entry<ShoppingCartItem>(context.ShoppingCartItems.Attach(currentCartItem)).State 
                                = System.Data.Entity.EntityState.Modified;
                            context.SaveChanges();
                        }
                        else if(cartItem.ShoppingCartID == currentShoppingCart.ShoppingCartID
                            && cartItem.StockItemID != stockItemID)
                        {

                            //context.ShoppingCartItems.Add(currentCartItem);
                            currentCartItem = context.ShoppingCartItems.Add(currentCartItem);
                        }
 
                    }

                    //??? should be another way to update
                    var currentStockItem = from skItem in context.StockItems
                                           where skItem.StockItemID == stockItemID
                                           select new StockItem
                                           {
                                               StockItemID = skItem.StockItemID,
                                               Description = skItem.Description,
                                               SellingPrice = skItem.PurchasePrice,
                                               PurchasePrice = skItem.PurchasePrice,
                                               QuantityOnHand = skItem.QuantityOnHand - quantity,
                                               QuantityOnOrder = skItem.QuantityOnOrder,//??? is this for customer or for vendor
                                               ReOrderLevel = skItem.ReOrderLevel,
                                               Discontinued = skItem.Discontinued,
                                               VendorID = skItem.VendorID,
                                               VendorStockNumber = skItem.VendorStockNumber,
                                               CategoryID = skItem.CategoryID
                                           };

                    context.Entry<StockItem>(context.StockItems.Attach((StockItem)currentStockItem)).State
                                = System.Data.Entity.EntityState.Modified;

                    context.SaveChanges();

                }
            }
            #endregion

            #region StockItem
            [DataObjectMethod(DataObjectMethodType.Update,false)]
            public void StockItem_Update(StockItem selectedStockItem)
            {
                using (eToolContext context = new eToolContext())
                {
                    context.Entry<StockItem>(context.StockItems.Attach(selectedStockItem)).State
                        = System.Data.Entity.EntityState.Modified;
                    context.SaveChanges();
                }
            }
             #endregion

            #region Shopping Cart Item
            // ???
            [DataObjectMethod(DataObjectMethodType.Insert,false)]
            public void ShoppingCartItem_Add(ShoppingCartItem currentShoppingCartItem)
            {
                using (eToolContext context = new eToolContext())
                {
                    context.ShoppingCartItems.Add(currentShoppingCartItem);
                    context.SaveChanges();
                }
            }
            #endregion

        #endregion

        #region Shopping Product
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<AllCategories> GetCategories()
        {
            using (eToolContext context = new eToolContext())
            {
                var results = from cate in context.Categories
                              orderby cate.Description
                              select new AllCategories()
                              {
                                  CategoryID = cate.CategoryID,
                                  CategoryDes = cate.Description,
                                  ProductCount = cate.StockItems.Count

                              };

                return results.ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<CategoryProduct> GetProductByCategory(int CategoryID)
        {
            using (eToolContext context = new eToolContext())
            {
                var results = from pd in context.StockItems
                              where pd.Category.CategoryID == CategoryID
                              orderby pd.Description
                              select new CategoryProduct()
                              {
                                  CategoryID = CategoryID,
                                  StockItemID = pd.StockItemID,
                                  ProdcutCategoryDes = pd.Category.Description,              
                                  ProductDes = pd.Description,
                                  SellingPrice = pd.SellingPrice,
                                  QOH = pd.QuantityOnHand,
                                                   
                              };

                return results.ToList();
            }
        }

        #endregion
    }

}