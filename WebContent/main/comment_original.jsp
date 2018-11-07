<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="commentsystem">
		<div id="profpicture">
			<iframe
				src="https://www.facebook.com/plugins/feedback.php?api_key=113869198637480&href=codepen.io&numposts=5&sdk=joey&version=v2.10&width=500"
				frameborder="0"
				style="position: absolute; width: 500px; height: 118px; margin-left: -8px; margin-top: -67px;"
				allowtransparency="true"></iframe>
		</div>
		<textarea minlenght="10" autocomplete="off" autocorrect="off"
			autocapitalize="off" spellcheck="false" id="comment" name="comment"
			rows='1' placeholder='Write a comment...'></textarea>
		<div id="logintopost">
			<div id="loginbtn">
				<span class="fa-stack" style="font-size: 16px;"> <i
					class="fa fa-circle-thin fa-stack-2x fa-inverse"></i> <i
					class="fa fa-facebook fa-stack-1x fa-inverse"></i>
				</span>
				<p id="logintext">Log in to post</p>
			</div>
		</div>
		<div class="switch switch-facebook">
			<input id="fb-toggle" class="switch-control" type="checkbox">
			<label class="switch-toggle" for="fb-toggle">
				<div class="switch-handle">
					<span><i class="fa fa-facebook"></i></span>
				</div>
			</label>
		</div>
		<span id="count"></span>
		<button id="send" disabled>
			<i class="fa fa-commenting-o" style="font-size: 18px;"></i> POST
		</button>
		<ul id="commenttext">
			<li id="commentbubble">
				<div
					style="position: absolute; margin-left: -28px; overflow: hidden; width: 48px; height: 48px; border-radius: 50%; background-image: url('https://s1.postimg.org/39esn2s5lr/j_U1nlt4_J_normal.jpg')"></div>
				<div id="commentwrap">
					<div id="commentself">
						<p id="messenger-bulle">
						I do like this comment system as it is very modern and beautiful.Complitely Facebook Messenger style! 
						<span id="bullemeta">Just Now</span> <span id="like-holder"> <span class=" like-main"="">
									<span class="like-main-emo"></span> <span class="like">Like</span>
									<span class="likecount">1.2k</span>
							</span>
						</p>
						<div id="reply-button">
							<i class="fa fa-reply" style="color: #797c82;"></i> <span
								class="tooltiptext">Reply</span>
						</div>
			</li>
			<div id="reply">
				<div id="reply-profpicture">
					<iframe
						src="https://www.facebook.com/plugins/feedback.php?api_key=113869198637480&href=codepen.io&numposts=5&sdk=joey&version=v2.10&width=500"
						frameborder="0"
						style="position: absolute; width: 500px; height: 118px; margin-left: -8px; margin-top: -67px;"
						allowtransparency="true"></iframe>
				</div>
				<textarea minlenght="10" autocomplete="off" autocorrect="off"
					autocapitalize="off" spellcheck="false" id="reply-comment"
					name="comment" rows='1' placeholder='Write a reply...' autofocus></textarea>
				<button id="reply-send" disabled></button>
				<div id="reply-logintopost">
					<div id="reply-loginbtn">
						<span class="fa-stack" style="font-size: 16px;"> <i
							class="fa fa-circle-thin fa-stack-2x fa-inverse"></i> <i
							class="fa fa-facebook fa-stack-1x fa-inverse"></i>
						</span>
						<p id="reply-logintext">Log in to post</p>
					</div>
				</div>
			</div>
			<li id="commentbubble">
				<div
					style="position: absolute; margin-left: -28px; overflow: hidden; width: 48px; height: 48px; border-radius: 50%; background-image: url('https://s1.postimg.org/5bulb4qixb/image.jpg')"></div>
				<div id="commentwrap">
					<div id="commentself">
						<p id="messenger-bulle">
							Wow. Very good comment system. Easy and beautiful <span
								id="bullemeta">2 hour ago</span> <span id="like-holder">
								<span class=" like-main"=""> <span class="like-main-emo"></span>
									<span class="like">Like</span> <span class="likecount">972</span>
							</span>
						</p>
						<div id="reply-button">
							<i class="fa fa-reply" style="color: #797c82;"></i> <span
								class="tooltiptext">Reply</span>
						</div>
			</li>
			<ul id="replytext">
				<li id="replybubble">
					<div
						style="position: absolute; margin-left: -28px; margin-top: -6px; overflow: hidden; width: 48px; height: 48px; border-radius: 50%; transform: scale(0.75); background-image: url('https://s1.postimg.org/833nj7c7jj/image.jpg')"></div>
					<div id="commentwrap">
						<div id="commentself">
							<p id="reply-messenger-bulle">
								You are true. It is very easy to use <span id="bullemeta">39
									minute ago</span> <span id="like-holder"> <span
									class="like-main"=""=""> <span class="like-main-emo"></span>
										<span class="like">Like</span> <span class="likecount">511</span>
								</span>
								</span>
							</p>
						</div>
					</div>
				</li>
				<li id="replybubble">
					<div
						style="position: absolute; margin-left: -28px; margin-top: -6px; overflow: hidden; width: 48px; height: 48px; border-radius: 50%; transform: scale(0.75); background-image: url('https://s1.postimg.org/5bulb4qixb/image.jpg')"></div>
					<div id="commentwrap">
						<div id="commentself">
							<p id="reply-messenger-bulle">
								Yeah. I think this way too dear . That's why I recently
								commented that <span id="bullemeta">Yesterday</span> <span
									id="like-holder"> <span class="like-main"=""="">
										<span class="like-main-emo"></span> <span class="like">Like</span>
										<span class="likecount">21</span>
								</span>
								</span>
							</p>
						</div>
					</div>
				</li>
			</ul>
			<div id="reply">
				<div id="reply-profpicture">
					<iframe
						src="https://www.facebook.com/plugins/feedback.php?api_key=113869198637480&href=codepen.io&numposts=5&sdk=joey&version=v2.10&width=500"
						frameborder="0"
						style="position: absolute; width: 500px; height: 118px; margin-left: -8px; margin-top: -67px;"
						allowtransparency="true"></iframe>
				</div>
				<textarea minlenght="10" autocomplete="off" autocorrect="off"
					autocapitalize="off" spellcheck="false" id="reply-comment"
					name="comment" rows='1' placeholder='Write a reply...' autofocus></textarea>
				<button id="reply-send" disabled></button>
			</div>
		</ul>
		<ul id="commenttext">
			<li id="commentbubble">
				<div
					style="position: absolute; margin-left: -28px; overflow: hidden; width: 48px; height: 48px; border-radius: 50%; background-image: url('https://s1.postimg.org/3y8273f96n/4d5f804d69fc8e45acf292ccf0c2eb4c_normal.jpg')"></div>
				<div id="commentwrap">
					<div id="commentself">
						<p id="messenger-bulle">
							Nice work! I like it. It is just better than original Facebook
							commenting system. Would like to see in action soon! Keep up good
							work <span id="bullemeta">3 hour ago</span> <span
								id="like-holder"> <span class=" like-main"=""> <span
									class="like-main-emo"></span> <span class="like">Like</span> <span
									class="likecount">1.2k</span>
							</span>
						</p>
						<div id="reply-button">
							<i class="fa fa-reply" style="color: #797c82;"></i> <span
								class="tooltiptext">Reply</span>
						</div>
			</li>
		</ul>
	</div>
</body>
</html>