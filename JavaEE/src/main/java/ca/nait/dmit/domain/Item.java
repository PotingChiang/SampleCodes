package ca.nait.dmit.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="Item")
public class Item implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long itemId;
	
	@Column(nullable=false, length=50)
	@NotBlank(message="Item name is required")
	@Length(min=2, message="Item name must have at least 2 characters")
	private String itemName;
	
	@Column(nullable=true, length=50)
	private String description;
	
	@Column(nullable=false, length=50)
	@NotNull(message="Price is required")
	private double price;
	
	@Column(nullable=false)
	@NotEmpty(message="Item image file is required")
	private byte[] itemImageFile;
	
	@ManyToOne(optional=false, fetch=FetchType.EAGER)
	@Valid
	@NotNull(message="Category is required")
	private Category itemCategory;
	
	
	
	public Long getItemId() {
		return itemId;
	}



	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}



	public String getItemName() {
		return itemName;
	}



	public void setItemName(String itemName) {
		this.itemName = itemName;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public double getPrice() {
		return price;
	}



	public void setPrice(double price) {
		this.price = price;
	}



	public byte[] getItemImageFile() {
		return itemImageFile;
	}



	public void setItemImageFile(byte[] itemImageFile) {
		this.itemImageFile = itemImageFile;
	}



	public Category getItemCategory() {
		return itemCategory;
	}



	public void setItemCategory(Category itemCategory) {
		this.itemCategory = itemCategory;
	}



	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
