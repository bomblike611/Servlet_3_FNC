package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.db.DBconnector;

import sun.security.pkcs11.Secmod.DbMode;

public class MemberDAO {
	public boolean idCheck(String id) throws Exception{
		boolean check=true;
		
		Connection con=DBconnector.getConnect();
		String sql="select * from member where id=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, id);
		
		ResultSet rs=st.executeQuery();
		if(rs.next()) {
			check=false;
		}
		DBconnector.disConnect(rs, st, con);
		return check;
	}
	
	public int getTotalCount(String kind,String search) throws Exception{
		Connection con=DBconnector.getConnect();
		
		String sql="select nvl(count(id),0) from member where "+kind+" like ?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs=st.executeQuery();
		
		rs.next();
		int result=rs.getInt(1);
		DBconnector.disConnect(rs, st, con);
		return result;
	}
	
	public int insert(MemberDTO memberDTO) throws Exception{
		Connection con=DBconnector.getConnect();
		
		String sql="insert into member values (?,?,?,?,?,?,?)";
		PreparedStatement st=con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getPhone());
		st.setInt(6, memberDTO.getAge());
		st.setString(7, memberDTO.getJob());
		
		int result=st.executeUpdate();
		
		DBconnector.disConnect(st, con);
		
		return result;
	}
	
	//selectlist
	public ArrayList<MemberDTO> selectList(int startRow, int lastRow,String kind, String search) throws Exception{
		Connection con=DBconnector.getConnect();
		
		String sql="select * from (select rownum R,N.* from (select * from member where "+kind+" like ? order by id desc) N) where R between ? and ?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		
		ResultSet rs=st.executeQuery();
		ArrayList<MemberDTO> ar=new ArrayList<>();
		while(rs.next()) {
			MemberDTO memberDTO=new MemberDTO();
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPw(rs.getString("pw"));
			memberDTO.setName(rs.getString("name"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setPhone(rs.getString("phone"));
			memberDTO.setAge(rs.getInt("age"));
			memberDTO.setJob(rs.getString("job"));
			ar.add(memberDTO);
		}
		DBconnector.disConnect(rs, st, con);
		
		return ar;
		
	}
	
	public MemberDTO selectOne(MemberDTO memberDTO) throws Exception{
		Connection con=DBconnector.getConnect();
		
		MemberDTO mDTO=null;
		String sql="select * from member where id=? and pw=? and job=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getJob());
		ResultSet rs=st.executeQuery();
		
		
		if(rs.next()) {
			mDTO=new MemberDTO();
			mDTO.setId(rs.getString("id"));
			mDTO.setPw(rs.getString("pw"));
			mDTO.setName(rs.getString("name"));
			mDTO.setEmail(rs.getString("email"));
			mDTO.setPhone(rs.getString("phone"));
			mDTO.setAge(rs.getInt("age"));
			mDTO.setJob(rs.getString("job"));
		}
		DBconnector.disConnect(rs, st, con);
		
		return mDTO;
	}
	//=================================================================================
	
}
