package ca.nait.dmit.service;
import java.io.Serializable;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import ca.nait.dmit.domain.UserRegister;

@Stateless
public class UserRegisterService implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@PersistenceContext
	private EntityManager entityManager;

	public UserRegisterService() {
		super();
	}
	
	public void createUser(UserRegister registerUser) {
		entityManager.persist(registerUser);
	}
	
	public void updateUser(UserRegister registerUser) {
		entityManager.merge(registerUser);
	}

	public UserRegister findUserByEmail(String email) {
		Query query = entityManager.createQuery("SELECT r FROM UserRegister r WHERE r.email = :emailValue");
		query.setParameter("emailValue", email);
		UserRegister userRegister = null;
		try {
			userRegister = (UserRegister) query.getSingleResult();
		} catch(Exception e) {
			userRegister = null;
		}
		return userRegister;
	}
	
	public UserRegister findUserByLogin(String email, String password) {
		Query query = entityManager.createQuery("SELECT r FROM UserRegister r "
				+ "WHERE r.email = :emailValue AND r.password = :passwordValue");
		query.setParameter("emailValue", email);
		query.setParameter("passwordValue", password);
		UserRegister userRegister = null;
		userRegister = (UserRegister) query.getSingleResult();
		return userRegister;
	}
}
