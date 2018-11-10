package com.sist.member.dao;

public class ResultVO implements Comparable<ResultVO>{
	private String memEmail;
	private double result;
	
	
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public double getResult() {
		return result;
	}
	public void setResult(double result) {
		this.result = result;
	}
	@Override
	public int compareTo(ResultVO o) {
		// TODO Auto-generated method stub
		return (result < o.result) ? 1 : ((result == o.result) ? 0 : -1);
	}
	
}
