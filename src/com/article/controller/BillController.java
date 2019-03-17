package com.article.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.article.domain.Bill;
import com.article.service.BillService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/bill")
public class BillController
{
	@Resource
	private BillService billService;
	
	private Map<String,Object> result=new HashMap<String,Object>();
	
	/**
	 * 查询所有数据
	 */
	@RequestMapping("/list")
	@ResponseBody
	public List<Bill> list(){
		List<Bill> list = billService.findAll();
		return list;
	}
	
	/**
	 * 分页查询
	 */
	@RequestMapping("/listByPage")
	@ResponseBody
	public Map<String,Object> listByPage(Integer page,Integer rows){
		PageHelper.startPage(page, rows);
		List<Bill> list = billService.findAll();
		
		PageInfo<Bill> pageInfo = new PageInfo<Bill>(list);
		
		long total = pageInfo.getTotal();
		List<Bill> custList = pageInfo.getList();
		
		result.put("total", total);
		result.put("rows", custList);
		
		return result;
	}
	
	/**
	 * 保存数据
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,Object> save(Bill bill){
		try {
			billService.save(bill);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 根据id 查询对象
	 */
	@RequestMapping("/findById")
	@ResponseBody
	public Bill findById(Integer id){
		Bill cust = billService.findById(id);
		return cust;
	}
	
	/**
	 * 根据name 查询对象
	 */
	@RequestMapping("/findByName")
	@ResponseBody
	public Bill findByName(String name){
		Bill cust = billService.findByName(name);
		return cust;
	}
	
	/**
	 * 删除数据
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,Object> delete(Integer[] id){
		try {
			billService.delete(id);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 删除所有数据
	 */
	@RequestMapping("/deleteAll")
	@ResponseBody
	public Map<String,Object> deleteAll(){
		try {
			billService.deleteAll();
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
}
