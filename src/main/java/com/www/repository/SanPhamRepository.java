package com.www.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.www.entity.SanPham;

@Repository
public interface SanPhamRepository extends CrudRepository<SanPham, Integer> {
	@Query(value = "select * from san_pham where [loaiSanPham] = 0",nativeQuery = true)
	List<SanPham> getSanPhamByLoaiKeo();

	@Query(value = "select * from san_pham where [loaiSanPham] = 1",nativeQuery = true)
	List<SanPham> getSanPhamByLoaiSocola();
	
	@Query(value = "select * from [dbo].[san_pham] where [tenSanPham]  like ?1",nativeQuery = true)
	List<SanPham> getSanPhamByTenSanPham(String tenSanPham);

}
