package com.emusicstore.controller;

import java.io.File;
import java.io.IOException;
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

import com.emusicstore.model.Product;
import com.emusicstore.dao.ProductDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ProductDao productDao;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String getProducts(Model model) {
		List<Product> products = productDao.getAllProducts();
		model.addAttribute("products", products);
		
		return "productList";
		
	}
	
	@RequestMapping(value ="/productList/viewProduct/{id}", method = RequestMethod.GET)
	public String viewProduct(@PathVariable int id, Model model) throws IOException {
		
		Product product = productDao.getProductById(id);
		model.addAttribute(product);
		
		return "viewProduct";
	}
	
	
}
