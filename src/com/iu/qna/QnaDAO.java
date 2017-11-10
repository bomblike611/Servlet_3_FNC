package com.iu.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.db.DBconnector;


public class QnaDAO {
//insert=======================================================
	public int insert(QnaDTO qnaDTO) throws Exception{
		Connection con=DBconnector.getConnect();
		String sql="insert into qna values (QNA_SEQ.NEXTVAL,?,?,?,0,sysdate,QNA_SEQ.CURRVAL,0,0)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setString(3, qnaDTO.getWriter());
		
		int result=st.executeUpdate();
		DBconnector.disConnect(st, con);
		
		return result;
		
	}
	
	
	//update=======================================================
	public int update(QnaDTO qnaDTO) throws Exception{
		Connection con=DBconnector.getConnect();
		String sql="update qna set title=?,contents=? where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setInt(3, qnaDTO.getNum());
		int result=st.executeUpdate();
		DBconnector.disConnect(st, con);
		
		return result;
	}
	//delete=====================================================
	public int delete(int num) throws Exception{
		Connection con=DBconnector.getConnect();
		String sql="delete qna where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		DBconnector.disConnect(st, con);
		
		return result;
		
	}
	//selectOne====================================================
	public QnaDTO selectOne(int num) throws Exception{
		Connection con=DBconnector.getConnect();
		String sql="select * from qna where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		
		QnaDTO qnaDTO2=null;
		if(rs.next()) {
			qnaDTO2=new QnaDTO();
			qnaDTO2.setNum(rs.getInt("num"));
			qnaDTO2.setTitle(rs.getString("title"));
			qnaDTO2.setContents(rs.getString("contents"));
			qnaDTO2.setWriter(rs.getString("writer"));
			qnaDTO2.setHit(rs.getInt("hit"));
			qnaDTO2.setReg_date(rs.getDate("reg_date"));
			qnaDTO2.setRef(rs.getInt("ref"));
			qnaDTO2.setStep(rs.getInt("step"));
			qnaDTO2.setDepth(rs.getInt("depth"));
		}
		DBconnector.disConnect(rs, st, con);
		return qnaDTO2;
	}
	//selectList=====================================================
	public ArrayList<QnaDTO> selectList(String kind,String search,int startRow,int lastRow) throws Exception{
		Connection con=DBconnector.getConnect();
		String sql="select * from (select rownum R,N.* from (select * from qna where "+kind+" like ? order by num desc) N) where R between ? and ? order by ref desc, step asc";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		ResultSet rs=st.executeQuery();
		ArrayList<QnaDTO> ar=new ArrayList<>();
		while(rs.next()) {
			QnaDTO qnaDTO=new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setHit(rs.getInt("hit"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setRef(rs.getInt("ref"));
			qnaDTO.setStep(rs.getInt("step"));
			qnaDTO.setDepth(rs.getInt("depth"));
			ar.add(qnaDTO);
		}
		DBconnector.disConnect(rs, st, con);
		return ar;
		
	}
	//getTotalCount=====================================================
	public int getTotalCount(String kind,String search) throws Exception{
		Connection con=DBconnector.getConnect();
		String sql="select nvl(count(num),0) from qna where "+kind+" like ?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs=st.executeQuery();
		rs.next();
		int result=rs.getInt(1);
		DBconnector.disConnect(rs, st, con);
		return result;
	}
	//hitUpgrade======================================================
	public int hitUpdate(QnaDTO qnaDTO) throws Exception{
		Connection con=DBconnector.getConnect();
		String sql="update qna set hit=hit+1 where num=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, qnaDTO.getNum());
		int result=st.executeUpdate();
		DBconnector.disConnect(st, con);
		return result;
	}
	//replyInsert================================================================
	public int replyInsert(QnaDTO qnaDTO) throws Exception{
		Connection con=DBconnector.getConnect();
		String sql="update qna set step=step+1 where ref=(select ref from qna where num=?) and step>(select step from qna where num=?)";
		PreparedStatement st=con.prepareStatement(sql);
		st.setInt(1, qnaDTO.getNum());
		st.setInt(2, qnaDTO.getNum());
		int result=st.executeUpdate();
		
		Connection con2=DBconnector.getConnect();
		
		
		sql="insert into qna values (QNA_SEQ.NEXTVAL,?,?,?,0,sysdate,(select ref from qna where num=?),(select step from qna where num=?)+1,(select depth from qna where num=?)+1)";
		st=con2.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setString(3, qnaDTO.getWriter());
		st.setInt(4, qnaDTO.getNum());
		st.setInt(5, qnaDTO.getNum());
		st.setInt(6, qnaDTO.getNum());
		
		int result2=st.executeUpdate()+result;
		DBconnector.disConnect(st, con);
		
		return result2;
	}
}
