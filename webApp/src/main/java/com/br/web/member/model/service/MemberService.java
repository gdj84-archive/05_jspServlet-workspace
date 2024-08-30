package com.br.web.member.model.service;

import java.sql.Connection;

import com.br.web.member.model.dao.MemberDao;

import static com.br.web.common.template.JDBCTemplate.getConnection;

public class MemberService {
	
	private MemberDao mDao = new MemberDao();
	
	public void loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
	}
	

}
