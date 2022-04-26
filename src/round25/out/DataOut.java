package round25.out;

import java.io.IOException;
import java.io.Reader;

public class DataOut {
	private Reader in;

	public Reader getIn() {
		return in;
	}

	public void setIn(Reader in) {
		this.in = in;
		viewData();
	}

	private void viewData() {
		// TODO Auto-generated method stub
		try {
			while (true) {
				int x = in.read();
				if (x == -1)
					break;
				System.out.println((char) x);
			}
		} catch (IOException e) {
		} finally {
			try {
				in.close();
			} catch (IOException e) { }
		}
	}
}
