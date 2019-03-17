package com.article.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.article.dao.CommodityMapper;
import com.article.domain.Commodity;
import com.article.service.CommodityService;

@Service("commodityService")
@Transactional
public class CommodityServiceImpl implements CommodityService {

	@Resource
	private CommodityMapper CommodityMapper;
	
	public List<Commodity> findAll() {
		return CommodityMapper.findAl();
	}

	public void save(Commodity commodity) {
		if(commodity.getId()!=null){
			CommodityMapper.update(commodity);
		}else{
			CommodityMapper.save(commodity);
		}
	}

	public Commodity findById(Integer id) {
		return CommodityMapper.findById(id);
	}

	public Commodity findByName(String name) {
		return CommodityMapper.findByName(name);
	}

	public void delete(Integer[] id) {
		CommodityMapper.delete(id);
	}

}

