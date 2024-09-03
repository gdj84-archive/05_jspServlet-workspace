package com.br.web.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.br.web.notice.model.dao.NoticeDao;
import com.br.web.notice.model.vo.Notice;

import static com.br.web.common.template.JDBCTemplate.getConnection;
import static com.br.web.common.template.JDBCTemplate.close;
import static com.br.web.common.template.JDBCTemplate.commit;
import static com.br.web.common.template.JDBCTemplate.rollback;

public class NoticeService {
	
	private NoticeDao nDao = new NoticeDao();
	
	public List<Notice> selectNoticeList(){
		Connection conn = getConnection();
		List<Notice> list = nDao.selectNoticeList(conn);
		close(conn);
		return list;
	}
	
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = nDao.insertNotice(conn, n);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	
	

}
