using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region Additional Namespace
using eToolsSystem.Entities;
using eToolsSystem.Entities.POCOs;
using eToolsSystem.Entities.DTOs;
using eToolsSystem.BLL;
#endregion
public partial class Pages_Sales_ShoppingProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private CategoryProduct GetProductByCategory(GridViewRow row)
    {
        var cateDesLabel = row.FindControl("ProductCategoryDes_LB") as Label;
        var productDesLabel = row.FindControl("ProductDes_LB") as Label;
        var priceLabel = row.FindControl("SellingPrice_LB") as Label;
        var qohLabel = row.FindControl("QOH_LB") as Label;
        var result = new CategoryProduct()
        {
            ProdcutCategoryDes = cateDesLabel.Text,
            ProductDes = productDesLabel.Text,
            SellingPrice = Decimal.Parse(priceLabel.Text.ToString()),
            QOH = int.Parse(qohLabel.Text.ToString())

        };
        return result;
    }

    private List<CategoryProduct> GetRowsFrom(GridView theGridView)
    {
        List<CategoryProduct> result = new List<CategoryProduct>();
        foreach (GridViewRow row in theGridView.Rows)
        {
            var data = GetProductByCategory(row);
            result.Add(data);
        }
        return result;
    }


    protected void AllCategories_GL_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

    }

    #region Login
    public bool IsLoggedIn()
    {
        return Request.IsAuthenticated;
    }

    protected void Btn_Login_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/Account/Login.aspx");
    }

    #endregion
    protected void ProductByCate_GL_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddToCart"))
        {
            GridViewRow row = null;

            var currentUserName = User.Identity.Name;
            var stockItemID = int.Parse(e.CommandArgument.ToString());
            var QYB = row.FindControl("QYB_TextBox") as TextBox;

            eToolsSalesController controller = new eToolsSalesController();

            controller.AddToCart(currentUserName, stockItemID, int.Parse(QYB.Text));

        }
    }

}