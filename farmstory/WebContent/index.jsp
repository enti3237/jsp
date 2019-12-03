<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.farmstory.bean.BoardArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 1, 2단계
	Connection conn = DBConfig.getConnection();

	// 3단계
	PreparedStatement psmt1 = conn.prepareStatement(SQL.SELECT_LATEST_BOARD);
	psmt1.setString(1, "grow");

	PreparedStatement psmt2 = conn.prepareStatement(SQL.SELECT_LATEST_BOARD);
	psmt2.setString(1, "school");
	
	PreparedStatement psmt3 = conn.prepareStatement(SQL.SELECT_LATEST_BOARD);
	psmt3.setString(1, "story");
	
	// 4단계
	ResultSet rs1 = psmt1.executeQuery();
	ResultSet rs2 = psmt2.executeQuery();
	ResultSet rs3 = psmt3.executeQuery();
	
	// 5단계 - 5건씩 추출하게 되니 리스트로
	List<BoardArticleBean> latest1 = new ArrayList<>();
	List<BoardArticleBean> latest2 = new ArrayList<>();
	List<BoardArticleBean> latest3 = new ArrayList<>();
	
	while(rs1.next()){
		BoardArticleBean bab = new BoardArticleBean();
		/* 인덱스값 지정주의 */		
		bab.setTitle(rs1.getString(1));
		bab.setRdate(rs1.getString(2));
		bab.setSeq(rs1.getInt(3));
		latest1.add(bab);
	}
	
	while(rs2.next()){
		BoardArticleBean bab = new BoardArticleBean();
		
		bab.setTitle(rs2.getString(1));
		bab.setRdate(rs2.getString(2));
		bab.setSeq(rs2.getInt(3));
		latest2.add(bab);
	}
	
	while(rs3.next()){
		BoardArticleBean bab = new BoardArticleBean();

		bab.setTitle(rs3.getString(1));
		bab.setRdate(rs3.getString(2));
		bab.setSeq(rs3.getInt(3));
		latest3.add(bab);
	}	
	
	// 6단계
	rs3.close();
	rs2.close();
	rs1.close();
	psmt3.close();
	psmt2.close();
	psmt1.close();
	conn.close();

%>

<%@ include file="./_header.jsp" %>

<main>
    <div class="slider">                
        <img src="/farmstory/img/main_slide_img_tit.png" class="slogan" alt="사람과 자연을 사랑하는 팜스토리">

        <ul>                    
            <li><img src="/farmstory/img/main_slide_img1.jpg" alt="슬라이드1"></li>
            <li><img src="/farmstory/img/main_slide_img2.jpg" alt="슬라이드2"></li>
            <li><img src="/farmstory/img/main_slide_img3.jpg" alt="슬라이드3"></li>
        </ul>

        <div class="banner">
            <img src="/farmstory/img/main_banner_txt.png" alt="Grand Open">
            <img src="/farmstory/img/main_banner_tit.png" alt="30% 할인 이벤트">
            <img src="/farmstory/img/main_banner_img.png" alt="이미지">                    
        </div>
    </div>

    <div class="quick">
        <a href="#"><img src="/farmstory/img/main_banner_sub1_tit.png" alt="오늘의 식단"></a>
        <a href="#"><img src="/farmstory/img/main_banner_sub2_tit.png" alt="나도 요리사"></a>                
    </div>

    <div class="latest">
        <article>
            <img src="/farmstory/img/main_latest1_tit.png" alt="텃밭가꾸기">
            <img src="/farmstory/img/main_latest1_img.jpg" alt="이미지">
            <table border="0">
                <% for(BoardArticleBean bab : latest1){%>
                <tr>
                	<td>></td>
                	<td><a href="/farmstory/board/view.jsp?cate=grow&group=croptalk&seq=<%= bab.getSeq() %>"><%= bab.getTitle() %></a></td>
                	<td><%= bab.getRdate().substring(2, 10) %></td>
                </tr>
                <% } %>
            </table>
        </article>
        <article>
            <img src="/farmstory/img/main_latest2_tit.png" alt="귀농학교">
            <img src="/farmstory/img/main_latest2_img.jpg" alt="이미지">
            <table border="0">
            	<% for(BoardArticleBean bab : latest2){ %>
            	<tr>
            		<td> > </td>
            		<td><a href="/farmstory/board/view.jsp?cate=school&group=croptalk&seq=<%= bab.getSeq() %>"><%= bab.getTitle() %></a></td>
            		<td><%= bab.getRdate().substring(2,10) %></td>
            	</tr>
            	<% } %>
            </table>
        </article>
        <article>
            <img src="/farmstory/img/main_latest3_tit.png" alt="농작물이야기">
            <img src="/farmstory/img/main_latest3_img.jpg" alt="이미지">
            <table border="0">
            	<% for(BoardArticleBean bab : latest3){ %>
            	<tr>
            		<td>></td>
            		<td><a href="/farmstory/board/view.jsp?cate=story&group=croptalk&seq=<%= bab.getSeq() %>"><%= bab.getTitle() %></a></td>
            		<td><%= bab.getRdate().substring(2,10) %></td>
            	</tr>
            	<% } %>
            </table>
        </article>

      
    </div>

    <div class="info">
        <article>
            <img src="/farmstory/img/main_sub2_cs_tit.png" alt="고객센터 안내">
            <div>
                <img src="/farmstory/img/main_sub2_cs_img.png" alt="이미지">
                <img src="/farmstory/img/main_sub2_cs_txt.png" alt="1666-777">
                <ul>
                    <li>평일 : AM 09:00 ~ PM 06:00</li>
                    <li>점심 : PM 12:00 ~ PM 01:00</li>
                    <li>토, 일요일, 공휴일 휴무</li>
                </ul>
            </div>
            <div>
                <a href="#"><img src="/farmstory/img/main_sub2_cs_bt1.png" alt="1:1 고객문의"></a>
                <a href="#"><img src="/farmstory/img/main_sub2_cs_bt2.png" alt="자주묻는 질문"></a>
                <a href="#"><img src="/farmstory/img/main_sub2_cs_bt3.png" alt="배송조회"></a>
            </div>
        </article>
        <article>
            <img src="/farmstory/img/main_sub2_account_tit.png" alt="계좌안내">
            <ul>
                <li>기업은행 123-456789-01-01-012</li>
                <li>국민은행 01-1234-56789</li>
                <li>우리은행 123-456789-01-01-012</li>
                <li>하나은행 123-456789-01-01</li>
                <li>예 금 주 (주)더조은</li>
            </ul>
        </article>
        <article></article>
    </div>
</main>

<%@ include file="./_footer.jsp"%>