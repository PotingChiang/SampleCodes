package ca.nait.dmit.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

//@Entity
//@Table(name="Order")
public class Order implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long orderId;
	
	@NotNull(message="Date is required")
	@Past(message="Date cannot be in the future")
	@Temporal(TemporalType.DATE)
	@Column(name="expenseDate")
	private Date orderDate;
	
	@Column(nullable=false, length=50)
	@NotNull(message="Total Price is required")
	private double totalPrice;
	
	@ManyToOne(optional=false, fetch=FetchType.EAGER)
	@Valid
	@NotNull(message="Customer is required")
	private UserRegister customer;
	
	List<ShoppingCartItem> cartItem;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(Long orderId, Date orderDate, double totalPrice,
			UserRegister customer, List<ShoppingCartItem> cartItem) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.totalPrice = totalPrice;
		this.customer = customer;
		this.cartItem = cartItem;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public UserRegister getCustomer() {
		return customer;
	}

	public void setCustomer(UserRegister customer) {
		this.customer = customer;
	}

	public List<ShoppingCartItem> getCartItem() {
		return cartItem;
	}

	public void setCartItem(List<ShoppingCartItem> cartItem) {
		this.cartItem = cartItem;
	}
	
	
}
