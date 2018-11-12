package com.sist.member.dao;

import java.util.*;
import java.sql.*;
import com.sist.dao.*;
import com.sist.manager.NaverDaumManager;

public class BookMemberDAO {
	private BookDAO dao;
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

	public ArrayList<LocationVO> LocationDataAll() {
		ArrayList<LocationVO> list = new ArrayList<LocationVO>();
		try {
			getConnection();

			String sql = "SELECT * FROM location";

			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				LocationVO vo = new LocationVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("LocationDataAll:" + e.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}

	public ArrayList<PossitiveVO> possitiveDataAll() {
		ArrayList<PossitiveVO> list = new ArrayList<PossitiveVO>();
		try {
			getConnection();

			String sql = "SELECT * FROM possitive";

			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				PossitiveVO vo = new PossitiveVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("possitiveDataAll:" + e.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}

	/*
	 * public static void main(String[] args){ BookMemberDAO dao = new
	 * BookMemberDAO(); ArrayList<LocationVO> list = dao.LocationDataAll();
	 * for(LocationVO vo : list) {
	 * System.out.println(vo.getNo()+":"+vo.getName()); } }
	 */
	public void insertBookMember(BookMemberVO vo) {
		try {

			getConnection();
			String sql = "INSERT INTO bookMember VALUES(" + "bm_no_seq.nextval,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
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
			System.out.println("insertBookMember:" + e.getMessage());
		} finally {
			disConnection();
		}
	}

	// 2. ID중복체크

	public int idcheck(String id) {
		int count = 0;
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM bookMember " + "WHERE id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("idcheck:" + e.getMessage());
		} finally {
			disConnection();
		}
		return count;
	}

	public String memberLogin(String email, String pwd) {
		String result = "";
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM bookMember " + "WHERE email=?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			// 실행
			ResultSet rs = ps.executeQuery();
			rs.next(); // 데이터 가지고옴
			int count = rs.getInt(1);
			rs.close();

			if (count == 0) {
				result = "NOID";
			} else// ID가 존재한다
			{
				sql = "SELECT password,name FROM bookMember " + "WHERE email=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, email);
				rs = ps.executeQuery();
				rs.next();
				String db_pwd = rs.getString(1);
				String db_name = rs.getString(2);
				rs.close();
				if (db_pwd.equals(pwd)) // login
				{
					result = db_name;
				} else // 비밀번호가 없는 경우
				{
					result = "NOPWD";
				}
			}
		} catch (Exception ex) {
			System.out.println("memberLogin:" + ex.getMessage());
		} finally {
			disConnection();
		}
		System.out.println(result);
		return result;
	}
	
	public BookMemberVO memberDetailData(String id)
	{
		BookMemberVO vo = new BookMemberVO();
		
		try {
			getConnection();
			
			String sql = "SELECT * FROM bookmember WHERE email = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			vo.setNo(rs.getInt(1));
			vo.setEmail(rs.getString(2));
			vo.setPwd(rs.getString(3));
			vo.setName(rs.getString(4));
			vo.setAge(rs.getInt(5));
			vo.setSex(rs.getString(6));
			vo.setPossitive(rs.getString(7));
			vo.setLive(rs.getString(8));
			
			rs.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("memberDetailData:"+e.getMessage());
		}finally {
			disConnection();
		}
		
		return vo;
	}
	
	public ArrayList<BookVO> BookRecommendData(String id, int topN)
	{
		ArrayList<BookVO> booklist = new ArrayList<BookVO>();
		NaverDaumManager ndm = new NaverDaumManager();
		try {
			getConnection();
			System.out.println("도착");
			String sql="SELECT * FROM bookMember WHERE email=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			// 내 정보 가져오기
			rs.next();
			System.out.println("값 저장 전");
			BookMemberVO memVO = new BookMemberVO();
			memVO.setNo(rs.getInt(1));
			memVO.setEmail(rs.getString(2));
			memVO.setPwd(rs.getString(3));
			memVO.setName(rs.getString(4));
			memVO.setAge(rs.getInt(5));
			memVO.setSex(rs.getString(6));
			memVO.setPossitive(rs.getString(7));
			memVO.setLive(rs.getString(8));
			rs.close();
			System.out.println("값가져옴");
			sql="SELECT age,sex,possitive,live,email FROM bookMember";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			
			/*while(rs.next())
			{
				BookMemberVO dbVO = new BookMemberVO();
				dbVO.setNo(rs.getInt(1));
				dbVO.setEmail(rs.getString(2));
				dbVO.setPwd(rs.getString(3));
				dbVO.setName(rs.getString(4));
				dbVO.setAge(rs.getInt(5));
				dbVO.setSex(rs.getString(6));
				dbVO.setPossitive(rs.getString(7));
				dbVO.setLive(rs.getString(8));
				dbMemberList.add(dbVO);
			}*/
			// 사용자와 모든 사람들의 유사도 비교
			ArrayList<ResultVO> dbMemberList = new ArrayList<ResultVO>();
			while(rs.next())
			{
				double simular = 0;
				ResultVO vo = new ResultVO();
				if(rs.getString(5).equals(id))
				{
					continue;
				}
				
				simular+=(memVO.getAge()==rs.getInt(1)?0.25:0);
				simular+=(memVO.getSex().equals(rs.getString(2))?0.25:0);
				simular+=(memVO.getPossitive().equals(rs.getString(3))?0.25:0);
				simular+=(memVO.getLive().equals(rs.getString(4))?0.25:0);
				
				vo.setMemEmail(rs.getString(5));
				vo.setResult(simular);
				dbMemberList.add(vo);
			}
			Collections.sort(dbMemberList);
			/////첫번째///////
			System.out.println("=============첫번째 출력==================");
			System.out.println(dbMemberList.get(0).getMemEmail()+":"+dbMemberList.get(0).getResult());
			System.out.println(dbMemberList.get(1).getMemEmail()+":"+dbMemberList.get(1).getResult());
			System.out.println("=============첫번째 출력==================");
			//System.out.println(dbMemberList.get(2).getMemno()+":"+dbMemberList.get(2).getResult());
			
			ArrayList<Integer> booknolist = new ArrayList<Integer>();
			ArrayList<String> naverlist = ndm.NaverFindDate();
			ArrayList<String> daumlist = ndm.NaverFindDate();
			for(int i=0;i<topN;i++)
			{
				String email = dbMemberList.get(i).getMemEmail();
				sql = "SELECT * FROM isread "
						+ "WHERE mem_no=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, email);
				rs = ps.executeQuery();
				dao = new BookDAO(); 
				while(rs.next())
				{
					/*sql = "SELECT * FROM bookinfo "
							+ "WHERE no=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, rs.getInt(2));*/
					int k=0;
					for(k=0;k<booklist.size();k++)
					{
						if(rs.getInt(2)==booklist.get(k).getNo())
						{
							break;
						}
					}
					
					if(k>=booklist.size())
					{
						BookVO tempVO = dao.BookDetailData(rs.getInt(2));
						ArrayList<String> tmplist = new ArrayList<String>();
						/*tmplist.add("수학");
						tmplist.add("가마니");
						tmplist.add("비즈니스");*/
						for(String temp:tmplist)
						{
							String[] temparray= temp.split(" ");							
							for(String key:naverlist)
							{
								System.out.println("키값:"+key);
								if(tempVO.getTitle().contains(key))
								{
									tempVO.setCommentpoint(tempVO.getCommentpoint()+0.05);
								}
								if(tempVO.getDescription().contains(key))
								{
									tempVO.setCommentpoint(tempVO.getCommentpoint()+0.05);
								}
							}
						}
						for(String temp:daumlist)
						{
							String[] temparray= temp.split(" ");
							for(String key:temparray)
							{
								System.out.println("키값:"+key);
								if(tempVO.getTitle().contains(key))
								{
									tempVO.setCommentpoint(tempVO.getCommentpoint()+0.05);
								}
								if(tempVO.getDescription().contains(key))
								{
									tempVO.setCommentpoint(tempVO.getCommentpoint()+0.05);
								}
							}
						}
						System.out.println(k+"번째 코맨트:"+tempVO.getCommentpoint());
						booklist.add(tempVO);
					}
				}
				
				Collections.sort(booklist);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception\
			System.out.println("BookRecommendData:"+e.getMessage());
		}finally {
			disConnection();
		}
		
		return booklist;
	}
	public static void main(String[] args) {
		BookMemberDAO dao = new BookMemberDAO();
		String id = "j1@naver.com";
		ArrayList<BookVO> list = dao.BookRecommendData(id,3);
		System.out.println("정렬 후");
		for(BookVO vo : list)
		{
			System.out.println(vo.getTitle()+" "+ vo.getNo()+ " "+ vo.getImage());
		}
		
	}
}
