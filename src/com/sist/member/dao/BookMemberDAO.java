package com.sist.member.dao;

import java.util.*;
import java.sql.*;

public class BookMemberDAO {
	private Connection conn;
	// SQL문장 전송하는 클래스
	private PreparedStatement ps;
	//////////////////// XML로 코딩/////////////////////////////////////////
	private final String URL = "jdbc:oracle:thin:@211.238.142.66:1521:ORCL";
	private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String USER = "scott";
	private final String PWD = "tigertiger";
	//////////////////// XML로 코딩/////////////////////////////////////////

	// 드라이버 등록 Class.forName()
	public BookMemberDAO() {
		try {
			Class.forName(DRIVER);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, USER, PWD);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public ArrayList<LocationVO> LocationDataAll()
	{
		ArrayList<LocationVO> list = new ArrayList<LocationVO>(); 
		try {
			getConnection();
			
			String sql = "SELECT * FROM location";
			
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				LocationVO vo = new LocationVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LocationDataAll:"+e.getMessage());
		}finally {
			disConnection();
		}
		return list;
	}
	
	public ArrayList<PossitiveVO> possitiveDataAll()
	{
		ArrayList<PossitiveVO> list = new ArrayList<PossitiveVO>(); 
		try {
			getConnection();
			
			String sql = "SELECT * FROM possitive";
			
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				PossitiveVO vo = new PossitiveVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("possitiveDataAll:"+e.getMessage());
		}finally {
			disConnection();
		}
		return list;
	}
	/*public static void main(String[] args){
		BookMemberDAO dao = new BookMemberDAO();
		ArrayList<LocationVO> list = dao.LocationDataAll(); 
		for(LocationVO vo : list)
		{
			System.out.println(vo.getNo()+":"+vo.getName());
		}
	}*/
	public void insertBookMember(BookMemberVO vo)
	{
		try {
			
			getConnection();
			String sql="INSERT INTO bookMember VALUES("
					+ "bm_no_seq.nextval,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getName());
			ps.setInt(4, vo.getAge());
			ps.setString(5, vo.getSex());
			ps.setString(6, vo.getPossitive());
			ps.setString(7, vo.getLive());
			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("insertBookMember:"+e.getMessage());
		}finally {
			disConnection();
		}
	}
	
	//2. ID중복체크
	
		public int idcheck(String id)
		{
			int count=0;
				try {
					getConnection();
					String sql = "SELECT COUNT(*) FROM bookMember "
							+"WHERE id=?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, id);
					ResultSet rs = ps.executeQuery();
					rs.next();
					count = rs.getInt(1);
					rs.close();
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("idcheck:"+e.getMessage());
				}finally {
					disConnection();
				}
			return count;
		}
		
		public String memberLogin(String email, String pwd)
		{
			String result="";
			try{
				getConnection();
				String sql = "SELECT COUNT(*) FROM bookMember "
						+ "WHERE email=?";
				
				 ps=conn.prepareStatement(sql);
		         ps.setString(1, email);
		         // 실행
		         ResultSet rs=ps.executeQuery();
		         rs.next(); // 데이터 가지고옴
		         int count=rs.getInt(1);
		         rs.close();

		         if(count==0)
		         {
		            result="NOID";
		         }
		         else//ID가 존재한다
		         {
		            sql="SELECT password,name FROM bookMember "
		                  +"WHERE email=?";
		            ps=conn.prepareStatement(sql);
		            ps.setString(1, email);
		            rs=ps.executeQuery();
		            rs.next();
		            String db_pwd=rs.getString(1);
		            String db_name=rs.getString(2);
		            rs.close();
		            if(db_pwd.equals(pwd)) //login
		            {
		               result=db_name;
		            }
		            else // 비밀번호가 없는 경우
		            {
		               result="NOPWD";
		            }
		         }
		      }catch(Exception ex)
		      {
		         System.out.println("memberLogin:"+ex.getMessage());
		      }
		      finally
		      {
		         disConnection();
		      }
			  System.out.println(result);
		      return result;
		   }	
}
