<Query Kind="Statements">
  <Connection>
    <ID>bd884904-c039-419a-8501-63eae259745b</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>eTools</Database>
  </Connection>
</Query>

//list purchaseorder details by poID
var parameter = 358;
var results = from POD in PurchaseOrderDetails
										where POD.PurchaseOrderID == parameter
										select new {
											StockItemID = POD.StockItemID,
											Description = POD.StockItem.Description,
											Quantity = POD.Quantity								
										};
results.Dump();