package kr.co.jcinema.config;

public class SQL {
	
	// 회원관련

	public static final String SELECT_LOGIN = "SELECT * FROM `JC_MEMBER` WHERE `user_id`=? AND `user_pass`=PASSWORD(?);";
	
	public static final String INSERT_MEMBER  = "INSERT INTO `JC_MEMBER` SET "
			  + "`user_id`=?,"
			  + "`user_pass`=PASSWORD(?),"
			  + "`user_name`=?,"
			  + "`user_email`=?,"
			  + "`user_tel`=?,"
			  + "`user_hp`=?,"
			  + "`user_grade`=?,"
			  + "`user_point`=100,"
			  + "`user_addr_type`=?,"
			  + "`user_zip`=?,"
			  + "`user_addr_main`=?,"
			  + "`user_addr_detail`=?,"
			  + "`user_regip`=?,"
			  + "`user_rdate`=NOW();";
	
	public static final String UPATE_MEMBER = "UPDATE `JC_MEMBER` SET "
			  + "`user_pass`=PASSWORD(?),"
			  + "`user_name`=?,"
			  + "`user_tel`=?,"
			  + "`user_addr_type`=?,"
			  + "`user_zip`=?,"
			  + "`user_addr_main`=?,"
			  + "`user_addr_detail`=?,"
			  + "`user_agree_point`=?,"
			  + "`user_agree_site`=? "
			  + "WHERE `user_id`=?";

	public static final String SELECT_TERMS = "SELECT * FROM `JC_TERMS`;";
	
	public static final String SELECT_CHECK_UID   = "SELECT COUNT(*) FROM `JC_MEMBER` WHERE `user_id`=?";
	public static final String SELECT_CHECK_NICK  = "SELECT COUNT(*) FROM `JC_MEMBER` WHERE `nick`=?";
	public static final String SELECT_CHECK_EMAIL = "SELECT COUNT(*) FROM `JC_MEMBER` WHERE `email`=?";
	public static final String SELECT_CHECK_HP    = "SELECT COUNT(*) FROM `JC_MEMBER` WHERE `hp`=?";
	
	// 예매관련
	
	public static final String SELECT_MOVIE = "SELECT * FROM JC_MOVIE WHERE `movie_no`=?";
	
	public static final String SELECT_MOVIES_ROUND_VIEW = "SELECT * FROM JC_MOVIE_SCHEDULE WHERE "
													+ "`schedule_date`=? AND `schedule_theater_no`=? AND `schedule_movie_no`=? "
													+ "ORDER BY schedule_screen_no ASC, schedule_round_view ASC";

	public static final String SELECT_MOVIES_BY_THEATER = "SELECT * FROM JC_MOVIE_SCHEDULE AS a "
														+ "JOIN JC_MOVIE AS b "
														+ "ON a.schedule_movie_no = b.movie_no "
														+ "WHERE a.schedule_theater_no=? AND a.schedule_date=? "
														+ "GROUP BY a.schedule_movie_no "
														+ "ORDER BY b.movie_ticket_rate DESC, b.movie_release_date DESC;";
	
	public static final String SELECT_REMAIN_SEAT_WITH_TOTAL = "SELECT COUNT(*) AS `total`, SUM(`ticket_is_valid`=1) AS `remain` "
																+ "FROM JC_TICKET "
																+ "WHERE ticket_movie_date=? "
																+ "AND ticket_theater_no=? "
																+ "AND ticket_movie_no=? "
																+ "AND ticket_screen_no=? "
																+ "GROUP BY ticket_round_view;";
	
	public static final String SELECT_SEAT = "SELECT a.*, b.ticket_is_valid "
											+ "FROM JC_SEAT AS a JOIN JC_TICKET AS b "
											+ "ON CONCAT(a.seat_row, a.seat_column) = b.ticket_seat "
											+ "WHERE `seat_theater_no`=? "
											+ "AND `seat_screen_no`=? "
											+ "AND `ticket_screen_no`=? "
											+ "AND `ticket_movie_no`=? "
											+ "AND `ticket_movie_date`=? "
											+ "AND `ticket_round_view`=?;";
	
