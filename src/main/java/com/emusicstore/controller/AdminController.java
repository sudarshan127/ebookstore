package com.emusicstore.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.emusicstore.dao.ProductDao;
import com.emusicstore.model.Product;

@Controller
public class AdminController {
	
	@Autowired
	private ProductDao productDao;
	
	private Path path;
	
	
	
	@RequestMapping(value ="/admin", method = RequestMethod.GET)
	public String adminPage() {
		return "admin";
		
	}
	
	@RequestMapping(value = "/admin/productInventory", method = RequestMethod.GET)
	public String productInventory(Model model) {
		List<Product> products = productDao.getAllProducts();
		model.addAttribute("products", products);
		
		return "productInventory";
		}
	
	@RequestMapping(value = "/admin/productInventory/addProduct", method = RequestMethod.GET)
	public String addProduct(Model model) {
		Product product = new Product();
		
		product.setCategory("Comedy");
		product.setCondition("New");
	
		model.addAttribute("product", product);
		return "addProduct";
		
	}
	
	@RequestMapping(value = "/admin/productInventory/addProduct", method = RequestMethod.POST)
	public String addProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model, HttpServletRequest request) {
		if(result.hasErrors()) {
			
			return "addProduct";
		}
		
		productDao.addProduct(product);
		
		MultipartFile image = product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + product.getId() + ".png");
		
		if(image != null && !image.isEmpty()){
			try {
				image.transferTo(new File(path.toString()));
				
			}	catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException ("Product image saving failed", e);
				
			}
			
		}
		return "redirect:/admin/productInventory";
	}

	@RequestMapping(value ="/admin/productInventory/deleteProduct/{id}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable int id, Model model) {
		
		productDao.deleteProduct(id);
		
		return "redirect:/admin/productInventory";
	}
	
	@RequestMapping(value ="/admin/productInventory/editProduct/{id}", method = RequestMethod.GET)
	public String editProduct(@PathVariable("id") int id, Model model) {
		
		Product product = productDao.getProductById(id);
		model.addAttribute(product);
		
		return "editProduct";
	}
	
	@RequestMapping(value ="/admin/productInventory/editProduct/{id}", method = RequestMethod.POST)
	public String editProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model, HttpServletRequest request) {
	
		
			if(result.hasErrors()) {
			
			return "editProduct";
		}
			
		//this comment part is for image edit but mine image part doesnot work so i am making it comment;
	/*	MultipartFile image = product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + product.getId() + ".png");
		
		if(image != null && !image.isEmpty()){
			try {
				image.transferTo(new File(path.toString()));
				
			}	catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException ("Product image saving failed", e);
				
			} */
		
		productDao.editProduct(product);
		
		return "redirect:/admin/productInventory";
	}
}
