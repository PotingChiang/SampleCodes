package ca.nait.dmit.domain;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="finalprojectcategory")
public class Category implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Short categoryId;
	
	@Column(nullable=false, length=30)
	@NotBlank(message="Category name is required")
	@Length(min=3, message="Category name must have be 3 ~ 30 characters")
	private String categoryName;
	
	private String description;
	
	@Column(nullable=false)
	@NotEmpty(message="Category image file is required")
	private byte[] categoryImageFile;

	public Category() {
		super();
	}

	public Short getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Short categoryId) {
		this.categoryId = categoryId;
	}
	
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getCategoryImageFile() {
		return categoryImageFile;
	}

	public void setCategoryImageFile(byte[] categoryImageFile) {
		this.categoryImageFile = categoryImageFile;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}