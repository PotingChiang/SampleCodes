package ca.nait.dmit.controller;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.jasypt.util.password.StrongPasswordEncryptor;

import util.JSFUtil;
import ca.nait.dmit.domain.UserRegister;
import ca.nait.dmit.service.UserRegisterService;

@Named("loginBean")
@SessionScoped
public class LoginBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private String emailAddress;
	private String password;
	private UserRegister loginAccount;
	
	@Inject
	private UserRegisterService userRegisterService;
	
	public LoginBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getEmailAddress() {
		return emailAddress;
	}


	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public UserRegister getLoginAccount() {
		return loginAccount;
	}

	public void setLoginAccount(UserRegister loginAccount) {
		this.loginAccount = loginAccount;
	}
	
	public String login() {
		
		StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();

		String nextPage = null;
		try{
			
			loginAccount = userRegisterService.findUserByEmail(emailAddress);
			
			if ( loginAccount != null){
				
				if(passwordEncryptor.checkPassword(password, loginAccount.getPassword())){
					
					nextPage = "/pages/categoryForm?faces-redirect=true";			
				}
				else {
					
					JSFUtil.addErrorMessage("The password is not correct. Please try again!");
				}		
			}
			else {
				
				JSFUtil.addErrorMessage("The email is not correct. Please try again!");
			}
			
		} catch(Exception e) {
			JSFUtil.addErrorMessage(e.getMessage());		
		}
		return nextPage;
	}
}
