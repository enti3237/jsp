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
			  + "`user_grade`=2,"
			  + "`user_point`=100,"
			  + "`user_addr_type`=?,"
			  + "`user_zip`=?,"
			  + "`user_addr_main`=?,"
			  + "`user_addr_detail`=?,"
			  + "`user_regip`=?,"
			  + "`user_rdate`=NOW();";

	public static final String SELECT_TERMS = "SELECT * FROM `JC_TERMS`;";
	
	public static final String SELECT_CHECK_UID   = "SELECT COUNT(*) FROM `JC_MEMBER` WHERE `uid`=?";
	public static final String SELECT_CHECK_NICK  = "SELECT COUNT(*) FROM `JC_MEMBER` WHERE `nick`=?";
	public static final String SELECT_CHECK_EMAIL = "SELECT COUNT(*) FROM `JC_MEMBER` WHERE `email`=?";
	public static final String SELECT_CHECK_HP    = "SELECT COUNT(*) FROM `JC_MEMBER` WHERE `hp`=?";
	
	
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
