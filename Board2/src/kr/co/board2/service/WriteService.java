package kr.co.board2.service;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.board2.config.DBConfig;
import kr.co.board2.config.SQL;
import kr.co.board2.controller.CommonService;
import kr.co.board2.vo.BoardMemberVO;

public class WriteService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		if (req.getMethod().equals("POST")) {

			String path = req.getServletContext().getRealPath("/data");

			int maxSize = 1024 * 1024 * 10; // 10MB

			// multipart ��������(÷������)�� ���۹޴� mr ��ü
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());

			// form�� enctype���Ŀ� ���� multipart�� �Ѿ���� �����ʹ� �Ϲ� request�� ���� ����
			String title = mr.getParameter("subject");
			String content = mr.getParameter("content");
			String fileName = mr.getFilesystemName("file");
			String regip = req.getRemoteAddr();

			HttpSession session = req.getSession();
			BoardMemberVO bmv = (BoardMemberVO) session.getAttribute("member");
			String uid = bmv.getUid();

			if (fileName != null) {

				// 1) �ڵ�ȭ�� ���ϸ� ����(UUID : Universal Unique ID)
				int idx = fileName.lastIndexOf("."); // lastIndexOf�� �ڿ������� .�� ã�� �� �ε������� ���Ѵ� = 4
				String ext = fileName.substring(idx); // �ε����ѹ� 4���� �߶󳽴� (=���� ���� . ���� Ȯ���� 3�ڸ� ��)

				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_");
				String now = sdf.format(new Date()); // ��� ������� ���� �ð��� ���Ѵ�

				String newFileName = now + uid + ext; // 20191126111925_a101.txt

				// 2) ����� ÷�� ���ϸ� ����

				File oldFile = new File(path + "/" + fileName);
				File newFile = new File(path + "/" + newFileName);

				oldFile.renameTo(newFile);

				// 3) ���� ���ϸ�� �ڵ�ȭ�� ���ϸ��� ���̺� ���� �� �� ���

				// 1, 2�ܰ�
				Connection conn = DBConfig.getConnection();

				// Ʈ����� ���� - �߸��Ǹ� �ٽ� �����ؾ��ϱ� ������ 4�ܰ� ���� �ƴ� 3�ܰ� ������ �����Ѵ�
				conn.setAutoCommit(false);

				// 3�ܰ�
				PreparedStatement psmt1 = conn.prepareStatement(SQL.INSERT_ARTICLE);
				psmt1.setInt(1, 0); // parent
				psmt1.setString(2, "free"); // cate
				psmt1.setString(3, title); // title
				psmt1.setString(4, content);// content
				psmt1.setInt(5, 1); // file ÷�λ���
				psmt1.setString(6, uid); // uid
				psmt1.setString(7, regip); // regip

				Statement stmt = conn.createStatement();

				// 4�ܰ�
				psmt1.executeUpdate();
				ResultSet rs = stmt.executeQuery(SQL.SELECT_MAX_SEQ);

				// 5�ܰ�
				int parent = 0;
				if (rs.next()) {
					parent = rs.getInt(1);
				}

				PreparedStatement psmt2 = conn.prepareStatement(SQL.INSERT_FILE);
				psmt2.setInt(1, parent);
				psmt2.setString(2, fileName);
				psmt2.setString(3, newFileName);

				psmt2.executeUpdate();

				// Ʈ����� �� (Ȥ�� �� ���þ��ε� ����)
				conn.commit();

				// 6�ܰ�

				rs.close();
				psmt2.close();
				psmt1.close();
				stmt.close();
				conn.close();

			} else {

				// 4) �� ���

				Connection conn = DBConfig.getConnection();

				PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
				psmt.setInt(1, 0); // parent
				psmt.setString(2, "free"); // cate
				psmt.setString(3, title); // title
				psmt.setString(4, content); // content
				psmt.setInt(5, 0); // file
				psmt.setString(6, uid); // uid
				psmt.setString(7, regip); // regip

				psmt.executeUpdate();

				psmt.close();
				conn.close();

			}

			return "redirect:/Board2/list.do";

		} else {

			return "/write.jsp";

		}
	}
}
