package com.litao1.senior1.week1.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.litao1.senior1.week1.domain.Brand;
import com.litao1.senior1.week1.domain.Goods;
import com.litao1.senior1.week1.domain.Kind;
import com.litao1.senior1.week1.service.GoodsService;

@Controller
public class GoodsController {
	
	@Resource
	private GoodsService service;
	
	
	@RequestMapping("list.do")
	public String list(Model m,Goods goods,@RequestParam(defaultValue = "1")int pageNum,@RequestParam(defaultValue = "3")int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Goods> list = service.list(goods);
		PageInfo<Goods> pageInfo = new PageInfo<>(list);
		m.addAttribute("pg",pageInfo);
		m.addAttribute("goods",goods);
		m.addAttribute("list",list);
		
		return "list";
	}
	
	@RequestMapping("toAdd")
	public String toAdd() {
		return "add";
	}
	
	@RequestMapping("selectBrand")
	@ResponseBody
	public List<Brand> selectBrand() {
		
		return service.selectBrand();
	}
	
	@RequestMapping("selectKind")
	@ResponseBody
	public List<Kind> selectKind() {
		
		return service.selectKind();
	}
	
	
	@RequestMapping("add.do")
	@ResponseBody
	public boolean add(@ModelAttribute("f")MultipartFile file,Goods goods) throws IllegalStateException, IOException {
		if(null != file && !file.isEmpty()) {
			String path = "D://img";
			File file2 = new File(path+"/"+file.getOriginalFilename());
			file2.mkdirs();
			file.transferTo(file2);
			
			goods.setPic("/img/"+file.getOriginalFilename());
			
		}
		
		
		return service.add(goods)>0;
	}
	
	@RequestMapping("toUpdate.do")
	public String toUpdate(@RequestParam("gid")Integer gid,Model m) {
		
		Goods goods = service.toUpdate(gid);
		m.addAttribute("g",goods);
		return "update";
	}
	
	@RequestMapping("update.do")
	@ResponseBody
	public boolean update(@ModelAttribute("f")MultipartFile file,Goods goods) throws IllegalStateException, IOException {
		if(null != file && !file.isEmpty()) {
			String path = "D://img";
			File file2 = new File(path+"/"+file.getOriginalFilename());
			file2.mkdirs();
			file.transferTo(file2);
			
			goods.setPic("/img/"+file.getOriginalFilename());
			
		}
		
		
		return service.update(goods)>0;
	}
	
	@RequestMapping("del.do")
	@ResponseBody
	public boolean del(@RequestParam("ids")String gid) {
		
		
		
		
		return service.del(gid)>0;
	}
	
}
