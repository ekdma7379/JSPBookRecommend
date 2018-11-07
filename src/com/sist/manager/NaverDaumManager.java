package com.sist.manager;
import java.util.*;

import org.jsoup.*;
/*
<li class="">
<div class="roll_txt @1">
<div class="rank_cont">
<span class="num_pctop rank1"><span class="ir_wa">1위</span></span>
<span class="txt_issue"><a href="https://search.daum.net/search?w=tot&amp;q=%EC%9D%B4%EC%A0%95%EC%9D%80&amp;DA=ATG&amp;rtmaxcoll=1TH" class="link_issue #searchrank #issue #txt">이정은</a></span>
</div>
<div class="rank_cont" aria-hidden="true">
<span class="num_pctop rank1"><span class="ir_wa">1위}</span></span>
<span class="txt_issue"><a href="https://search.daum.net/search?w=tot&amp;q=%EC%9D%B4%EC%A0%95%EC%9D%80&amp;DA=ATG&amp;rtmaxcoll=1TH" class="link_issue" tabindex="-1">이정은</a></span>
</div>
</div>
</li> 
 */
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class NaverDaumManager {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		NaverDaumManager nd = new NaverDaumManager();
		/*nd.daumFindDate();*/
		nd.NaverFindDate();
	}
	public ArrayList<String> daumFindDate()
	{
		ArrayList<String> list = new ArrayList<>();
		int topN=10;
		try {
			Document doc = Jsoup.connect("https://www.daum.net/").get();
			Elements data = doc.select("div.rank_cont span.txt_issue");
			int j=0;
			for(int i=0;i<topN;i++)
			{
				//System.out.println(data.get(j).text());
				list.add(data.get(j).text());
				j+=2;
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	/*
<ul class="ah_l" data-list="1to10" style="display: block;">
<li class="ah_item ah_on" data-order="1" queryid="C1541120521120823336">
<a href="https://search.naver.com/search.naver?where=nexearch&amp;query=%EC%84%9C%EB%B8%8C%EC%9B%A8%EC%9D%B4+1%2B1&amp;sm=top_lve&amp;ie=utf8" class="ah_a" data-clk="lve.keyword">
<span class="ah_r" queryid="C1541120521136939661">1</span>
<span class="ah_k">서브웨이 1+1</span>
</a>
<a href="http://datalab.naver.com/keyword/realtimeDetail.naver?datetime=2018-11-02T10:01:00&amp;query=%EC%84%9C%EB%B8%8C%EC%9B%A8%EC%9D%B4+1%2B1&amp;where=main" class="ah_da" data-clk="lve.kwdhistory">
<span class="blind">데이터랩 그래프 보기</span>
<span class="ah_ico_datagraph"></span>
</a>
	 */
	public ArrayList<String> NaverFindDate()
	{
		ArrayList<String> list = new ArrayList<>();
		int topN=10;
		try {
			Document doc = Jsoup.connect("https://www.naver.com/").get();
			Elements rank = doc.select("li.ah_item span.ah_r");
			Elements data = doc.select("li.ah_item span.ah_k");
			int j=0;
			for(int i=0;i<topN;i++)
			{
				//System.out.println(rank.get(i).text()+"위. "+data.get(i).text());
				list.add(data.get(i).text());
				//list.add(data.get(j).text());
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
}
