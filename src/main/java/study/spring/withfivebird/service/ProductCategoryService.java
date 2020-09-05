package study.spring.withfivebird.service;

import java.util.List;

import study.spring.withfivebird.model.ProductCategory;

public interface ProductCategoryService {
	public List<ProductCategory> getProductCategoryJoinList(ProductCategory input) throws Exception;
	
	public List<ProductCategory> getProductCategoryList(ProductCategory input) throws Exception;
	
	public List<ProductCategory> getProductCategoryNew(ProductCategory input) throws Exception;

	public List<ProductCategory> getProductCategoryBest(ProductCategory input) throws Exception;

	public List<ProductCategory> getProductCategorySale(ProductCategory input) throws Exception;	

	public int getProductCategoryCount(ProductCategory input) throws Exception;
	
	public int getProductCategoryCountNew(ProductCategory input) throws Exception;
	
	public int getProductCategoryCountBest(ProductCategory input) throws Exception;

	public int getProductCategoryCountSale(ProductCategory input) throws Exception;

}
