<Query Kind="Statements">
  <Connection>
    <ID>bd884904-c039-419a-8501-63eae259745b</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eTools</Database>
  </Connection>
</Query>

var results = from PO in PurchaseOrders
			orderby PO.PurchaseOrderID
			where PO.Closed != true && PO.OrderDate != null
			select new{
				PurchaseOrderID = PO.PurchaseOrderID,
				OrderDate = PO.OrderDate.ToString(),
				Vendor = PO.Vendor.VendorName,
				ContactPhone = PO.Vendor.Phone
			};
results.Dump();