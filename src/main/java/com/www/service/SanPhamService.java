package com.www.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.www.entity.*;
import com.www.repository.SanPhamRepository;

@Service
public class SanPhamService {
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	public List<SanPham> getAllSP() {
		List<SanPham> list= new ArrayList<>();
		Iterable<SanPham> iterableSP= sanPhamRepository.findAll();
		Iterator<SanPham> iteratorSP = iterableSP.iterator();
		while (iteratorSP.hasNext()) {
			list.add(iteratorSP.next());
		}
		return list;
	}
}
