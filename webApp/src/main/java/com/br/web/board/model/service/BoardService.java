package com.br.web.board.model.service;

import static com.br.web.common.template.JDBCTemplate.close;
import static com.br.web.common.template.JDBCTemplate.getConnection;
import static com.br.web.common.template.JDBCTemplate.commit;
import static com.br.web.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.br.web.board.model.dao.BoardDao;
import com.br.web.board.model.vo.Attachment;
import com.br.web.board.model.vo.Board;
import com.br.web.board.model.vo.Category;
import com.br.web.common.model.vo.PageInfo;

public class BoardService {
	
	private BoardDao bDao = new BoardDao();
	
	public int selectBoardListCount() {
		Connection conn = getConnection();
		int listCount = bDao.selectBoardListCount(conn);
		close(conn);
		return listCount;
	}
	
	public List<Board> selectBoardList(PageInfo pi){
		Connection conn = getConnection();
		List<Board> list = bDao.selectBoardList(conn, pi);
		close(conn);
		return list;
	}
	
	public List<Category> selectCategoryList(){
		Connection conn = getConnection();
		List<Category> list = bDao.selectCategoryList(conn);
		close(conn);
		return list;
	}
	
	public int insertBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		
		// 1) Board에 Insert
		int result = bDao.insertBoard(conn, b);
		
		if(result > 0 && at != null) {
			// 2) Attachment에 Insert
			result = bDao.insertAttachment(conn, at);
		}
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
		
	}
	
	
	
	

}
