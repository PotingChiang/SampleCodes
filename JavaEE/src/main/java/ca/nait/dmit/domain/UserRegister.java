package ca.nait.dmit.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="FinalRegisteredUser")
public class UserRegister implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@NotEmpty(message="First Name is Required.")
	@Size(min=2, message="First Name must include at least 2 charactors.")
	private String firstName;
	
	@NotEmpty(message="Last Name is Required.")
	@Size(min=2, message="Last Name must include at least 2 charactors.")
	private String lastName;

	@NotEmpty(message="E-Mail Address is Required.")
	@Column(name="userEmail" ,nullable=false, unique=true)
	@Email(message="E-Mail format is Invalid.")
	private String email;
	
	@NotEmpty(message="Password is Required.")
	@Pattern(regexp="^.*(?={6})(?=.*[a-z])(?=.*[A-Z]).*$", 
		message="Password must be at least 6 charactors with one Upper case and one lower case.")
	private String password;
	
	@Column(name="statusEnable", nullable=true, updatable=true)
	private Boolean enabled = false;

	public UserRegister() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	
}
