package com.choa.files;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.db.DBconnector;

import sun.security.pkcs11.Secmod.DbMode;

public class FileDAO {
	//insert===================================================================================================
	public int insert(FileDTO fileDTO) throws Exception{
		Connection con=DBconnector.getConnect();
		String sql="insert into files values(?,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, fileDTO.getNum());
		st.setString(2, fileDTO.getOname());
		st.setString(3, fileDTO.getFname());
		int result=st.executeUpdate();
		DBconnector.disConnect(st, con);
		return result;
	}
	//selectList================================================================================================
	public ArrayList<FileDTO> selectList(int num)throws Exception{
		Connection con=DBconnector.getConnect();
		String sql="select * from files where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		ArrayList<FileDTO> ar=new ArrayList<>();
		while(rs.next()) {
			FileDTO fileDTO=new FileDTO();
			fileDTO.setFname(rs.getString("fname"));
			fileDTO.setOname(rs.getString("oname"));
			ar.add(fileDTO);
		}
		DBconnector.disConnect(rs, st, con);
		return ar;
	}
	//Delete================================================================================================
	public int delete(int num) throws Exception{
		Connection con=DBconnector.getConnect();
		String sql="delete files where num=?";
		PreparedStatement st= con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		DBconnector.disConnect(st, con);
		return result;
	}
	
}
