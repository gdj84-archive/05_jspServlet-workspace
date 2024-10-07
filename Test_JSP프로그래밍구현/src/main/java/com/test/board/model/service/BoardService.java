package com.test.board.model.service;

import static com.test.common.JDBCTemplate.close;
import static com.test.common.JDBCTemplate.commit;
import static com.test.common.JDBCTemplate.getConnection;
import static com.test.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.test.board.model.dao.BoardDao;
import com.test.board.model.vo.TestBoard;

public class BoardService {
	
	public List<TestBoard> selectBoardAll(){
		Connection conn = getConnection();
		List<TestBoard> list = new BoardDao().selectBoardAll(conn);
		close(conn);
		
		return list;
	}
	
	public int insertBoard(TestBoard b) {
		Connection conn = getConnection();
		int result = new BoardDao().insertBoard(conn, b);;
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	
}
