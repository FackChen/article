package com.article.service;

import java.util.List;

import com.article.domain.Bill;

public interface BillService
{
	public List<Bill> findAll();

	public void save(Bill bill);

	public Bill findById(Integer id);

	public Bill findByName(String name);

	public void delete(Integer[] id);

	public void deleteAll();
}
