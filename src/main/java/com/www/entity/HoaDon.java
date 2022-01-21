package com.www.entity;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "hoa_don")
public class HoaDon {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int hoaDonId;
	
	private Date ngayMua;
	
	@OneToMany(fetch = FetchType.EAGER,targetEntity = ChiTietHoaDon.class,cascade = CascadeType.ALL)
    private Set<ChiTietHoaDon> sanPhams;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "nguoiDungId")
    private NguoiDung nguoiDung;
	
	

	public HoaDon(int hoaDonId, Date ngayMua, Set<ChiTietHoaDon> sanPhams, NguoiDung nguoiDung) {
		super();
		this.hoaDonId = hoaDonId;
		this.ngayMua = ngayMua;
		this.sanPhams = sanPhams;
		this.nguoiDung = nguoiDung;
	}

	public int getHoaDonId() {
		return hoaDonId;
	}

	public void setHoaDonId(int hoaDonId) {
		this.hoaDonId = hoaDonId;
	}

	public Date getNgayMua() {
		return ngayMua;
	}

	public void setNgayMua(Date ngayMua) {
		this.ngayMua = ngayMua;
	}

	public Set<ChiTietHoaDon> getSanPhams() {
		return sanPhams;
	}

	public void setSanPhams(Set<ChiTietHoaDon> sanPhams) {
		this.sanPhams = sanPhams;
	}

	

	public NguoiDung getNguoiDung() {
		return nguoiDung;
	}

	public void setNguoiDung(NguoiDung nguoiDung) {
		this.nguoiDung = nguoiDung;
	}

	public HoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "HoaDon [hoaDonId=" + hoaDonId + ", ngayMua=" + ngayMua + ", sanPhams=" + sanPhams + ", nguoiDung="
				+ nguoiDung + "]";
	}

	
	
	

}
