package round22.base;

import java.io.Serializable;

public class JangBaguni implements Serializable {
	private String name;
	private int price;
	private int cnt;
	public JangBaguni() {
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}
