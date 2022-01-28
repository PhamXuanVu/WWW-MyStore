package com.www.entity;

import java.util.HashSet;
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

import com.www.Util.UtilClass;

@Entity
@Table(name = "hoa_don")
public class HoaDon {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int hoaDonId;
	
	@OneToMany(mappedBy = "hoaDon", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<ChiTietHoaDon> sanPhams = new HashSet<ChiTietHoaDon>();
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "nguoiDungId")
    private NguoiDung nguoiDung;
	
	

	public HoaDon(int hoaDonId, Set<ChiTietHoaDon> sanPhams, NguoiDung nguoiDung) {
		super();
		this.hoaDonId = hoaDonId;
		this.sanPhams = sanPhams;
		this.nguoiDung = nguoiDung;
	}

	public int getHoaDonId() {
		return hoaDonId;
	}

	public void setHoaDonId(int hoaDonId) {
		this.hoaDonId = hoaDonId;
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
		return "HoaDon [hoaDonId=" + hoaDonId + ", ngayMua=" + ", sanPhams=" + sanPhams + ", nguoiDung="
				+ nguoiDung + "]";
	}

	public double tinhTongTienTrongGioHang() {
        double sum = 0;
        for (ChiTietHoaDon chiTietHoaDon : this.getSanPhams()) {
            sum += chiTietHoaDon.tinhTienChiTietHoaDon();
        }
        return sum;
    }

    public String getTongTienChiTietHoaDonFormat() {
        return new UtilClass().formatVND(this.tinhTongTienTrongGioHang());
    }
}
