package ca.nait.dmit.controller;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;
import ca.nait.dmit.domain.Item;
import ca.nait.dmit.domain.ShoppingCart;
import ca.nait.dmit.domain.ShoppingCartItem;

@Named("cartItemBean")
@SessionScoped
public class CartItemBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	//private Item currentItem = new Item();
	private ShoppingCart theShoppingCart = new ShoppingCart();
	//private ShoppingCartItem cartItem = new ShoppingCartItem();
	
	public CartItemBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ShoppingCart getTheShoppingCart() {
		return theShoppingCart;
	}
	public void setTheShoppingCart(ShoppingCart theShoppingCart) {
		this.theShoppingCart = theShoppingCart;
	}

	
	public String addToCart(Item currentItem) {
		
		String nextPage = "/pages/shoppingCart?faces-redirect=true";
//		private int quantity;
		
		//cartItem.setSellingPrice(currentItem.getPrice());
		ShoppingCartItem cartItem = new ShoppingCartItem();
		
//		cartItem.setQuantity(quantity);
		cartItem.setItem(currentItem);
		
		theShoppingCart.addToCart(cartItem);
		
		return nextPage;
	}
	

}
