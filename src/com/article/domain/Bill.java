package com.article.domain;

public class Bill
{
	private Integer id;
	private String name;
	private Integer price;
	private Integer number;
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public Integer getPrice()
	{
		return price;
	}
	public void setPrice(Integer price)
	{
		this.price = price;
	}
	public Integer getNumber()
	{
		return number;
	}
	public void setNumber(Integer number)
	{
		this.number = number;
	}
	@Override
	public String toString()
	{
		return "Bill [id=" + id + ", name=" + name + ", price=" + price + ", number=" + number + "]";
	}
	
}

