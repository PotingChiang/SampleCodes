<Query Kind="Statements">
  <Connection>
    <ID>bd884904-c039-419a-8501-63eae259745b</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eTools</Database>
  </Connection>
</Query>

var stockID = 34;
var purchaseOrderID = 358;
var results = from POD in PurchaseOrderDetails
			where POD.PurchaseOrderID == purchaseOrderID && POD.StockItemID == stockID
			select new {
					PurchaseOrderDetailID = POD.PurchaseOrderDetailID,
					StockItemID = POD.StockItemID,
					PurchaseOrderID = POD.PurchaseOrderID,
					PurchasePrice = POD.PurchasePrice,
					Quantity = POD.Quantity
					};
results.Dump();