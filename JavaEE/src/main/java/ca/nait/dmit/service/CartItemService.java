package ca.nait.dmit.service;

import java.io.Serializable;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import ca.nait.dmit.domain.Item;
import ca.nait.dmit.domain.ShoppingCartItem;

@Stateless
public class CartItemService implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@PersistenceContext
	private EntityManager entityManager;

	public CartItemService() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void createCartItem(ShoppingCartItem Cartitem) {
		entityManager.persist(Cartitem);
	}

	public void updateCartItem(ShoppingCartItem Cartitem) {
		entityManager.merge(Cartitem);
	}
	
	public void deleteCartItem(ShoppingCartItem Cartitem) {
		entityManager.remove( entityManager.merge(Cartitem) );
	}
	
	@SuppressWarnings("unchecked")
	public List<ShoppingCartItem> findAllCartItems() {
		return entityManager.createQuery("SELECT i FROM ShoppingCartItem i order by itemName").getResultList();
	}
}
