package common;

public enum StatusCode {

	SYSTEM_ERROR("Lỗi hệ thống");

	String message;

	StatusCode(String s) {
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
