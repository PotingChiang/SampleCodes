package ca.nait.dmit.service;

import java.io.Serializable;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import ca.nait.dmit.domain.Category;
import ca.nait.dmit.domain.Item;

@Stateless
public class ItemService implements Serializable {
	private static final long serialVersionUID = 1L;

	@PersistenceContext
	private EntityManager entityManager;

	public ItemService() {
		super();
	}
	
	public void createItem(Item item) {
		entityManager.persist(item);
	}
	
	public void updateItem(Item item) {
		entityManager.merge(item);
	}
	
	public void deleteItem(Item item) {
		entityManager.remove( entityManager.merge(item) );
	}
	
	@SuppressWarnings("unchecked")
	public List<Item> findAllItems() {
		return entityManager.createQuery("SELECT i FROM Item i order by itemName").getResultList();
	}
	
	public Item findByItemId(long itemId) {
		Query query = entityManager.createQuery("select i from Item i where i.itemId = :itemIDValue");
		query.setParameter("itemIDValue", itemId);
		return (Item) query.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Item> getItemByCategory(Category category){
		
		Query query = entityManager.createQuery("SELECT i FROM Item i Where i.itemCategory = :itemCategoryValue");
		query.setParameter("itemCategoryValue", category);
		
		return (List<Item>) query.getResultList();
	}
}