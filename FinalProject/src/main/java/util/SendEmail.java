package util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	private static final int PORT = 465;
	private static final String HOST = "smtp.naver.com";
	private static final String EMAIL_ADDRESS = "ui_01hwc<ui_01hwc@naver.com>";

	public void send(String email, String certification) {
		Properties p = System.getProperties();
		try {
			p.put("mail.smtp.host", HOST);
			p.put("mail.smtp.port", PORT);
			p.put("mail.smtp.ssl.trust", PORT);
			p.put("mail.smtp.ssl.enable", "true");
			p.put("mail.smtp.auth", "true");

			Session session = Session.getDefaultInstance(p, new javax.mail.Authenticator() {
				private final String Un = "ui_01hwc@naver.com";
				private final String Pw = "#Inanis10.";

				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(Un, Pw);
				}
			});
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(EMAIL_ADDRESS));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			msg.setSubject("유사카톡:::::::::::::::: 가입 확인 메일입니다");
			msg.setText(content(certification));
			msg.setHeader("content-Type", "text/html");
			Transport.send(msg);
		} catch (MessagingException me) {
			me.printStackTrace();
		}
	}
	
	private String content(String certification) {
		String html = "<!DOCTYPE html> "
				+ "<html>"
				+ "<head>"
				+ "<meta charset='UTF-8'/>"
				+ "</head>"
				+ "<body>"
				+ "<h1 style='text-align:center'>본인 인증 메일입니다</h1>"
				+ "<h3 style='text-align:center'>다음 인증문자를 입력해주세요.</h3>"
				+ "<h3 style='text-align:center'>" + certification + "</h3>"
				+ "</body>"
				+ "</html>";
		return html;
	}
	
	
	
	
}
