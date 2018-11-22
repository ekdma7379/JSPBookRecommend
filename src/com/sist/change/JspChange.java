package com.sist.change;

public class JspChange {
	private static String[] jsp={
		"content.jsp",
		"signup.jsp",
		"bookfind.jsp",
		"recommend.jsp",
		"mypage.jsp",
		"bookdetail.jsp",
		"update.jsp"
		
	};
	
	public static String change(int no)
	{
			return jsp[no];
	}
}
