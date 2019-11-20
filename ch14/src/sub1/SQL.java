package sub1;

public class SQL {
	
	// 회원관련

	public static final String SELECT_LOGIN = "SELECT * FROM `BOARD_MEMBER` WHERE `uid` = ? AND `pass` = PASSWORD(?);";

	public static final String INSERT_USER = "INSERT INTO `BOARD_MEMBER` SET "
											+ "`uid`   = ?," 
											+ "`pass`  = PASSWORD(?),"
											+ "`name`  = ?," 
											+ "`nick`  = ?," 
											+ "`email` = ?," 
											+ "`hp`	   = ?," 
											+ "`zip`   = ?," 
											+ "`addr1` = ?," 
											+ "`addr2` = ?," 
											+ "`regip` = ?," 
											+ "`rdate` = NOW();" ;

	public static final String SELECT_TERMS = "SELECT * FROM `BOARD_TERMS`;";
	
	public static final String SELECT_CHECK_UID   = "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `uid`=?";
	public static final String SELECT_CHECK_NICK  = "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `nick`=?";
	public static final String SELECT_CHECK_EMAIL = "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `email`=?";
	public static final String SELECT_CHECK_HP    = "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `hp`=?";
    
	
	// 게시물관련
	
	public static final String INSERT_ARTICLE = "INSERT INTO `BOARD_ARTICLE` SET "
												+ "`parent`  = ?, "
												+ "`cate`    = ?, "
												+ "`title`   = ?, "
												+ "`content` = ?, "
												+ "`file`    = ?, "
												+ "`uid`     = ?, "
												+ "`regip`   = ?, "
												+ "`rdate`   = NOW(); ";

}
