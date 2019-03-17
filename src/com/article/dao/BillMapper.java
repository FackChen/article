package com.article.dao;

import java.util.List;

import com.article.domain.Bill;

public interface BillMapper
{
	/**
	 * 查询所有数据
	 */
	public List<Bill> findAll();

	/**
	 * 保存数据
	 * @param Bill
	 */
	public void save(Bill bill);

	/**
	 * 根据id 查询对象
	 * @param id
	 * @return
	 */
	public Bill findById(Integer id);

	/**
	 * 根据name 查询对象
	 * @param name
	 * @return
	 */
	public Bill findByName(String name);
	
	/**
	 * 修改对象数据
	 * @param Bill
	 */
	public void update(Bill bill);

	/**
	 * 删除数据
	 * @param id
	 */
	public void delete(Integer[] id);

	/**
	 * 删除所有数据
	 * @param id
	 */
	public void deleteAll();
}
