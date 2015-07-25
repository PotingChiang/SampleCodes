package ca.nait.dmit.service;

import java.io.Serializable;
import java.util.List;


//import javax.ejb.Stateful;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import ca.nait.dmit.domain.Category;

@Stateless
public class CategoryService implements Serializable {

	private static final long serialVersionUID = 1L;

	@PersistenceContext
	private EntityManager entityManager;
	
	public CategoryService() {
		super();
	}

	public void createCategory(Category category) {
		entityManager.persist(category);
	}
	
	public void updateCategory(Category category) {
		entityManager.merge(category);
	}

	public void deleteCategory(Category category) {
		entityManager.remove( entityManager.merge(category) );
	}

	@SuppressWarnings("unchecked")
	public List<Category> findAllCategories() {
		return entityManager.createQuery("SELECT c FROM Category c ORDER BY c.categoryName").getResultList();
	}
	
	public Category findByCategoryId(Short categoryId) {
		
		Query query = entityManager.createQuery("SELECT c FROM Category c WHERE c.categoryId = :categoryIdValue");
		
		query.setParameter("categoryIdValue", categoryId);
		
		return (Category) query.getSingleResult();
	}
}
