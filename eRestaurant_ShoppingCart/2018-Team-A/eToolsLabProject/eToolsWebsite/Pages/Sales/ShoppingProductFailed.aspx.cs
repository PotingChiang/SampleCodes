//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//using eToolsSystem.BLL;
//using eToolsSystem.Entities;
//using eToolsSystem.Entities.POCOs;
//using eToolsSystem.Entities.DTOs;

//public partial class Pages_Sales_ShoppingProduct : System.Web.UI.Page
//{
//    protected void Page_Load(object sender, EventArgs e)
//    {

//    }

//    #region Login
//    public bool IsLoggedIn()
//    {
//        return Request.IsAuthenticated;
//    }

//    #endregion

//    protected void LinkButton_ProductByCategory_Command(object sender, CommandEventArgs e)
//    {
//        int categoryID = e.CommandArgument.ToString();

//        eToolsSalesController controller = new eToolsSalesController();

//        List<CategoryProduct> productCategory = controller.GetProductByCategory(categoryDes);

//        AllProductList.DataSource = productCategory;
//        AllProductList.DataBind();
//    }

//    protected void Btn_Login_Command(object sender, CommandEventArgs e)
//    {
//        Response.Redirect("~/Account/Login.aspx");
//    }

//    protected void Btn_Add_Command(object sender, CommandEventArgs e)
//    {

//    }
//    protected void Rp_ProductByCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
//    {
//        if (e.CommandName.Equals("AddToCart"))
//        {
//            var currentUserName = User.Identity.Name;
//            int stockItemID = int.Parse(e.CommandArgument.ToString());
//            var QOB = e.Item.FindControl("Text_QBuy") as TextBox;

//            eToolsSalesController controller = new eToolsSalesController();

//            controller.AddToCart(currentUserName, stockItemID, int.Parse(QOB.Text));

//        }
//    }
//}