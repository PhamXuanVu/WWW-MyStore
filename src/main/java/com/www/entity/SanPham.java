package com.www.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Nationalized;

import com.www.Util.UtilClass;


@Entity
@Table(name = "san_pham")
public class SanPham {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int sanPhamId;
	
	private String tenSanPham;
    
	private LoaiHang loaiSanPham;
	
	private double donGia;
	private int soLuong;
	private String hinhAnh;
	
	private String moTa;
	
	@OneToMany(fetch = FetchType.EAGER,targetEntity = ChiTietHoaDon.class,cascade = CascadeType.ALL)
    private Set<ChiTietHoaDon> hoaDons;
	
	public int getId() {
		return sanPhamId;
	}
	public void setId(int id) {
		this.sanPhamId = id;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public LoaiHang getLoaiSanPham() {
		return loaiSanPham;
	}
	public void setLoaiSanPham(LoaiHang loaiSanPham) {
		this.loaiSanPham = loaiSanPham;
	}
	public Double getDonGia() {
		return donGia;
	}
	public void setDonGia(Double donGia) {
		this.donGia = donGia;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public SanPham(int id, String tenSanPham, LoaiHang loaiSanPham, Double donGia, int soLuong, String hinhAnh,
			String moTa) {
		super();
		this.sanPhamId = id;
		this.tenSanPham = tenSanPham;
		this.loaiSanPham = loaiSanPham;
		this.donGia = donGia;
		this.soLuong = soLuong;
		this.hinhAnh = hinhAnh;
		this.moTa = moTa;
	}
	public SanPham() {
	}
	@Override
	public String toString() {
		return "SanPham [id=" + sanPhamId + ", tenSanPham=" + tenSanPham + ", loaiSanPham=" + loaiSanPham + ", donGia="
				+ donGia + ", soLuong=" + soLuong + ", hinhAnh=" + hinhAnh + ", moTa=" + moTa + "]";
	}
	
	public String getGiaFormat() {
        UtilClass utilClass = new UtilClass();
        return utilClass.formatVND(this.getDonGia());
    }

}
