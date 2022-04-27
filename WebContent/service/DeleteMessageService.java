package guestbook.service;

import java.sql.Connection;

import javax.el.MethodNotFoundException;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteMessageService {
	private static DeleteMessageService instance = new DeleteMessageService();

	public static DeleteMessageService getInstance() {
		return instance;
	}

	private DeleteMessageService() {

	}

	public void deleteMessage(int messageId, String password) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			MessageDao messageDao = MessageDao.getInstance();
			Message message = messageDao.select(conn, messageId);
			if (message == null) {
				throw new MethodNotFoundException("메세지 없음");
			}
			if (message.matchPassword(password)) {
				throw new InvalidPasswordException("bad password"); 
				
			}
			messageDao.delete(conn, messageId);
			conn.commit();

		} catch (Exception e) {
			JdbcUtil.rollback(conn);
			throw new ServiceException("삭제 실패 : " + e.getMessage());
		/*}catch (MessageNotFoundException ex) {
			JdbcUtil.rollback(conn);
			throw ex;*/
		}finally {
			JdbcUtil.close(conn);
		}
	}

}
