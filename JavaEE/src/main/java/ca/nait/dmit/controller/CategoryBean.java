package ca.nait.dmit.controller;
import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.io.IOUtils;
import org.primefaces.event.RowEditEvent;

import util.JSFUtil;
import ca.nait.dmit.domain.Category;
import ca.nait.dmit.service.CategoryService;

import javax.faces.application.FacesMessage;
//import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

//import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;


@Named("categoryBean")
@SessionScoped
public class CategoryBean implements Serializable {
	
		private static final long serialVersionUID = 1L;
		
		private Category currentCategory = null;
		private List<Category> categories = null;
		private boolean editMode = false;
		
		private UploadedFile uploadedFile;
		
		@Inject
		private CategoryService categoryService;
		
		public CategoryBean() {
			super();
		}

		public Category getCurrentCategory() {
			return currentCategory;
		}

		public void setCurrentCategory(Category currentCategory) {
			this.currentCategory = currentCategory;
		}

		public List<Category> getCategories() {
			return categories;
		}

		public void setCategories(List<Category> categories) {
			this.categories = categories;
		}

		public boolean isEditMode() {
			return editMode;
		}

		public void setEditMode(boolean editMode) {
			this.editMode = editMode;
		}

		public CategoryService getCategoryService() {
			return categoryService;
		}

		public void setCategoryService(CategoryService categoryService) {
			this.categoryService = categoryService;
		}
		
		
		
		public UploadedFile getUploadedFile() {
			return uploadedFile;
		}

		public void setUploadedFile(UploadedFile uploadedFile) {
			this.uploadedFile = uploadedFile;
		}

		@PostConstruct
		public void init() {
			
			try {
				currentCategory = new Category();
				categories = categoryService.findAllCategories();
				
			} catch( Exception e ) {
				
				JSFUtil.addErrorMessage("Error retrieving categories");
			}
		}
		
		public void addCategory() {
			try {
				
				currentCategory.setCategoryImageFile(IOUtils.toByteArray(uploadedFile.getInputstream()));
								
				categoryService.createCategory(currentCategory);
				
				categoryService.findAllCategories();
				
				JSFUtil.addInfoMessage("Adding category was successful");
				
				currentCategory = new Category();
				
			} catch(Exception e) {
				
				JSFUtil.addErrorMessage("Add category was not successful with exception:" + e.getMessage());
			}
		}
		
		public String updateCategory() {
			String nextPage = null;
			try {
				categoryService.updateCategory(currentCategory);
				currentCategory = new Category();
				editMode = false;
				nextPage = "/pages/categoryList?faces-redirect=true&fbm=Update expense was successful";
				categories = categoryService.findAllCategories();
			} catch (Exception e) {
				JSFUtil.addErrorMessage(e.getMessage());
			}
			return nextPage;
		}
		
		public void deleteCategory(Category selectedCategory) {
			try {
				
				categoryService.deleteCategory(selectedCategory);
				categories = categoryService.findAllCategories();
				JSFUtil.addInfoMessage("Delete category was successful");	
				
			} catch( Exception e ) {
				
				JSFUtil.addErrorMessage("Delete category was not successful with exception: " + e.getMessage());
			}
		}
		
		public void onRowEdit(RowEditEvent event) {
			Category selectedCategory = (Category) event.getObject();
			try {
				categoryService.updateCategory(selectedCategory);
				categories = categoryService.findAllCategories();
				JSFUtil.addInfoMessage("Update category was successful");
			} catch( Exception e ) {
				JSFUtil.addErrorMessage("Update category was not successful with exception: " + e.getMessage());
			}
		}

		public void onRowCancel(RowEditEvent event) {
			JSFUtil.addInfoMessage("Edit cancelled");
		}
		
		public String cancel() {
			editMode = false;
			currentCategory = new Category();
			return "/pages/categoryForm?faces-redirect=true";
		}
}