	public static final String SELECT_SEAT_TOTAL_BY_ROW = "SELECT *, COUNT(seat_row) AS total "
													+ "FROM JC_SEAT "
													+ "WHERE `seat_theater_no`=? "
													+ "AND `seat_screen_no`=? "
													+ "GROUP BY `seat_row`;";
	public static final String SELECT_SEAT_TOTAL_BY_COLUMN = "SELECT *, COUNT(seat_column) AS total "
													+ "FROM JC_SEAT "
													+ "WHERE `seat_theater_no`=? "
													+ "AND `seat_screen_no`=? "
													+ "GROUP BY `seat_column`;";
											
	// 영화관련
		
	public static final String SELECT_POSTERS = "SELECT `movie_no`, `movie_title`, `movie_poster` FROM `JC_MOVIE` ORDER BY `movie_release_date` DESC LIMIT 10";
	
	public static final String SELECT_MOVIE_SCHEDULE_WITH_THEATER = "SELECT a.*, b.theater_name, c.screen_name FROM JC_MOVIE_SCHEDULE AS a "
																	+ "JOIN JC_THEATER AS b "
																	+ "ON a.schedule_theater_no = b.theater_no "
																	+ "JOIN JC_SCREEN AS c "
																	+ "ON a.schedule_theater_no = c.screen_theater_no AND a.schedule_screen_no = c.screen_no "
																	+ "WHERE `schedule_theater_no`=? "
																	+ "AND schedule_movie_no=? "
																	+ "AND schedule_screen_no=? "
																	+ "AND schedule_date=? "
																	+ "AND schedule_round_view=?;";
	
	
	// 게시물관련
		
	public static final String SELECT_ARTICLE_TOTAL = "SELECT COUNT(*) FROM `JC_ARTICLE` WHERE `parent`=0;";
	public static final String SELECT_ARTICLE_LIST = "SELECT a.*, b.nick FROM `JC_ARTICLE` AS a "
													+ "JOIN `JC_MEMBER` AS b "
													+ "ON a.uid = b.uid "
													+ "WHERE a.parent = 0 "
													+ "ORDER BY seq DESC "
													+ "LIMIT ?, 10;";			// LIMIT 0, 10이 1페이지
	
	public static final String SELECT_ARTICLE_VIEW = "SELECT * FROM `JC_ARTICLE` AS a "
													+ "LEFT JOIN `JC_FILE` AS b "
													+ "ON a.seq = b.parent "
													+ "WHERE a.seq = ?;";
	
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `JC_ARTICLE` SET `hit`=`hit`+1 WHERE `seq`=?";
	
	public static final String INSERT_ARTICLE  = "INSERT INTO `JC_ARTICLE` SET "
											+ "`parent`=?, "
											+ "`cate`=?, "
											+ "`title`=?, "
											+ "`content`=?, "
											+ "`file`=?, "
											+ "`uid`=?, "
											+ "`regip`=?, "
											+ "`rdate`=NOW();";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(seq) FROM `JC_ARTICLE`";
	
	public static final String SELECT_FILE = "SELECT * FROM `JC_FILE` WHERE `parent`=?;";
	public static final String UPDATE_FILE_COUNT = "UPDATE `JC_FILE` SET `download`=`download`+1 WHERE `parent`=?;";
	public static final String INSERT_FILE = "INSERT INTO `JC_FILE` SET "
											+ "`parent`  =?, "
											+ "`oldName` =?, "
											+ "`newName` =?, "
											+ "`rdate` = NOW()";
	public static final String DELETE_FILE = "DELETE FROM `JC_FILE` WHERE `parent`=?";
	
	public static final String UPDATE_COMMENT_COUNT = "UPDATE `JC_ARTICLE` SET `comment` = `comment`+1 WHERE `seq`=?";
	public static final String SELECT_COMMENT_LIST = "SELECT * FROM `JC_ARTICLE` WHERE parent=?";
	public static final String INSERT_COMMENT = "INSERT INTO `JC_ARTICLE` SET "
											+ "`parent`=?, "
											+ "`content`=?, "
											+ "`uid`=?, "
											+ "`regip`=?, "
											+ "`rdate`=NOW();";
	
	public static final String UPDATE_MODIFY_ARTICLE = "UPDATE `JC_ARTICLE` SET "
											+ "`title` =?, "
											+ "`content` =? "
											+ "WHERE `seq` =?";

	public static final String DELETE_ARTICLE = "DELETE FROM `JC_ARTICLE` WHERE `seq`=?";

}
