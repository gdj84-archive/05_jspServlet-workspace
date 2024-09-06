package com.br.web.board.model.service;

import static com.br.web.common.template.JDBCTemplate.close;
import static com.br.web.common.template.JDBCTemplate.commit;
import static com.br.web.common.template.JDBCTemplate.getConnection;
import static com.br.web.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public Map<String, Object> selectBoardByNo(int boardNo) {
		Connection conn = getConnection();
		
		// 1) Board로부터 게시글 데이터 조회
		Board b = bDao.selectBoard(conn, boardNo);
		// 2) Attachment로부터 첨부파일 데이터 조회
		Attachment at = bDao.selectAttachment(conn, boardNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("b", b);
		map.put("at", at);
		
		close(conn);
		
		return map;
		
		
	}
	
	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		int result = bDao.increaseCount(conn, boardNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int updateBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		
		// 1) Board Update
		int result = bDao.updateBoard(conn, b);
		
		if(result > 0 && at != null) {
			if(at.getFileNo() != 0) {
				// 2_1) Attachment Update
				result = bDao.updateAttachment(conn, at);
			} else {
				// 2_2) Attachment Insert
				result = bDao.insertNewAttachment(conn, at);
			}
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
