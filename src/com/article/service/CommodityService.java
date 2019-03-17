package com.article.service;

import java.util.List;

import com.article.domain.Commodity;


public interface CommodityService {

	public List<Commodity> findAll();

	public void save(Commodity commodity);

	public Commodity findById(Integer id);

	public Commodity findByName(String name);

	public void delete(Integer[] id);
}
