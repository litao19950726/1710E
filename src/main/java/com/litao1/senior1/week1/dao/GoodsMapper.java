package com.litao1.senior1.week1.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.litao1.senior1.week1.domain.Brand;
import com.litao1.senior1.week1.domain.Goods;
import com.litao1.senior1.week1.domain.Kind;

public interface GoodsMapper {

	List<Goods> list(Goods goods);

	int add(Goods goods);
	
	@Select("select * from tb_brand")
	List<Brand> selectBrand();
	
	@Select("select * from tb_goodskind")
	List<Kind> selectKind();
	
	@Select("select * from tb_goods where gid=#{gid}")
	Goods toUpdate(Integer gid);
	
	@Update("update tb_goods set gname=#{gname},ename=#{ename},size=#{size},price=#{price},num=#{num},bq=#{bq},pic=#{pic},bid=#{bid},kid=#{kid} where gid=#{gid}")
	int update(Goods goods);
	
	
	@Delete("delete from tb_goods where gid in(${value})")
	int del(String gid);
	
}
