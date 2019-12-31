package com.litao1.senior1.week1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.litao1.senior1.week1.dao.GoodsMapper;
import com.litao1.senior1.week1.domain.Brand;
import com.litao1.senior1.week1.domain.Goods;
import com.litao1.senior1.week1.domain.Kind;
import com.litao1.senior1.week1.service.GoodsService;
@Service
public class GoodsServiceImpl implements GoodsService{
	
	@Resource
	private GoodsMapper goodsMapper;
	
	@Override
	public List<Goods> list(Goods goods) {
		// TODO Auto-generated method stub
		return goodsMapper.list(goods);
	}

	@Override
	public int add(Goods goods) {
		
		return goodsMapper.add(goods);
	}

	@Override
	public List<Brand> selectBrand() {
		// TODO Auto-generated method stub
		return goodsMapper.selectBrand();
	}

	@Override
	public List<Kind> selectKind() {
		// TODO Auto-generated method stub
		return goodsMapper.selectKind();
	}

	@Override
	public Goods toUpdate(Integer gid) {
		// TODO Auto-generated method stub
		return goodsMapper.toUpdate(gid);
	}

	@Override
	public int update(Goods goods) {
		// TODO Auto-generated method stub
		return goodsMapper.update(goods);
	}

	@Override
	public int del(String gid) {
		// TODO Auto-generated method stub
		return goodsMapper.del(gid);
	}

}
