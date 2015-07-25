package ca.nait.dmit.controller;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.jasypt.util.password.StrongPasswordEncryptor;

import util.Gmail;
import util.JSFUtil;
import ca.nait.dmit.domain.UserRegister;
import ca.nait.dmit.service.UserRegisterService;

@Named("registerBean")
@SessionScoped
public class UserRegisterBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Inject
	private UserRegisterService userRegisterService;
	private UserRegister currentRegisterUser = new UserRegister();
	StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();	
	
	private UserRegister loginAccount;
	private String email;
	private String password;
	
	public UserRegisterBean() {
		super();
	}

	public UserRegisterService getUserRegisterService() {
		return userRegisterService;
	}

	public void setUserRegisterService(UserRegisterService userRegisterService) {
		this.userRegisterService = userRegisterService;
	}

	public UserRegister getCurrentRegisterUser() {
		return currentRegisterUser;
	}

	public void setCurrentRegisterUser(UserRegister currentRegisterUser) {
		this.currentRegisterUser = currentRegisterUser;
	}
	
	public UserRegister getLoginAccount() {
		return loginAccount;
	}

	public void setLoginAccount(UserRegister loginAccount) {
		this.loginAccount = loginAccount;
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

	public String addRegisterUser() {

		String nextPage = "/pages/userRegister?faces-redirect=true";
		try {

			
		
			String mailUsername = "dmit2015test@gmail.com";
			String mailPassword = "test2015";
			
			@Deprecated
			String link = "<a href=\"http://localhost:8080/dmit2015-finalproject/validationServlet?email=" + currentRegisterUser.getEmail() +"\">link</a>";
			
			Gmail webmail = new Gmail(mailUsername, mailPassword);
			String from = "dmit2015test@gmail.com";
			String to = currentRegisterUser.getEmail();
			String subject = "Validate This Email Account";
			String body = "Please click this " + link + " to validate " + currentRegisterUser.getEmail();
			
			
			
			webmail.sendmail(from, to, subject, body);
			
			String encryptedPassword = passwordEncryptor.encryptPassword(currentRegisterUser.getPassword());
			currentRegisterUser.setPassword(encryptedPassword);;
			userRegisterService.createUser(currentRegisterUser);
			JSFUtil.addInfoMessage("Register Successfully.");
			currentRegisterUser = new UserRegister();
		
//			nextPage = "/pages/manageCategories?faces-redirect=true&fbm=Register Successfully."
//					+ "&fem_1=Valiation Email has sent to your Email address."
//					+ "&fem_2=Please Check your Email. Thanks.";
			
			nextPage = "/pages/mLogin?faces-redirect=true&fbm=Register Successfully."
					+ "&fem_1=Valiation Email has sent to your Email address."
					+ "&fem_2=Please Check your Email. Thanks.";
		} catch (RuntimeException e) {

			currentRegisterUser.setId(null);
			JSFUtil.addErrorMessage("Register Failed ! " + e.getMessage());
		} catch (Exception e) {
	
			currentRegisterUser.setId(null);
			JSFUtil.addErrorMessage("Register Failed ! " + e.getMessage());
		}

		return nextPage;
	}

	public void updateRegisterUser() {

		try {

			userRegisterService.updateUser(currentRegisterUser);
			JSFUtil.addInfoMessage("Update Successfullye");
		} catch (Exception e) {

			JSFUtil.addErrorMessage("Update Failed ! " + e.getMessage());
		}
	}
}