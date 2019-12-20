<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../_header.jsp"%>
<script>
	$(document).ready(function() {
				
		$('#btnRegister').click(function(e) {
			e.preventDefault();

			// 입력 데이터 가져오기
			var name  = $('input[name=name]').val();
			var uid   = $('input[name=uid]').val();
			var pw1   = $('input[name=pw1]').val();
			var pw2   = $('input[name=pw2]').val();
			var email = $('input[name=email]').val();
			var tel1  = $('select[name=tel1]').val();
			var tel2  = $('input[name=tel2]').val();
			var tel3  = $('input[name=tel3]').val();
			var hp1   = $('select[name=hp1]').val();
			var hp2   = $('input[name=hp2]').val();
			var hp3   = $('input[name=hp3]').val();
			var addrT = $('input[name=addrType]:checked').val();
			var zip   = $('input[name=zip]').val();
			var addr1 = $('input[name=addr1]').val();
			var addr2 = $('input[name=addr2]').val();

			
			// 데이터 전송하기
			var jsonUserData = {
					'name' : name,
					'uid' : uid,
					'pw1' : pw1,
					'email' : email,
					'tel' : tel1+'-'+tel2+'-'+tel3,
					'hp' : hp1+'-'+hp2+'-'+hp3,
					'addrType' : addrT,
					'zip' : zip,
					'addr1' : addr1,
					'addr2' : addr2
			};

			
			$.ajax({
				
				url: '/jcinema/member/register',
				type: 'post',
				data: jsonUserData,
				dataType: 'json',
				success: function(data){
					alert("회원가입이 완료되었습니다.");
					location.href='/jcinema/member/login';
					
				}
				
			});
			
		});
		
	});




</script>

<div id="sub" class="register">
    <section>
        <div class="agreement">
            <h1>회원가입</h1>
            <article>
                <h3>약관</h3>
                <label><input type="checkbox" name="check_all" id="check_all"/>전체동의</label>
                <div>
                    <strong>개인정보</strong>
                    <p class="agree1">
                        <label><input type="checkbox" name="check1" id="check1" />개인정보의 선택적인 사항에 대한 수집이용 동의<em>(선택)</em></label>
                        <a href="#">자세히</a>                                
                    </p>
                    <p class="agree2">
                        <label><input type="checkbox" name="check2" id="check2" />개인정보의 선택적인 제3자 제공에 대한 동의<em>(선택)</em></label>
                        <a href="#">자세히</a>                                
                    </p>

                    <strong>수집동의</strong>
                    <p class="agree3">
                        <label><input type="checkbox" name="check3" id="check3" />선택입력정보 수집 동의서<em>(선택)</em></label>
                        <a href="#">자세히</a>                                
                    </p>                            
                </div>
                <p>
                    -&nbsp;선택항목에 동의하지 않으셔도 정상적인 서비스를 이용하실 수 있습니다.
                </p>
                
            </article>

        </div>                
    </section>
    <section>
        <div class="member">
            <article>
                <h3>회원정보 입력</h3>
                
                <table>
                    <tr>
                        <td>이름</td>
                        <td><input type="text" name="name"/></td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td>
                            <input type="text" name="uid"/>
                            <span class="check_uid_result"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input type="password" name="pw1"/></td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td>
                            <input type="password" name="pw2"/>
                            <span class="check_pw_result"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>
                            <input type="text" name="email"/>
                            <span class="check_email_result"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td>
                            <select name="tel1" class="tel">
                                <option>02</option>
                                <option>051</option>
                                <option>053</option>
                                <option>053</option>
                                <option>025</option>
                                <option>023</option>
                            </select>
                            &nbsp;-&nbsp;
                            <input type="text" name="tel2" class="tel" maxlength="4"/>
                            &nbsp;-&nbsp;
                            <input type="text" name="tel3" class="tel" maxlength="4"/>                                    
                        </td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td>
                            <select name="hp1" class="hp">
                                <option>010</option>
                                <option>011</option>
                                <option>012</option>
                                <option>013</option>
                                <option>014</option>
                                <option>015</option>
                            </select>
                            &nbsp;-&nbsp;
                            <input type="text" name="hp2" class="hp" maxlength="4"/>
                            &nbsp;-&nbsp;
                            <input type="text" name="hp3" class="hp" maxlength="4"/>
                            <span class="check_hp_result"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>
                            <div>
                                <label><input type="radio" id="addrType1" name="addrType" value="1">자택</label>
                                <label><input type="radio" id="addrType2" name="addrType" value="2">직장</label>
                            </div>
                            <button>우편번호</button>
                            <input type="text" name="zip"   class="zip"/>
                            <input type="text" name="addr1" class="addr" />
                            <input type="text" name="addr2" class="addr"/>
                        </td>
                    </tr>
                </table>
                <p>
                    - J.POINT 회원정보를 변경하시면, 가입하신 J.POINT 제휴사의 회원정보가 함께 변경됩니다.
                </p>
            </article>

            <article class="marketing">
                <h3>마케팅 정보 수신동의</h3>
                <table>
                    <tr>
                        <td colspan="2">
                            <label><input type="checkbox" id="check_marketing_all" name="check_marketing_all"/>전체동의</label>
                        </td>                                
                    </tr>
                    <tr>
                        <td>L.POINT</td>
                        <td>                                    
                            <label><input type="checkbox" id="agree_point_email" name="agree_point_email" />E-Mail</label>
                            <label><input type="checkbox" id="agree_point_sms" name="agree_point_sms" />SMS</label>
                            <label><input type="checkbox" id="agree_point_tm" name="agree_point_tm" />TM</label>
                            <label><input type="checkbox" id="agree_point_dm" name="agree_point_dm" />DM</label>
                        </td>
                    </tr>
                    <tr>
                        <td>제휴사이트</td>
                        <td>
                            <label><input type="checkbox" id="agree_site_email" name="agree_site_email" />E-Mail</label>
                            <label><input type="checkbox" id="agree_site_dm" name="agree_site_dm" />SMS</label>
                        </td>
                    </tr>
                </table>
                <p>
                    -&nbsp;정보수신동의를 하시면, 고객혜택 및 이벤트 등 다양한 정보를 받으실 수 있습니다.<br>
                    -&nbsp;롯데손해보험 TM동의 여부 확인 및 변경은 롯데멤버스 고객센터(1899-8900)로 문의바랍니다.
                </p>
            </article>

            <div>
                <a href="#" class="btn cancel">취소</a>
                <a href="#" id="btnRegister" class="btn register">회원가입</a>
            </div>

        </div>
        
    </section>            
</div>


<%@ include file="../_footer.jsp"%>