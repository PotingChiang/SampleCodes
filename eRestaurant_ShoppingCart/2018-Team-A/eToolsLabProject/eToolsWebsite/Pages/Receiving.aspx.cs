using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region AdditionalNamespaces
using eToolsSystem.BLL;
using eToolsSystem.Entities.POCOs;
using eToolsSystem;
#endregion

public partial class Pages_Receiving : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void OutstandingPOGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        eToolsReceivingController controller = new eToolsReceivingController();
        //This is how I get a value from a gridview cell
        OutstandingPurchaseOrder item = controller.OutstandingPurchaseOrder_GetByID(Int32.Parse(OutstandingPOGridView.SelectedRow.Cells[1].Text));
        PONumber.Text = "PO#: " + item.PurchaseOrderID.ToString();
        Vendor.Text = "Vendor: " + item.Vendor.ToString();
        ContactPhone.Text = "Contact Phone: " + item.ContactPhone.ToString();

        //not sure if this works the way it should but I dida manual fix anyways
        List<OutstandingPurchaseOrderDetail> PODetailsList = controller.OutstandingPurchaseOrderDetail_List(item.PurchaseOrderID);
        PODetailsGrid.DataSource = PODetailsList;
        PODetailsGrid.DataBind();

        foreach(GridViewRow row in PODetailsGrid.Rows){
            //manually fill in gridview
            row.Cells[0].Text = PODetailsList[row.RowIndex].StockItemID.ToString();
            row.Cells[1].Text = PODetailsList[row.RowIndex].Description.ToString();
            row.Cells[2].Text = PODetailsList[row.RowIndex].Quantity.ToString();            
        }
        //Make my buttons visibe
        ReceiveButton.Visible = true;
        ForceClose.Visible = true;
        ForceCloseReason.Visible = true;
        Label1.Visible = true;
    }
    protected void ReceiveButton_Click(object sender, EventArgs e)
    {
        eToolsReceivingController controller = new eToolsReceivingController();
        int PurchaseOrderID;
        PurchaseOrderID = Int32.Parse(OutstandingPOGridView.SelectedRow.Cells[1].Text);

        //create new ReceiveOrder
        ReceiveOrder receipt = new ReceiveOrder();
        receipt.PurchaseOrderID = PurchaseOrderID;
        receipt.ReceiveDate = DateTime.Now;

        //actually add the ReceiveOrder
        int ReceiveOrderID = controller.ReceivedOrder_Add(receipt);

        //grab the receiveOrder so I can use it to fill the details in

        //updating stockItems, inserting ReceiveOrder
        bool OrderFullyReceived = true;
        foreach (GridViewRow row in PODetailsGrid.Rows)
        {
            int StockItemID;
            int QuantityReceived;
            int QuantityReturned;
            string Reason;
            //manually fill in my variables
            StockItemID = Int32.Parse(row.Cells[0].Text);
            TextBox Received = (TextBox)row.Cells[3].FindControl("Receive");
            QuantityReceived = Int32.Parse(Received.Text);
            TextBox Returned = (TextBox)row.Cells[4].FindControl("Return");
            QuantityReturned = Int32.Parse(Returned.Text);
            TextBox ReasonBox = (TextBox)row.Cells[5].FindControl("Reason");
            Reason = ReasonBox.Text;
            //grab the stock item and manipulate it's values
            StockItem stockItem = controller.StockItemByID(StockItemID);
            stockItem.QuantityOnHand = stockItem.QuantityOnHand + QuantityReceived;
            stockItem.QuantityOnOrder = stockItem.QuantityOnOrder - QuantityReceived;
            //actually update the StockItem
            controller.StockItem_Update(stockItem);
            //create new ReceiveOrderDetails
            ReceiveOrderDetail receiptDetail = new ReceiveOrderDetail();
            receiptDetail.ReceiveOrderID = ReceiveOrderID;
            //Make  PurchOrdDet list with the purchase order ID,
            //grab the detail individually bu matching values (new LINQ queryto do this)
            int PurchaseOrderDetailID = controller.PurchaseOrderDetail_GetByPoIdStockId(PurchaseOrderID,StockItemID).PurchaseOrderDetailID;//ERROR here
            receiptDetail.PurchaseOrderDetailID = PurchaseOrderDetailID;
            receiptDetail.QuantityReceived = QuantityReceived;
            //actually insert the receipt detail
            controller.ReceivedOrderDetail_Add(receiptDetail);
            if (QuantityReturned > 0)
            {
                //create new return order details
                ReturnedOrderDetail ReturnDetails = new ReturnedOrderDetail();
                ReturnDetails.ReceiveOrderID = ReceiveOrderID;
                ReturnDetails.PurchaseOrderDetailID = PurchaseOrderDetailID;
                ReturnDetails.ItemDescription = row.Cells[1].Text;
                ReturnDetails.Quantity = QuantityReturned;
                ReturnDetails.Reason = Reason;

                controller.ReturnOrderDetails_Add(ReturnDetails);
                OrderFullyReceived = false;
            }
            
        }
        if (OrderFullyReceived)
        {
            //update the purchase order as closed
            PurchaseOrder updating = controller.PurchaseOrder_GetByID(PurchaseOrderID);
            updating.Closed = true;
            controller.PurchaseOrder_Update(updating);
        }
    }
}