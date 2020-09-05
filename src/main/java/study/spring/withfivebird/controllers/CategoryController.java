package study.spring.withfivebird.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.withfivebird.helper.PageData;
import study.spring.withfivebird.model.ProductCategory;
import study.spring.withfivebird.service.ProductCategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	ProductCategoryService productCategoryService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/main_category.do", method = RequestMethod.GET)
	public String main_category(Model model,
			@RequestParam(value="ans", defaultValue="")String ans,
			// 검색어
			@RequestParam(value="keyword", required=false)String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
            @RequestParam(value="page", defaultValue="1") int nowPage) {
		
		int totalCount = 0;         // 전체 게시글 수
        int listCount  = 10;        // 한 페이지당 표시할 목록 수
        int pageCount  = 5;         // 한 그룹당 표시할 페이지 번호 수
		
		ProductCategory category = new ProductCategory();
		
		category.setProduct_name(keyword);
		category.setCategory_name(ans);
		category.setProduct_new("Y");
		category.setProduct_best("Y");
		category.setProduct_sale(0);
		List<ProductCategory> output = null;
		
		PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체 
		System.out.println("totoalCount = " + totalCount);
		
		try {
			if(ans.equals("Sale")) {
				try {
					// 전체 게시글 수 조회
					totalCount = productCategoryService.getProductCategoryCountSale(category);
					System.out.println("totoalCount = " + totalCount);
					pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
					// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장 
					ProductCategory.setOffset(pageData.getOffset());
					ProductCategory.setListCount(pageData.getListCount());
					output = productCategoryService.getProductCategorySale(category);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			else if(ans.equals("New")) {
				try {
					// 전체 게시글 수 조회
					totalCount = productCategoryService.getProductCategoryCountNew(category);
					System.out.println("totoalCount = " + totalCount);
					pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
					// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장 
					ProductCategory.setOffset(pageData.getOffset());
					ProductCategory.setListCount(pageData.getListCount());
					output = productCategoryService.getProductCategoryNew(category);
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
			else if(ans.equals("Best")) {
				try {
					// 전체 게시글 수 조회
					totalCount = productCategoryService.getProductCategoryCountBest(category);
					System.out.println("totoalCount = " + totalCount);
					pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
					// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장 
					ProductCategory.setOffset(pageData.getOffset());
					ProductCategory.setListCount(pageData.getListCount());
					output = productCategoryService.getProductCategoryBest(category);
				}catch(Exception e) {
					e.printStackTrace();
				}				
			}
			else if(keyword != null || keyword=="" && (ans == null || ans == "")) {
				try {
					// 전체 게시글 수 조회
					totalCount = productCategoryService.getProductCategoryCount(category);
					System.out.println("totoalCount = " + totalCount);
					pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
					// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장 
					ProductCategory.setOffset(pageData.getOffset());
					ProductCategory.setListCount(pageData.getListCount());
					output = productCategoryService.getProductCategoryList(category);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			else {
				try {
					// 전체 게시글 수 조회
					totalCount = productCategoryService.getProductCategoryCount(category);
					System.out.println("totoalCount = " + totalCount);
					pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
					// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장 
					ProductCategory.setOffset(pageData.getOffset());
					ProductCategory.setListCount(pageData.getListCount());
					output = productCategoryService.getProductCategoryJoinList(category);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("keyword",keyword);
		model.addAttribute("output", output);
		model.addAttribute("ans", ans);
		
		model.addAttribute("pageData", pageData);
		return "main_category";
	}
}
