using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region AdditionalNamespaces
using System.Data.Entity;
using eToolsSystem.Entities;
using eToolsSystem.DAL;
using eToolsSystem.Entities.POCOs;
#endregion

namespace eToolsSystem.BLL
{
    [DataObject]
    public class eToolsReceivingController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<OutstandingPurchaseOrder> OutstandingPurchaseOrder_List()
        {
            using (eToolContext context = new eToolContext())
            {
                var results = from PO in context.PurchaseOrders.ToList()
                              orderby PO.PurchaseOrderID
                              where PO.Closed != true && PO.OrderDate != null
                              select new OutstandingPurchaseOrder
                              {
                                  PurchaseOrderID = PO.PurchaseOrderID,
                                  OrderDate = PO.OrderDate,
                                  Vendor = PO.Vendor.VendorName,
                                  ContactPhone = PO.Vendor.Phone
                              };
                return results.ToList();
            }
        }
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public OutstandingPurchaseOrder OutstandingPurchaseOrder_GetByID(int purchaseOrderID)
        {
            using (eToolContext context = new eToolContext())
            {
                var results = from PO in context.PurchaseOrders
                              orderby PO.PurchaseOrderID
                              where PO.PurchaseOrderID == purchaseOrderID
                              select new OutstandingPurchaseOrder
                              {
                                  PurchaseOrderID = PO.PurchaseOrderID,
                                  OrderDate = PO.OrderDate,
                                  Vendor = PO.Vendor.VendorName,
                                  ContactPhone = PO.Vendor.Phone
                              };
                return results.SingleOrDefault();
            }
        }
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<OutstandingPurchaseOrderDetail> OutstandingPurchaseOrderDetail_List(int purchaseOrderID)
        {
            using (eToolContext context = new eToolContext())
            {
                var results = from POD in context.PurchaseOrderDetails.ToList()
                              where POD.PurchaseOrderID == purchaseOrderID
                              select new OutstandingPurchaseOrderDetail
                              {
                                  StockItemID = POD.StockItemID,
                                  Description = POD.StockItem.Description,
                                  Quantity = POD.Quantity
                              };
                return results.ToList();
            }
        }
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public StockItem StockItemByID(int ItemID)
        {
            using (eToolContext context = new eToolContext())
            {
                return context.StockItems.Where(anItem => anItem.StockItemID == ItemID).SingleOrDefault();
            }
        }
        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void StockItem_Update(StockItem item)
        {
            using (eToolContext context = new eToolContext())
            {
                context.Entry<StockItem>(context.StockItems.Attach(item)).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }
        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public int ReceivedOrder_Add(ReceiveOrder item)
        {
            using (eToolContext context = new eToolContext())
            {
                ReceiveOrder added = null;
                added = context.ReceiveOrders.Add(item);
                context.SaveChanges();
                return added.ReceiveOrderID;
            }

        }
        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public int ReceivedOrderDetail_Add(ReceiveOrderDetail item)
        {
            using (eToolContext context = new eToolContext())
            {
                ReceiveOrderDetail added = null;
                added = context.ReceiveOrderDetails.Add(item);
                context.SaveChanges();
                return added.ReceiveOrderDetailID;
            }

        }
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public PurchaseOrderDetail PurchaseOrderDetail_GetByPoIdStockId(int purchaseOrderID, int stockID)
        {
            using (eToolContext context = new eToolContext())
            {
                return context.PurchaseOrderDetails.Where(POD => POD.PurchaseOrderID == purchaseOrderID && POD.StockItemID == stockID).SingleOrDefault();
            }
        }
        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void ReturnOrderDetails_Add(ReturnedOrderDetail item)
        {
            using (eToolContext context = new eToolContext())
            {
                ReturnedOrderDetail added = null;
                added = context.ReturnedOrderDetails.Add(item);
                context.SaveChanges();
                //return added.ReturnedOrderDetailID;
            }
        }
        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void PurchaseOrder_Update(PurchaseOrder item)
        {
            using (eToolContext context = new eToolContext())
            {
                context.Entry<PurchaseOrder>(context.PurchaseOrders.Attach(item)).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public PurchaseOrder PurchaseOrder_GetByID(int purchaseOrderID)
        {
            using (eToolContext context = new eToolContext())
            {
                return context.PurchaseOrders.Where(PO => PO.PurchaseOrderID == purchaseOrderID).SingleOrDefault();
            }
        }
    }
}