package guestbook.service;

import java.sql.Connection;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class WriteMessageService {
	private static WriteMessageService instance = new WriteMessageService();
	
	public static WriteMessageService getInstance() {
		return instance;
	}

	public WriteMessageService() {
	}
	
	public void write(Message message) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			messageDao.insert(conn, message);
		}catch (Exception e) {
			throw new ServiceException("메시지 등록 실패 : " + e.getMessage());
			
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
