package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ItemService {
	List<Item> getItemList();
	Item getItemList(Integer id);  //메서드 오버로딩
	void entryItem(Item item, HttpServletRequest request);
	void update(Item item, HttpServletRequest request);
	void delete(Integer id);
}
