package com.www.repository;

import com.www.entity.NguoiDung;
import com.www.entity.User;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NguoiDungRepository extends CrudRepository<NguoiDung, String> {
    NguoiDung findByUser(User user);
    List<NguoiDung> findByHoTenDem(String hoTenDem);
    List<NguoiDung> findAll();
    NguoiDung findById(int id);
    
    @Query(value ="select * from [dbo].[nguoi_dung] n join [dbo].[user_role] t on n.[user_id] = t.[user_id] where [role_id] = 2",nativeQuery = true)
    List<NguoiDung> findByRoleMember();
    
}
