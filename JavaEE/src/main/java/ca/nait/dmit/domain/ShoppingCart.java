package ca.nait.dmit.domain;

import java.io.Serializable;
import java.util.Hashtable;

public class ShoppingCart implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Hashtable<Long, ShoppingCartItem> shoppingCartItems 
		= new Hashtable<Long, ShoppingCartItem>();
	
	private int totalQuantity = 0;
	
	public ShoppingCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShoppingCart(Hashtable<Long, ShoppingCartItem> shoppingCartItems,
			int totalQuantity) {
		super();
		this.shoppingCartItems = shoppingCartItems;
		this.totalQuantity = totalQuantity;
	}
	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Hashtable<Long, ShoppingCartItem> getShoppingCartItems() {
		return shoppingCartItems;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}

	private void updateTotal() {
		
		totalQuantity = 0;
		for(ShoppingCartItem cartItem : shoppingCartItems.values()){
			
			totalQuantity += cartItem.getQuantity();
		}
	}
	
	public void addToCart(ShoppingCartItem cartItem) {
		
		shoppingCartItems.put(cartItem.getItem().getItemId(), cartItem);
		updateTotal();
	}
	
	public void removeFromCart(ShoppingCartItem cartItem) {
		
		shoppingCartItems.remove(cartItem.getItem().getItemId());
		updateTotal();
	}
	
	//when someone finished update Quantity in DB, we need to update total
	public void updateQuantity() {
		
		updateTotal();
	}
	
	public void emptyCart() {
		
		shoppingCartItems.clear();	
	}
	
}
