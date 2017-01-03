package logic;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Item {
	private Integer id;
	@NotEmpty   //null + 빈문자열 모두 안됨
	private String name;
	@NotNull    //null 안됨
	@Min(100)   //100이상
	@Max(10000) //10000 이하
	private Integer price;
	@NotEmpty
	private String description;
	private String pictureUrl;
	//업로드 된 파일 내용 저장 
	private MultipartFile picture;
	//getter setter toString
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description
				+ ", pictureUrl=" + pictureUrl + ", picture=" + picture + "]";
	}
	
}
