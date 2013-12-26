package com.feng.exception;

public class AuthorizationException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	public AuthorizationException() {}
	public AuthorizationException(String mes) {
		super(mes);
	}
	
}
