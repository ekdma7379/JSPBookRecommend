package com.sist.dao;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import java.util.*;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.sist.manager.NaverDaumManager;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.*;
import java.text.SimpleDateFormat;

public class BookDAO {
	// 연결하는 클래스 (Socket>
	private Connection conn;
	// SQL문장 전송하는 클래스
	private PreparedStatement ps;
	//////////////////// XML로 코딩/////////////////////////////////////////
	private final String URL = "jdbc:oracle:thin:@211.238.142.66:1521:ORCL";
	private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String USER = "scott";
	private final String PWD = "tigertiger";
	//////////////////// XML로 코딩/////////////////////////////////////////
	
	NaverDaumManager ndm = new NaverDaumManager();

	// 드라이버 등록 Class.forName()
	public BookDAO() {
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

	public void insertBookAllData() {
		try {
			getConnection();

			String clientId = "_p77U31O0TeqxtjxbXDt";// 애플리케이션 클라이언트 아이디값";
			String clientSecret = "zPLYOcavuz";// 애플리케이션 클라이언트 시크릿값";
			JSONObject obj;

			// naverAPI에서 책 검색목록 JSON 가져오기
			String text = URLEncoder.encode("건강", "UTF-8");

			String apiURL = "https://openapi.naver.com/v1/search/book.json?query=" + text + "&display=100"; // json
																											// 결과
			// String apiURL =
			// "https://openapi.naver.com/v1/search/blog.xml?query="+ text; //
			// xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			String result = response.toString();
			result=result.replaceAll("<b>", "");
			result=result.replaceAll("</b>", "");
			//System.out.println(result);
			// JSON 파일 추출
			JSONParser parser = new JSONParser();
			try {
				obj = (JSONObject) parser.parse(result);
				long total = (long) obj.get("total");
				int i;
				JSONArray Item_list = (JSONArray) obj.get("items");
				for (i = 0; i < Item_list.size(); i++) {
					JSONObject temp = (JSONObject) Item_list.get(i);
					// JSONObject title_obj = (JSONObject)temp.get("title");
					String title = temp.get("title").toString();
					String image = temp.get("image").toString();
					String author = temp.get("author").toString();
					int price = Integer.parseInt(temp.get("price").toString());									
					String publisher = temp.get("publisher").toString();
					/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date pubdate = sdf.parse(temp.get("pubdate").toString());*/
					
					java.util.Date tempDate = new java.text.SimpleDateFormat("yyyyMMdd").parse(temp.get("pubdate").toString());
					java.sql.Date pubdate = new java.sql.Date(tempDate.getTime());
					
					String description = temp.get("description").toString();

					/*
					 * ------------ -- -------------- 
						NO              NUMBER         
						DESCRIPTION     VARCHAR2(2000) 
						PRICE           NUMBER         
						TITLE           VARCHAR2(200)  
						AUTHOR          VARCHAR2(40)   
						PUBLISHER       VARCHAR2(40)   
						PUBDATE         DATE           
						IMAGE           VARCHAR2(1000) 
						COMMENTPOINT    NUMBER 
					 */
					/*System.out.println("title:" + title);
					System.out.println("image:" + image);
					System.out.println("author:" + author);
					System.out.println("price:" + price);
					System.out.println("publisher:" + publisher);
					System.out.println("pubdate:" + pubdate);
					System.out.println("description:" + description);*/
					String sql = "SELECT COUNT(*) FROM bookinfo WHERE title=?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, title);
					ResultSet rs = ps.executeQuery();
					rs.next();
					if (rs.getInt(1) > 0) 
					{
						System.out.println("타이틀:"+title+" 지나감");
						continue;
					}
					else 
					{
						sql = "Insert INTO bookinfo VALUES(bi_no_seq.nextval,?,?,?,?,?,?,?,0)";

						ps = conn.prepareStatement(sql);
						ps.setString(1, description);
						ps.setInt(2, price);
						ps.setString(3, title);
						ps.setString(4, author);
						ps.setString(5, publisher);
						ps.setDate(6, pubdate);
						ps.setString(7, image);

						ps.executeUpdate();

						System.out.println(i + "번째 날짜:" + pubdate.toString());
					}
				}

			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("result:" + e.getMessage());
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("insertBookAllData:" + e.getMessage());
		} finally {
			disConnection();
		}
	}
	
	public ArrayList<BookVO> BookinfoAllData(int page)
	   {
	      ArrayList<BookVO> list=new ArrayList<BookVO>();
	      try
	      {
	         getConnection();
	         int rowSize=12;
	         int start=(page*rowSize)-(rowSize-1);
	         int end=page*rowSize;
	         /*
	          *  1 page ==> 1~12
	          *  2 page ==> 13~24
	          *  3 page ==> 25~36
	          */
	         String sql="SELECT title,image,author,description,no,num "
	                 +"FROM (SELECT title,image,author,description,no,rownum as num "
	                 +"FROM (SELECT title,image,author,description,no "
	                 +"FROM bookinfo)) "
	                 +"WHERE num BETWEEN "+start+" AND "+end;
	         // 페이징 기법 (인라인 뷰) ==> 오라클 (Top-N)
	         // FROM (table|SELECT~)
	         ps=conn.prepareStatement(sql);
	         ResultSet rs=ps.executeQuery();
	         while(rs.next())
	         {
	        	 BookVO vo=new BookVO();
	             vo.setTitle(rs.getString(1));
	             vo.setImage(rs.getString(2));
	             vo.setAuthor(rs.getString(3));
	             vo.setDescription(rs.getString(4));
	             vo.setNo(rs.getInt(5));
	             list.add(vo);
	         }
	         rs.close();
	      }catch(Exception ex)
	      {
	         // error출력 ===> null
	         System.out.println("BookinfoAllData:"+ex.getMessage());
	      }finally
	      {
	         disConnection(); // 해제
	      }
	      return list;
	   }
	
	public BookVO BookDetailData(int no)
	{
		BookVO vo = new BookVO();
		
		try{
			getConnection();
			
			String sql="SELECT * FROM bookInfo WHERE no=?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			vo.setNo(rs.getInt(1));
			vo.setDescription(rs.getString(2));
			vo.setPrice(rs.getInt(3));
			vo.setTitle(rs.getString(4));
			vo.setAuthor(rs.getString(5));
			vo.setPublisher(rs.getString(6));
			vo.setPubdate(rs.getDate(7));
			vo.setImage(rs.getString(8));
			vo.setCommentpoint(rs.getDouble(9));
			rs.close();
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("BookDetailData:"+e.getMessage());
		}finally {
			disConnection();
		}
		
		return vo;
	}
	public void CommentrGraph(int no)
	   {
		   try
		   {
			   getConnection();
			   
			   String sql = "SELECT COUNT(*) FROM bookcomment WHERE book_no=? AND possitive>0";
			   ps = conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   
			   ResultSet rs = ps.executeQuery();
			   rs.next();
			   int poscnt = rs.getInt(1);
			   rs.close();
			   
			   sql = "SELECT COUNT(*) FROM bookcomment WHERE book_no=? AND possitive<0";
			   ps = conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   
			   rs = ps.executeQuery();
			   rs.next();
			   int discnt = rs.getInt(1);

			try {

				////////////////////////////////////////////////////////////////

				BufferedWriter out = new BufferedWriter(new FileWriter("C://data//news.txt"));

				for(int i=0;i<poscnt;i++)
				{
					out.write("긍정. ");
				}
				
				for(int i=0;i<discnt;i++)
				{
					out.write("부정. ");
				}
							

				out.close();

				////////////////////////////////////////////////////////////////

			} catch (Exception e) {

				System.err.println(e); // 에러가 있다면 메시지 출력
			}


			   RConnection rc=new RConnection();
			   rc.setStringEncoding("utf8");
			   rc.voidEval("library(KoNLP)");
			   rc.voidEval("data1<-readLines(\"c:/data/news.txt\",encoding = 'utf-8')");
			   System.out.println("1");
			   rc.voidEval("png(\"C:/webDev/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BookRecommend/main/news.png\")");
			   System.out.println("2");
			   rc.voidEval("words <- sapply(data1, extractNoun,USE.NAMES = F)");
			   System.out.println("3");
			   rc.voidEval("data3<-unlist(words)");
			   System.out.println("4");
			   rc.voidEval("data4<-table(data3)");
			   System.out.println("5");
			   // col=c("","")
			   rc.voidEval("pie(data4,col = c(\"CYAN\",\"PINK\"),labels=c(\"긍정\",\"부정\"))");
			   System.out.println("6");
			   //rc.voidEval("wordcloud(names(data4), freq=data4, scale=c(5,1), rot.per=0.25, min.freq=1, random.order=F, random.color=T, colors=rainbow(15))");
			   rc.voidEval("dev.off()");
			   System.out.println("7");
			   rc.close();
		   }catch(Exception ex)
		   {
			   System.out.println("CommentrGraph:"+ex.getMessage());
		   }finally {
			disConnection();
		}
	   }
	/*
public ArrayList<BoardVO> boardFindData(String fs,String ss)
	  {
		  ArrayList<BoardVO> list=new ArrayList<BoardVO>();
		  try
		  {
			  getConnection();
			  String sql="SELECT no,subject,name,regdate,hit,content "
					    +"FROM qnaboard "
					    +"WHERE "+fs+" LIKE '%'||?||'%'";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, ss);
			  ResultSet rs=ps.executeQuery();
			  
			  while(rs.next())
			  {
				  BoardVO vo=new BoardVO();
				  vo.setNo(rs.getInt(1));
				  vo.setSubject(rs.getString(2));
				  vo.setName(rs.getString(3));
				  vo.setRegdate(rs.getDate(4));
				  vo.setHit(rs.getInt(5));
				  vo.setContent(rs.getString(6));
				  list.add(vo);
			  }
			  rs.close();
			  
		  }catch(Exception ex)
		  {
			  System.out.println(ex.getMessage());
		  }
		  finally
		  {
			  disConnection();
		  }
		  return list;
	  }
	 */
	
	
	public ArrayList<BookVO> BookSearchData(String type,String name)
	   {
	      ArrayList<BookVO> list=new ArrayList<BookVO>();
	      try
	      {
	    	  getConnection();
	         /*
	          *  1 page ==> 1~12
	          *  2 page ==> 13~24
	          *  3 page ==> 25~36
	          */
	         String sql="SELECT title,image,author,description,no "
	                 +"FROM bookinfo "
	                 +"WHERE "+type+" LIKE '%'||?||'%'";
	         		//"WHERE "+fs  +" LIKE '%'||?||'%'"
	         
	         // 페이징 기법 (인라인 뷰) ==> 오라클 (Top-N)
	         // FROM (table|SELECT~)
	         ps=conn.prepareStatement(sql);
	         ps.setString(1, name);
	         ResultSet rs=ps.executeQuery();
	         System.out.println("sql 실행 후");
	         while(rs.next())
	         {
	        	 BookVO vo=new BookVO();
	             vo.setTitle(rs.getString(1));
	             vo.setImage(rs.getString(2));
	             vo.setAuthor(rs.getString(3));
	             vo.setDescription(rs.getString(4));
	             vo.setNo(rs.getInt(5));
	             list.add(vo);
	         }
	         rs.close();
	      }catch(Exception ex)
	      {
	         // error출력 ===> null
	         System.out.println("BookSearchData:"+ex.getMessage());
	      }finally
	      {
	         disConnection(); // 해제
	      }
	      return list;
	   }
	
	public String BookCommentInsert(BookCommentVO vo)
	{ 
		String result="";
		try {
			getConnection();
			
			String sql="SELECT COUNT(*) FROM bookComment "
					+ "WHERE mem_no=? AND book_no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getMem_no());
			ps.setInt(2, vo.getBook_no());
			ResultSet rs = ps.executeQuery();
			rs.next();
			System.out.println("댓글유무 :"+rs.getInt(1));
			if(rs.getInt(1)>0)
			{
				System.out.println("X");
				result= "X";
				return result;
			}
			else
			{
				ArrayList<String> pos_word;
				String content = vo.getContent();
				content=content.replaceAll(" ", "|");
				content=content.replaceAll("\\?", "|");
				content=content.replaceAll("\\!", "|");
				content=content.replaceAll("\\.", "|");
				content=content.replaceAll(",", "|");
				System.out.println(content);
				String[] splitcontent = content.split("\\|");
				ArrayList<String> resultlist = new ArrayList<String>(); 
				ArrayList<String> poslist = new ArrayList<String>();
				poslist.add("행복");
				poslist.add("소망");
				poslist.add("즐거");
				poslist.add("기쁨");
				poslist.add("기쁜");
				poslist.add("좋");
				poslist.add("즐거");
				poslist.add("추억");
				ArrayList<String> dislist = new ArrayList<String>();
				dislist.add("불행");
				dislist.add("싫");
				dislist.add("꺼저");
				dislist.add("나쁘");
				dislist.add("나쁜");
				dislist.add("슬퍼");
				dislist.add("슬픈");
				for(int i=0;i<splitcontent.length;i++)
				{
					//System.out.println(splitcontent[i]);
					if(!splitcontent[i].equals(""))
					{
						System.out.println("나눠진 리스트에 추가됨"+splitcontent[i]);
						resultlist.add(splitcontent[i]);
					}
				}
				int poscount = 0;
				int discount = 0;
				System.out.println(vo.getContent());
				for (String key : poslist) 
				{
					
					if (vo.getContent().contains(key)) 
					{
						System.out.println(key+" :긍겅단어 카운트 됨");
						poscount+=1;
					}
				}
				for (String key : dislist)
				{
					//System.out.println("키값:" + key);
					if (vo.getContent().contains(key)) 
					{
						System.out.println(key+" :부정단어 카운트 됨");
						discount+=1;
					}
				}
				double posresult = (double)(discount)/splitcontent.length;
				System.out.println("점수 :"+(double)(poscount)/splitcontent.length+" "+(double)(discount)/splitcontent.length);
				/*System.out.println("긍정점수 : 0.318189"+" 부정점수 : 0.045455");*/
				double resultpoint = (poscount >= discount ? 0.1 : -0.1);
				System.out.println("결과 점수 :"+resultpoint);
				sql = "UPDATE bookinfo SET commentpoint= commentpoint+? WHERE no=?";
				ps = conn.prepareStatement(sql);
				ps.setDouble(1,resultpoint);
				ps.setInt(2, vo.getBook_no());
				ps.executeUpdate();
				
				sql="INSERT INTO bookComment(mem_no,book_no,content,name,possitive) "
						+ "VALUES(?,?,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getMem_no());
				ps.setInt(2, vo.getBook_no());
				ps.setString(3, vo.getContent());
				ps.setString(4, vo.getMem_name());
				ps.setDouble(5, resultpoint);
				ps.executeUpdate();
			}
			rs.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("BookCommentInsert:"+e.getMessage());
		}finally {
			disConnection();
		}
		return result;
	}

	
	
	
	public String BookLikeInsert(bookIsReadVO vo)
	{
		String result="";
		try {
			getConnection();
			
			String sql="SELECT COUNT(*) FROM isRead "
					+ "WHERE mem_no=? AND book_no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getMem_no());
			ps.setInt(2, vo.getBook_no());
			ResultSet rs = ps.executeQuery();
			rs.next();
			System.out.println("댓글유무 :"+rs.getInt(1));
			if(rs.getInt(1)>0)
			{
				result= "이미 좋아요를 눌렀습니다.";
			}
			else
			{
				sql="INSERT INTO isRead "
						+ "VALUES(?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getMem_no());
				ps.setInt(2, vo.getBook_no());
				ps.executeUpdate();
				result="좋아요 완료!";
			}
			System.out.println(result);
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("BookLikeInsert:"+e.getMessage());
		}finally {
			disConnection();
		}
		return result;
	}
	
	
	public ArrayList<BookCommentVO> BookCommentAllData(int no)
	{
		ArrayList<BookCommentVO> list = new ArrayList<BookCommentVO>();
		
		try {
			getConnection();
			
			String sql="SELECT * FROM BookComment "
					+ "WHERE book_no=? "
					+ "ORDER BY regdate DESC";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				BookCommentVO vo = new BookCommentVO();
				vo.setMem_no(rs.getString(1));
				vo.setMem_name(rs.getString(2));
				vo.setBook_no(rs.getInt(3));
				vo.setContent(rs.getString(4));
				vo.setPossitive(rs.getDouble(5));
				vo.setRegdate(rs.getDate(6));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("BookCommentAllData:"+e.getMessage());
		}finally 
		{
			disConnection();
		}
		return list;
	}
	public int BookCommentTotal(int no)
	{
		int total = 0;
		
		try {
			getConnection();
			
			String sql = "SELECT COUNT(*) FROM bookComment "
					+ "WHERE book_no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			total=rs.getInt(1);
			
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("BookCommentTotal:"+e.getMessage());
		}finally {
			disConnection();
		}
		
		return total;
	}
	
	public BookVO bookKeywordPointAdd(ArrayList<String> list,int no)
	{
		BookVO vo = new BookVO();
		
		try {
			getConnection();
			
			String sql="SELECT * FROM bookInfo WHERE no=?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			vo.setNo(rs.getInt(1));
			vo.setDescription(rs.getString(2));
			vo.setPrice(rs.getInt(3));
			vo.setTitle(rs.getString(4));
			vo.setAuthor(rs.getString(5));
			vo.setPublisher(rs.getString(6));
			vo.setPubdate(rs.getDate(7));
			vo.setImage(rs.getString(8));
			vo.setCommentpoint(rs.getDouble(9));
			rs.close();
			
			for(String keyword : list)
			{
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("bookKeywordPointAdd:"+e.getMessage());
		}finally {
			disConnection();
		}
		
		return vo;
	}
	/*public ArrayList<BookVO> BookinfoAllData()
	{
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		try {
			getConnection();
			String sql="SELECT title,image,author FROM bookinfo";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("BookinfoAllData:"+e.getMessage());
		}finally {
			disConnection();
		}
		
		return list;
	}*/
	
	// 댓글 삽입 연습
	/*public static void main(String[] args) {
		BookDAO dao = new BookDAO();
		BookCommentVO vo = new BookCommentVO();
		vo.setBook_no('3');
		vo.setContent("하하하하");
		vo.setMem_name("1");
		vo.setMem_no("10");
		dao.BookCommentInsert(vo);
	}*/
	// 책 크롤링 디비에 넣기
	public static void main(String[] args) {
		BookDAO dao = new BookDAO();
		dao.insertBookAllData();
	}

}
