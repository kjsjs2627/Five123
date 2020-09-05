package study.spring.withfivebird.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.withfivebird.model.Product;
import study.spring.withfivebird.service.ProductService;

@Controller
public class ProductDetailsController {
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/main_productDetails.do", method = RequestMethod.GET)
	public String main_productDetails(Model model,	
			@RequestParam(value="index", defaultValue="0")int index) {
		
		
		Product input = new Product();
		input.setProduct_no(index);
		
		Product output = null;
		try {
			output = productService.getProductItem(input);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("index", index);
		model.addAttribute("output", output);
		return "main_productDetails";
	}
}
