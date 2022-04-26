package round23.dto;

import java.text.SimpleDateFormat;

public class BoardDTO {
	private int content_num;
	private String content_title;
	private String content_writer;
	private String content_contents;
	private String content_regdate;
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getContent_num() {
		return content_num;
	}

	public void setContent_num(int content_num) {
		this.content_num = content_num;
	}

	public String getContent_title() {
		return content_title;
	}

	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}

	public String getContent_writer() {
		return content_writer;
	}

	public void setContent_writer(String content_writer) {
		this.content_writer = content_writer;
	}

	public String getContent_contents() {
		return content_contents;
	}

	public void setContent_contents(String content_contents) {
		this.content_contents = content_contents;
	}

	public String getContent_regdate() {
		return content_regdate;
	}


	public void setContent_regdate(java.sql.Timestamp regdate) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		content_regdate = format.format(new java.util.Date(regdate.getTime()));
	}
	

}
