<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<link rel="stylesheet" href="/Board2/css/style.css" />
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="/Board2/js/zipcode.js"></script>
		<script>
		$(function(){
			var input = $('.checkDp');
			input.focusout(function(){
				var tag   = $(this);
				var type  = tag.attr('name');
				var value = tag.val();
				if(value == ''){
					// 값을 입력하지 않으면 서버로 통신하지 않음
					return false;
				}
				$.ajax({
					url: '/Board2/user/checkUid.do?uid='+uid,
					type: 'get',
					dataType: 'json',
					success: function( data ){							
						if(data.rs == 1){								
							tag.next().css('color', 'red').text('이미 사용중인 '+uid+' 입니다.');
							tag.focus();
						}else{								
							tag.next().css('color', 'green').text('사용 가능한 '+uid+' 입니다.');								
						}							
					}
				});
			});	
		});
		</script>
		
		
	</head>
	<body>
		<div id="member">
			<section class="register">
				<form action="/Board2/user/register.do" method="POST">
					<section>
						<table>
							<caption>사이트 이용정보 입력</caption>
							<tr>
								<td>아이디</td>
								<td>
									<input type="text" name="uid" class="checkDp" placeholder="아이디를 입력" required />
									<span class="resultId"></span>
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="pass1" placeholder="비밀번호를 입력" required /></td>
							</tr>
							<tr>
								<td>비밀번호확인</td>
								<td><input type="password" name="pass2" placeholder="비밀번호를 확인" required /></td>
							</tr>
						</table>
					</section>
					<section>
						<table>
							<caption>개인정보 입력</caption>
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" placeholder="이름을 입력" required /></td>
							</tr>
							<tr>
								<td>별명</td>
								<td>
									<span class="info">공백없이 한글, 영문, 숫자만 입력가능</span>
									<div>
										<input type="text" name="nick" class="checkDp" placeholder="별명을 입력" required />
									</div>
									<span class="resultNick"></span>
								</td>
							</tr>
							<tr>
								<td>EMAIL</td>
								<td><input type="email" name="email" class="checkDp" placeholder="이메일을 입력" 	required /></td>
							</tr>
							<tr>
								<td>휴대폰</td>
								<td><input type="text" name="hp" class="checkDp" placeholder="-포함 13자리를 입력" maxlength="13" required /></td>
							</tr>
							<tr>
								<td>주소</td>
								<td>
									<div>
										<input type="text" name="zip" id="zip" placeholder="우편번호" readonly />
										<button type="button" class="btnFind" onclick="zipcode()">주소검색</button>
									</div>
									<div>
										<input type="text" name="addr1" id="addr1" size="50" placeholder="주소를 검색하세요." readonly />
									</div>
									<div>
										<input type="text" name="addr2" id="addr2" size="50" placeholder="상세주소를 입력하세요." />
									</div>
								</td>
							</tr>
						</table>
			
					</section>
					<div>
						<a href="/Board2/" class="cancel">취소</a> 
						<input type="submit" class="join" value="회원가입" />
					</div>
				</form>
			</section>
		</div>
	</body>
</html>