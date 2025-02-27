package com.ezen.drmarten.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ezen.drmarten.model.Cart;
import com.ezen.drmarten.model.CartItemList;
import com.ezen.drmarten.model.Product;
import com.ezen.drmarten.repository.CartRepository;
import com.ezen.drmarten.service.ItemCartService;

@Controller
@RequestMapping("/cart/")
public class CartController {

	@Autowired
	CartRepository cartRepository;

	@GetMapping("getmycart") // 내가지금 무슨 물건을 카트에 담았는지 보는 페이지
	public String getMyCart(@SessionAttribute(name = "u_cart", required = false) ItemCartService svc, Model model) {

		if (svc == null) {
			model.addAttribute("Cart", null);
			return "/cart/CartPage";
		}
		model.addAttribute("allPrice", svc.getAllPrice());
		model.addAttribute("Cart", svc.getCart());
		return "/cart/CartPage";
	} 

	@PostMapping("cartAdd")
	@ResponseBody
	// 장바니에 담기를 위한 메소드 장바구니가 어떤형식으로 진행되는지 파악 후 작업 가능.
	public String cartAdd(Product pro,
			/* @RequestParam("number") int count, */
			/* @RequestParam("sized") int size, */
			@SessionAttribute(name = "u_email", required = false) String email,
			@SessionAttribute(name = "u_cart", required = false) ItemCartService svc) {

		if (email == null && svc == null) {
			String script = "<script>" + "alert('로그인을 먼저해주세요');" + "location.href='/user/login'" + "</script>";
			return script;
		}

		// item.setProductNumbers(count); item.setProductSize(size);

		try {
			CartItemList item = new CartItemList();
			item.setProductCood(pro.getProduct_code());
			item.setProductName(pro.getName());
			item.setPrice(pro.getPrice());
			item.setProductNumbers(pro.getPrice());
			svc.addCartItem(item);
			Cart cart = new Cart();
			cart.setUerEmail(email);

			cartRepository.save(cart);

			for (int i = 0; i < svc.getCart().size(); i++) {
				cart.getCart().add(svc.getCart().get(i));
			}

			boolean addChek = svc.addCartItem(item);
			return "{\" addChek\":" + addChek + "}";

		} catch (Exception e) {
			e.printStackTrace();
			String script = "<script>" + "alert('디비 오류 살려줘');" + "location.href='/user/login'" + "</script>";
			return script;
		}

		// 값을 저장후에 불리언값 오류나거나 저장 실패시 false

	}

	@GetMapping("cartremove/{product_code}")
	@ResponseBody
	// 장바구니에있는 아이템 1개만 삭제하는 메소드
	public String remove(@Param(value = "product_code") int product_code,
			@SessionAttribute(name = "u_cart", required = false) ItemCartService svc) {
		try {

			// 오류가 나지않으면 정상 삭제
			svc.getCart().remove(product_code);
			return "{\"remove\":" + true + "}";

		} catch (Exception e) {
			e.fillInStackTrace();
			return "{\"remove\":" + false + "}";
		}

	}

	@PostMapping
	@ResponseBody
	// 물건 구매확정시 사용할 메서드
	public String buyItem(@SessionAttribute(name = "u_cart") ItemCartService svc,
			@SessionAttribute(name = "u_email") String email) {

		try {

			// cart 객체에 회원정보들과 지금까지 가지고있는 바구니 들을 넣어준다
			Cart cart = new Cart();
			cart.setUerEmail(email);
			cart.setCart(svc.getCart());
			cartRepository.save(cart);

			return "{\"buyItem\":" + true + "}";

		} catch (Exception e) {

			String script = "<script>" + "alert('이상한 행동이 감지되었습니다');" + "location.href='/user/login'" + "</script>";
			return script;
		}

	}

}
