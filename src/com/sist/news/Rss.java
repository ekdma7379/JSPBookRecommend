package com.sist.news;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/*
 *   <rss>
 *    <channel></channel>
 *    
 *    ==> �±� => Ŭ������ �ν� 
 */
@XmlRootElement
public class Rss {
    private Channel channel=new Channel();

	public Channel getChannel() {
		return channel;
	}
	@XmlElement
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
   
}
