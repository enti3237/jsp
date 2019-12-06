package kr.co.board2.config;

public class SQL {
	
	// 회원관련

	public static final String SELECT_LOGIN = "SELECT * FROM `BOARD_MEMBER` WHERE `uid`=? AND `pass`=PASSWORD(?);";
	
	public static final String INSERT_USER  = "INSERT INTO `BOARD_MEMBER` SET "
											  + "`uid`=?,"
											  + "`pass`=PASSWORD(?),"
											  + "`name`=?,"
											  + "`nick`=?,"
											  + "`email`=?,"
											  + "`hp`=?,"
											  + "`zip`=?,"
											  + "`addr1`=?,"
											  + "`addr2`=?,"
											  + "`regip`=?,"
											  + "`rdate`=NOW();";

	public static final String SELECT_TERMS = "SELECT * FROM `BOARD_TERMS`;";
	
	public static final String SELECT_CHECK_UID   = "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `uid`=?";
	public static final String SELECT_CHECK_NICK  = "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `nick`=?";
	public static final String SELECT_CHECK_EMAIL = "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `email`=?";
	public static final String SELECT_CHECK_HP    = "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `hp`=?";
	
	
	// 게시물관련
	
	public static final String SELECT_ARTICLE_TOTAL = "SELECT COUNT(*) FROM `BOARD_ARTICLE` WHERE `parent`=0;";
	public static final String SELECT_ARTICLE_LIST = "SELECT a.*, b.nick FROM `BOARD_ARTICLE` AS a "
													+ "JOIN `BOARD_MEMBER` AS b "
													+ "ON a.uid = b.uid "
													+ "WHERE a.parent = 0 "
													+ "ORDER BY seq DESC "
													+ "LIMIT ?, 10;";			// LIMIT 0, 10이 1페이지
	
	public static final String SELECT_ARTICLE_VIEW = "SELECT * FROM `BOARD_ARTICLE` AS a "
													+ "LEFT JOIN `BOARD_FILE` AS b "
													+ "ON a.seq = b.parent "
													+ "WHERE a.seq = ?;";
	
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `BOARD_ARTICLE` SET `hit`=`hit`+1 WHERE `seq`=?";
	
	public static final String INSERT_ARTICLE  = "INSERT INTO `BOARD_ARTICLE` SET "
											+ "`parent`=?, "
											+ "`cate`=?, "
											+ "`title`=?, "
											+ "`content`=?, "
											+ "`file`=?, "
											+ "`uid`=?, "
											+ "`regip`=?, "
											+ "`rdate`=NOW();";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(seq) FROM `BOARD_ARTICLE`";
	
	public static final String SELECT_FILE = "SELECT * FROM `BOARD_FILE` WHERE `parent`=?;";
	public static final String UPDATE_FILE_COUNT = "UPDATE `BOARD_FILE` SET `download`=`download`+1 WHERE `parent`=?;";
	public static final String INSERT_FILE = "INSERT INTO `BOARD_FILE` SET "
											+ "`parent`  =?, "
											+ "`oldName` =?, "
											+ "`newName` =?, "
											+ "`rdate` = NOW()";
	public static final String DELETE_FILE = "DELETE FROM `BOARD_FILE` WHERE `parent`=?";
	
	public static final String UPDATE_COMMENT_COUNT = "UPDATE `BOARD_ARTICLE` SET `comment` = `comment`+1 WHERE `seq`=?";
	public static final String SELECT_COMMENT_LIST = "SELECT * FROM `BOARD_ARTICLE` WHERE parent=?";
	public static final String INSERT_COMMENT = "INSERT INTO `BOARD_ARTICLE` SET "
											+ "`parent`=?, "
											+ "`content`=?, "
											+ "`uid`=?, "
											+ "`regip`=?, "
											+ "`rdate`=NOW();";
	
	public static final String UPDATE_MODIFY_ARTICLE = "UPDATE `BOARD_ARTICLE` SET "
											+ "`title` =?, "
											+ "`content` =? "
											+ "WHERE `seq` =?";

	public static final String DELETE_ARTICLE = "DELETE FROM `BOARD_ARTICLE` WHERE `seq`=?";

}
