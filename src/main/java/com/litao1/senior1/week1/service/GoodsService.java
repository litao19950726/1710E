package com.litao1.senior1.week1.service;

import java.util.List;

import com.litao1.senior1.week1.domain.Brand;
import com.litao1.senior1.week1.domain.Goods;
import com.litao1.senior1.week1.domain.Kind;

public interface GoodsService {

	List<Goods> list(Goods goods);

	int add(Goods goods);

	List<Brand> selectBrand();

	List<Kind> selectKind();

	Goods toUpdate(Integer gid);

	int update(Goods goods);

	int del(String gid);

}
