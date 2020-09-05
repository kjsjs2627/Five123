package study.spring.withfivebird.service;




import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.withfivebird.model.Product;

/** Lombok의 Log4j 객체 */
//import lombok.extern.slf4j.Slf4j;
@Slf4j
/** JUnit에 의한 테스트 클래스로 정의 */
//import org.junit.runner.RunWith;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
//import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
//import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
//import org.junit.FixMethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductServiceTest {
	/** Service 객체 주입 설정 */
    // import org.springframework.beans.factory.annotation.Autowired;
    @Autowired
    private ProductService productService;
    /** 단일행 조회 테스트 */
//    @Test
//    public void testA() {
//        // 검색조건으로 사용될 POJO 클래스 객체
//        Product input = new Product();
//        input.setProduct_no(22);
//
//        Product output = null;
//
//        try {
//            output = productService.getProductItem(input);
//            log.debug(output.toString());
//        } catch (Exception e) {
//            log.error(e.getLocalizedMessage());
//            e.printStackTrace();
//        }
//    }
//
//    /** 다중행 조회 테스트 */
//    @Test
//    public void testB() {
//        // 검색조건으로 사용될 POJO 클래스 객체
//        Product input = new Product();
//        input.setProduct_name("eee");
//
//        List<Product> output = null;
//
//        try {
//            output = productService.getProductList(input);
//
//            for (Product item : output) {
//                log.debug(item.toString());
//            }
//        } catch (Exception e) {
//            log.error(e.getLocalizedMessage());
//            e.printStackTrace();
//        }
//    }
//
//    /** 전체 데이터 수 조회 */
//    @Test
//    public void testC() {
//        int count = 0;
//
//        try {
//            count = productService.getProductCount(null);
//            log.debug("전체 데이터 수: " + count);
//        } catch (Exception e) {
//            log.error(e.getLocalizedMessage());
//            e.printStackTrace();
//        }
//    }
//
//    /** 조건에 따른 데이터 수 조회 */
//    @Test
//    public void testD() {
//        int count = 0;
//
//        Product input = new Product();
//        input.setProduct_name("eee");
//
//        try {
//            count = productService.getProductCount(input);
//            log.debug("eee을 포함하는 제품 이름을 갖는 데이터 수: " + count);
//        } catch (Exception e) {
//            log.error(e.getLocalizedMessage());
//            e.printStackTrace();
//        }
//    }
//
//    /** 데이터 저장 테스트 */
//    @Test
//    public void testE() {
//        Product input = new Product();
//        
//        input.setProduct_name("하늘하늘원피스");
//        input.setProduct_content("이 옷은 정말 잘팔리는 옷으로");
//        input.setProduct_price(43000);
//        input.setProduct_best("Y");
//        input.setProduct_new("Y");
//        input.setProduct_img("assets/img/bottom/bottom3.png");
//        input.setProduct_sale(10);
//        input.setCategory_no(1);
//        input.setProduct_size_no1(1);
//        input.setProduct_size_no2(2);
//        input.setProduct_size_no3(3);
//        input.setProduct_color_no1(1);
//        input.setProduct_color_no2(2);
//        input.setProduct_color_no3(3);
//        input.setProduct_detail_img1("assets/img/bottom/bottom3.png");
//        input.setProduct_detail_img2("assets/img/bottom/bottom3.png");
//        input.setProduct_detail_img3("assets/img/bottom/bottom3.png");
//        input.setProduct_detail_img4("assets/img/bottom/bottom3.png");
//        input.setProduct_detail_content("정말 시원합니다");
//        
//        int output = 0;
//
//        try {
//            output = productService.addProduct(input);
//            log.debug("저장된 데이터 수: " + output);
//            // [중요] 생성된 PK값은 MyBatis에 의해 입력 파라미터의 해당 멤버변수에 셋팅된다.
//            log.debug("생성된 PK값 : " + input.getProduct_no());
//        } catch (Exception e) {
//            log.error(e.getLocalizedMessage());
//            e.printStackTrace();
//        }
//    }
//
//    /** 데이터 수정 테스트 */
//    @Test
//    public void testF() {
//    	Product input = new Product();
//    	input.setProduct_no(69);
//        input.setProduct_name("하늘하늘원피스");
//        input.setProduct_content("이 옷은 정말 잘팔리는 옷으로");
//        input.setProduct_price(43000);
//        input.setProduct_best("Y");
//        input.setProduct_new("Y");
//        input.setProduct_img("assets/img/bottom/bottom3.png");
//        input.setProduct_sale(10);
//        input.setCategory_no(1);
//        input.setProduct_size_no1(1);
//        input.setProduct_size_no1(2);
//        input.setProduct_size_no1(3);
//        input.setProduct_color_no1(1);
//        input.setProduct_color_no1(2);
//        input.setProduct_color_no1(3);
//        input.setProduct_detail_img1("assets/img/bottom/bottom3.png");
//        input.setProduct_detail_img2("assets/img/bottom/bottom3.png");
//        input.setProduct_detail_img3("assets/img/bottom/bottom3.png");
//        input.setProduct_detail_img4("assets/img/bottom/bottom3.png");
//        input.setProduct_detail_content("정말 시원합니다");
//
//        int output = 0;
//
//        try {
//            output = productService.editProduct(input);
//            log.debug("수정된 데이터 수: " + output);
//        } catch (Exception e) {
//            log.error(e.getLocalizedMessage());
//            e.printStackTrace();
//        }
//    }
//
//    /** 데이터 삭제 테스트 */
//    @Test
//    public void testG() {
//        Product input = new Product();
//        input.setProduct_no(59);
//
//        int output = 0;
//
//        try {
//            output = productService.deleteProduct(input);
//            log.debug("삭제된 데이터 수: " + output);
//        } catch (Exception e) {
//            log.error(e.getLocalizedMessage());
//            e.printStackTrace();
//        }
//    }
}
