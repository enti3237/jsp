<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>

<section class="movie-register">

    <nav>
        <h3>영화등록</h3>
        <p>영화관리 > 영화등록</p>
    </nav>
                        
    <article>
        <form action="#">
            <div class="field">
                <label for="title">영화제목</label>
                <input id="title" type="text" name="title" />
            </div>
            <div class="field">
                <label for="grade">영화등급</label>
                <select name="grade" id="grade">
                    <option value="0">전체관람가</option>
                    <option value="12">12세 이상 관람가</option>
                    <option value="15">15세 이상 관람가</option>
                    <option value="18">청소년 관람불가</option>
                    <option value="19">미성년자 관람불가</option>
                </select>
            </div>
            <div class="field">
                <label for="company">제작사</label>
                <input id="company" type="text" name="company" />
            </div>
            <div class="field">
                <label for="release_date">개봉일</label>
                <input id="release_date" type="date" name="release_date" />
            </div>
            <div class="field">
                <label for="genre">장르</label>
                <input id="genre" type="text" name="genre" />
            </div>
            <div class="field">
                <label for="country">제작국</label>
                <input id="country" type="text" name="country" />
            </div>
            <div class="field">
                <label for="running_time">러닝타임</label>
                <input id="running_time" type="text" name="running_time" />
                <span>분 단위로 입력 예) 100, 120, 160, 180</span>
            </div>
            <div class="field">
                <label for="homepage">공식 홈페이지</label>
                <input id="homepage" type="text" name="homepage" />
            </div>
            <div class="field">
                <label for="poster">영화 공식 포스터</label>
                <input id="poster" type="file" name="poster" />
            </div>                        
            <div class="field">
                <label for="director">영화감독</label>
                <input id="director" type="text" name="director" />
            </div>
            <div class="field">
                <label for="actor">영화배우</label>
                <input id="actor" type="text" name="actor" />
            </div>
            <div class="field">
                <label for="desc">영화설명</label>
                <textarea name="desc" id="desc" cols="100" rows="16"></textarea>
            </div>
            <button type="submit" class="btnRegister">등록하기</button>
        </form>
    </article>

    
</section>


<%@ include file="../_footer.jsp" %>