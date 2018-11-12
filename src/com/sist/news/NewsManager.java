package com.sist.news;
/*
 *   XML ==> �Ľ� 
 *   1) DOM , SAX 
 *   2) JAXB (bind) : ������ 
 *      XML�� �±� ==> Ŭ���� ����
 *      news
 *       <rss>  Rss
 *         <channel> Channel
 *           <item>  Item
 *            <title>aaa</title>
 *            <author>aaa</author>
 *            <description>aa</description>
 *           </item>
 *           <item>
 *             <title></title>
 *             <author></author>
 *             <description></description>
 *           </item>
 *           <item>
 *             <title></title>
 *             <author></author>
 *             <description></description>
 *           </item>
 *         </channel>
 *       </rss>
 *       
 *       <a>  ====> A
 *        <b> ====> B
 *         <c>test</c> ����
 *        </b>
 *       </a>
 *       
 *       class A
 *       {
 *          B b=new B();
 *       }
 *       class B
 *       {
 *          String c;
 *       }
 *       
 *       newssearch.naver.com/search.naver?where=rss&query=�߱�
 */
import java.util.*;
import com.sist.manager.*;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import java.net.*;
public class NewsManager {
   public List<Item> getNaverNewsData()
   {
	   NaverDaumManager ndm = new NaverDaumManager();
	   ArrayList<String> naverlist = ndm.NaverFindDate();
	   List<Item> list=new ArrayList<Item>();
	   try
	   {
		   JAXBContext jc=JAXBContext.newInstance(Rss.class);
		   Unmarshaller un=jc.createUnmarshaller();
		   /*
		    *   Unmarshaller  : XML=>Java Class
		    *   Marshaller : Java Class=>XML
		    */
		   URL url=new URL("http://newssearch.naver.com/search.naver?"
				      +"where=rss&query="+URLEncoder.encode(naverlist.get(0), "UTF-8"));
		   Rss rss=(Rss)un.unmarshal(url);
		   
		   list=rss.getChannel().getItem();
		   
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   return list;
   }
}


















