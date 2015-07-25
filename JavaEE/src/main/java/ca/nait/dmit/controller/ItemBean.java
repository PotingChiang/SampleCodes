package ca.nait.dmit.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;
import javax.inject.Inject;
import javax.inject.Named;
import javax.validation.constraints.NotNull;

import org.primefaces.model.UploadedFile;
import org.apache.commons.io.IOUtils;

import util.JSFUtil;
import ca.nait.dmit.domain.Category;
import ca.nait.dmit.domain.Item;
import ca.nait.dmit.service.CategoryService;
import ca.nait.dmit.service.ItemService;

@Named("itemBean")
@SessionScoped
public class ItemBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger(ItemBean.class.getName());
	
	private Item currentItem = null;
	private List<Item> items = null;
	private List<Item> itemsByCategory = null;

	private boolean editMode = false;
	private UploadedFile uploadedFile;
	
	@Inject
	private ItemService itemService;
	
	public UploadedFile getUploadedFile() {
		return uploadedFile;
	}

	public void setUploadedFile(UploadedFile uploadedFile) {
		this.uploadedFile = uploadedFile;
	}
	
	@NotNull(message="Please select the Category for the item")
	private Short selectedCategoryId = null;
	
	public Item getCurrentItem() {
		return currentItem;
	}
	
	public List<Item> getItemsByCategory() {
		return itemsByCategory;
	}

	public void setItemsByCategory(List<Item> itemsByCategory) {
		this.itemsByCategory = itemsByCategory;
	}

	public void setCurrentItem(Item currentItem) {
		this.currentItem = currentItem;
	}

	public List<Item> getItems() {
		return items;
	}

	public boolean isEditMode() {
		return editMode;
	}

	public void setEditMode(boolean editMode) {
		this.editMode = editMode;
	}

	public Short getSelectedCategoryId() {
		return selectedCategoryId;
	}

	public void setSelectedCategoryId(Short selectedCategoryId) {
		this.selectedCategoryId = selectedCategoryId;
	}

	@Inject
	private CategoryService categoryService;
	
	@PostConstruct
	public void init() {
		currentItem = new Item();
		try {
			items = itemService.findAllItems();
		}
		catch( Exception e ) {
			JSFUtil.addErrorMessage("Retrieving of items was unsuccessful. Error: " + e.getMessage());
		}
	}
	
	public List<SelectItem> getCategoryOptions() {
		List<SelectItem> categoryOptions = new ArrayList<SelectItem>();
		try {
			List<Category> categories = categoryService.findAllCategories();
			categoryOptions.add( new SelectItem("", "[select a category]") );
			categoryOptions.add( new SelectItem("", "-------------------") );
			for(Category category : categories) {
				SelectItem item = new SelectItem();
				item.setValue(category.getCategoryId());
				item.setLabel(category.getCategoryName());
				categoryOptions.add(item);
			}
		} 
		catch (Exception e) {
			JSFUtil.addErrorMessage("Retrieving of categories was unsuccessful. Error: " + e.getMessage());
		}
		
		return categoryOptions;
	}
	
	public void categoryChanged(ValueChangeEvent event) {
		
		Category category = categoryService.findByCategoryId(selectedCategoryId);
		itemsByCategory = itemService.getItemByCategory(category);
	}
	
	public void addItem() {
		try {
			logger.info("file name: " + uploadedFile.getFileName() );
			logger.info("file size: " + uploadedFile.getSize() );
			
			// use uploadedFile.getContents() with commons FileUpload engine.
//			logger.info("contents: " + uploadedFile.getContents() );
//			currentEmployee.setPicture( uploadedFile.getContents() );
			
			// use uploadedFile.getInputstream() with servlet 3.0 FileUpload engine.
			logger.info("inputstream: " + uploadedFile.getInputstream());
			currentItem.setItemImageFile(IOUtils.toByteArray(uploadedFile.getInputstream()));
			
			Category selectedCategory = categoryService.findByCategoryId(selectedCategoryId);
			currentItem.setItemCategory(selectedCategory);
			itemService.createItem(currentItem);
			currentItem = new Item();
			JSFUtil.addInfoMessage("Adding of item was successful");
			items = itemService.findAllItems();
		}
		catch(Exception e) {
			JSFUtil.addErrorMessage("Adding of item was not successful with exception: " + e.getMessage());
		}
	}
	
	public String updateItem() {
		String nextPage = null;
		try {
			Category selectedCategory = categoryService.findByCategoryId(selectedCategoryId);
			currentItem.setItemCategory(selectedCategory);
			itemService.updateItem(currentItem);
			currentItem = new Item();
			editMode = false;
			nextPage = "/pages/itemsList?faces-redirect=true";
			items = itemService.findAllItems();
		}
		catch (Exception e) {
			JSFUtil.addErrorMessage("Updating of item was not successful with exception: " + e.getMessage());
		}
		return nextPage;
	}
	
	public void deleteItem(Item selectedItem) {
		try {
			itemService.deleteItem(selectedItem);
			items = itemService.findAllItems();
			JSFUtil.addInfoMessage("Delete of item was successful");			
		} 
		catch( Exception e ) {
			JSFUtil.addErrorMessage("Delete of item was not successful with exception: " + e.getMessage());
		}
	}
	
	public String cancel() {

		editMode = false;

		currentItem = new Item();
		
		selectedCategoryId = null;
		
		return "/pages/itemForm?faces-redirect=true";
	}
}