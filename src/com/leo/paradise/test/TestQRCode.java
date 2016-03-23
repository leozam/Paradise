package com.leo.paradise.test;

import com.leo.paradise.util.QRCode;

public class TestQRCode
{
	public static void main(String[] args)
	{
		QRCode qrcode = QRCode.NEW("it's sdfokay");
		String filePath = "E:\\WorkSpace\\Paradise\\web\\rs\\images\\qrcode\\1.png";
		String icon="E:\\WorkSpace\\Paradise\\web\\Favicon.ico";
		qrcode.toFile(filePath,icon);
	}
}
