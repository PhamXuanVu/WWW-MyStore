package com.www.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "nguoi_dung")
public class NguoiDung implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1835758663980843147L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	private String hoTenDem;

	private String ten;

	private String soDienThoai;

	private boolean gioiTinh;

	private String diaChi;


	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", nullable = false)
	private User user;


	@OneToMany(mappedBy = "nguoiDung", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<HoaDon> hoaDons;


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getHoTenDem() {
		return hoTenDem;
	}


	public void setHoTenDem(String hoTenDem) {
		this.hoTenDem = hoTenDem;
	}


	public String getTen() {
		return ten;
	}


	public void setTen(String ten) {
		this.ten = ten;
	}


	public String getSoDienThoai() {
		return soDienThoai;
	}


	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}


	public boolean isGioiTinh() {
		return gioiTinh;
	}


	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}


	public String getDiaChi() {
		return diaChi;
	}


	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Set<HoaDon> getHoaDons() {
		return hoaDons;
	}


	public void setHoaDons(Set<HoaDon> hoaDons) {
		this.hoaDons = hoaDons;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public NguoiDung(int id, String hoTenDem, String ten, String soDienThoai, boolean gioiTinh, String diaChi,
			User user, Set<HoaDon> hoaDons) {
		super();
		this.id = id;
		this.hoTenDem = hoTenDem;
		this.ten = ten;
		this.soDienThoai = soDienThoai;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.user = user;
		this.hoaDons = hoaDons;
	}


	public NguoiDung() {
	}


	@Override
	public String toString() {
		return "NguoiDung [id=" + id + ", hoTenDem=" + hoTenDem + ", ten=" + ten + ", soDienThoai=" + soDienThoai
				+ ", gioiTinh=" + gioiTinh + ", diaChi=" + diaChi + ", user=" + user + ", hoaDons=" + hoaDons + "]";
	}

	
}
