package com.article.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.article.domain.Commodity;
import com.article.service.CommodityService;

@Controller
@RequestMapping("/commodity")
public class CommodityController {
	@RequestMapping("/test")
	public String test(){
		return "test2";
	}
	
	@RequestMapping("/test2")
	public String test2(){
		return "test";
	}
	
	@Resource
	private CommodityService commodityService;
	
	/**
	 * 查询所有数据
	 */
	@RequestMapping("/list")
	@ResponseBody
	public List<Commodity> list(){
		List<Commodity> list = commodityService.findAll();
		return list;
	}
	
	private Map<String,Object> result = new HashMap<String,Object>();
	
	/**
	 * 分页查询
	 */
	@RequestMapping("/listByPage")
	@ResponseBody
	public Map<String,Object> listByPage(Integer page,Integer rows){
		PageHelper.startPage(page, rows);
		List<Commodity> list = commodityService.findAll();
		
		PageInfo<Commodity> pageInfo = new PageInfo<Commodity>(list);
		
		long total = pageInfo.getTotal();
		List<Commodity> custList = pageInfo.getList();
		
		result.put("total", total);
		result.put("rows", custList);
		
		return result;
	}
	
	/**
	 * 保存数据
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,Object> save(Commodity commodity){
		try {
			commodityService.save(commodity);
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
	public Commodity findById(Integer id){
		Commodity cust = commodityService.findById(id);
		return cust;
	}
	
	/**
	 * 根据name 查询对象
	 */
	@RequestMapping("/findByName")
	@ResponseBody
	public Commodity findByName(String name){
		Commodity cust = commodityService.findByName(name);
		return cust;
	}
	
	/**
	 * 删除数据
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,Object> delete(Integer[] id){
		try {
			commodityService.delete(id);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
}