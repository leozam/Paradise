package com.leo.paradise.service;

public interface EmailService
{
	boolean send(String to, String subject, String html);
}
