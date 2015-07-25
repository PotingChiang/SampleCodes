package ca.nait.dmit.domain;

import java.io.Serializable;

public class ShoppingCartItem implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Item item;
	private int quantity;
	
	
	public ShoppingCartItem() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	

}
