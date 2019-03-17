package com.article.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.article.dao.BillMapper;
import com.article.domain.Bill;
import com.article.service.BillService;

@Service("billService")
@Transactional
public class BillServiceImpl implements BillService
{

	@Resource
	private BillMapper BillMapper;
	
	public List<Bill> findAll() {
		return BillMapper.findAll();
	}

	public void save(Bill bill) {
		if(bill.getId()!=null){
			BillMapper.update(bill);
		}else{
			BillMapper.save(bill);
		}
	}

	public Bill findById(Integer id) {
		return BillMapper.findById(id);
	}

	public Bill findByName(String name) {
		return BillMapper.findByName(name);
	}

	public void delete(Integer[] id) {
		BillMapper.delete(id);
	}

	public void deleteAll() {
		BillMapper.deleteAll();
	}

}
