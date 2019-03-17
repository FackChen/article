package com.article.dao;

import java.util.List;

import com.article.domain.Commodity;

public interface CommodityMapper
{
	/**
	 * 查询所有数据
	 */
	public List<Commodity> findAl();

	/**
	 * 保存数据
	 * @param Commodity
	 */
	public void save(Commodity commodity);

	/**
	 * 根据id 查询对象
	 * @param id
	 * @return
	 */
	public Commodity findById(Integer id);

	/**
	 * 根据name 查询对象
	 * @param name
	 * @return
	 */
	public Commodity findByName(String name);
	
	
	/**
	 * 修改对象数据
	 * @param Commodity
	 */
	public void update(Commodity commodity);

	/**
	 * 删除数据
	 * @param id
	 */
	public void delete(Integer[] id);
}
