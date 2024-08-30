package com.br.web.member.model.service;

import static com.br.web.common.template.JDBCTemplate.getConnection;
import static com.br.web.common.template.JDBCTemplate.close;

import java.sql.Connection;

import com.br.web.member.model.dao.MemberDao;
import com.br.web.member.model.vo.Member;

public class MemberService {
	
	private MemberDao mDao = new MemberDao();
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member loginUser = mDao.loginMember(conn, userId, userPwd);
		close(conn);
		return loginUser;
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = mDao.insertMember(conn, m);
		
	}
	

}
