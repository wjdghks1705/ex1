package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.CartEmptyException;
import logic.Cart;
import logic.Item;
import logic.ItemService;
import logic.ItemSet;
import logic.ShopService;

@Controller
public class CartController {
	@Autowired
	private ShopService shopService;	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("cart/cartAdd")
	public ModelAndView add(Integer id, Integer quantity, HttpSession session){
		Item selectedItem = itemService.getItemList(id); 
		Cart cart = (Cart)session.getAttribute("CART");
		if(cart == null){
			cart = new Cart();
			session.setAttribute("CART", cart);
		}
		cart.push(new ItemSet(selectedItem, quantity));
		ModelAndView mav = new ModelAndView("cart/cart");
		mav.addObject("message", selectedItem.getName()+"��(��)"+quantity+"�� īƮ�� �߰�");
		mav.addObject("cart",cart);
		return mav;
	}
	
	@RequestMapping("cart/cartDelete")
	public ModelAndView delete(int index, HttpSession session){
		Cart cart = (Cart)session.getAttribute("CART");
		String name = cart.remove(index);
		ModelAndView mav = new ModelAndView("cart/cart");
		mav.addObject("message", name + "��(��) īƮ���� ���������ϴ�.");
		mav.addObject("cart",cart);
		
		return mav;
	}
	
	@RequestMapping("cart/cartView")
	public ModelAndView cartView(HttpSession session){
		Cart cart = (Cart)session.getAttribute("CART");
		if(cart == null || cart.isEmpty()){
			throw new CartEmptyException();
		}
		ModelAndView mav = new ModelAndView("cart/cart");
		mav.addObject("message","������ٱ����� ��ǰ����Դϴ�.");
		mav.addObject("cart",cart);
		return mav;
	}
	
}
