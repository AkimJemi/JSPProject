package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JdbcUtil {
	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
			}

		}
	}

	public static void close(Statement rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
			}
		}
	}
	public static void close(Connection rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
			}
		}
	}
	public static void rollback(Connection rs) {
		if (rs != null) {
			try {
				rs.rollback();
			} catch (Exception e) {
			}
		}
	}
}
