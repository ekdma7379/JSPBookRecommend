package com.sist.dao;
import java.io.*;
import java.net.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Set;

import org.json.simple.*;
import org.json.simple.parser.*;
import com.mongodb.*;
public class bookCrawling {
	
	private Connection conn;
	// SQL문장 전송하는 클래스
	private PreparedStatement ps;
	//////////////////// XML로 코딩/////////////////////////////////////////
	private final String URL = "jdbc:oracle:thin:@localhost:1521:ORCL";
	private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String USER = "scott";
	private final String PWD = "tigertiger";
	//////////////////// XML로 코딩/////////////////////////////////////////
	
	// 드라이버 등록 Class.forName()
	public bookCrawling() {
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
	

	 public static void main(String[] args) {
		 	bookCrawling bc = new bookCrawling();
		 	
	        String clientId = "_p77U31O0TeqxtjxbXDt";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "zPLYOcavuz";//애플리케이션 클라이언트 시크릿값";
	        JSONObject obj;
	        String MongoDB_IP = "127.0.0.1";
	        int MongoDB_PORT=27017;
	        String DB_NAME="minki";
	        
	        
	        
	        try {
	        	// naverAPI에서 책 검색목록 JSON 가져오기 
	            String text = URLEncoder.encode("하나은행", "UTF-8");
	           
	            String apiURL = "https://openapi.naver.com/v1/search/book.json?query="+text+"&display=100"; // json 결과
	            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            String result = response.toString();
	           
	            bc.getConnection();
	            
	            // JSON 파일 추출
	            JSONParser parser = new JSONParser();
	            try{
	            	obj = (JSONObject)parser.parse(result);
	            	long total = (long)obj.get("total");
	            	int i;
	            	JSONArray Item_list = (JSONArray)obj.get("items");
	            	for(i=0;i<Item_list.size();i++)
	            	{
	            		JSONObject temp = (JSONObject)Item_list.get(i);
	            		//JSONObject title_obj = (JSONObject)temp.get("title");
	            		String title = temp.get("title").toString();
	            		/*String sql = "Insert INTO bookinfo VALUES('bi_no_seq',?,?,?,?,?,?,0)";*/
	            		
	            		System.out.println(i+"번째 제목:"+title);
	            	
	            	}
	            	
	            }catch (Exception e) {
					// TODO: handle exception
	            	System.out.println("result:"+e.getMessage());
				}
	            //Connect to MongoDB
	           /* MongoClient mongoClient = new MongoClient(new ServerAddress(MongoDB_IP,MongoDB_PORT));
	          //View Database List
	            @SuppressWarnings("deprecation")
				List<String> databases = mongoClient.getDatabaseNames();
	            DB db = mongoClient.getDB(DB_NAME);
	            DBCollection collection = db.getCollection("books");
	            
	            BasicDBObject documentDetail = new BasicDBObject();
	            documentDetail.put("description", "test1");
	            documentDetail.put("image","http:");
	            documentDetail.put("pubdate", "123");
	            documentDetail.put("publisher","아동복");
	            documentDetail.put("author","아동복");
	            documentDetail.put("title","아동복");
	            collection.insert(documentDetail);*/
	            
	           
	            
	            System.out.println(result);
	            
	            /*System.out.println("=====Database List===== ");
	            int num =1 ;
	            for (String dbName : databases) {
	                System.out.println( num  + ". " + dbName);
	                num++;
	            }
	          
	            System.out.println();
	            Set<String> collections = db.getCollectionNames();

	            System.out.println("Database : " + DB_NAME);
	            for (String colName : collections) {
	                System.out.println(" + Collection: " + colName);
	            }*/
	            
	            
	            
	        } catch (Exception e) {
	            System.out.println(e);
	        }finally {
				bc.disConnection();
			}
	    }
}
