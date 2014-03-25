package com.OnlineGridShop.util;

public class MyException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private MyError errorCode;

	public MyException(MyError nError, String description) {
		super(description);
		errorCode = nError;
	}

	public MyException(MyError nError) {
		errorCode = nError;
	}

	public final MyError getErrorCode() {
		return errorCode;
	}
}
