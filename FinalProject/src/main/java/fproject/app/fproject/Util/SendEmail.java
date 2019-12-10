package fproject.app.fproject.Util;

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
	private static final String HOST = "smtp.gmail.com";
	private static final String EMAIL_ADDRESS = "ui.01hwc<ui.01hwc@gmail.com>";

	public void send(String email, String certification, int num) {
		Properties p = System.getProperties();
		try {
			p.put("mail.smtp.host", HOST);
			p.put("mail.smtp.port", PORT);
			p.put("mail.smtp.ssl.trust", PORT);
			p.put("mail.smtp.ssl.enable", "true");
			p.put("mail.smtp.auth", "true");

			Session session = Session.getDefaultInstance(p, new javax.mail.Authenticator() {
				private final String Un = "ui.01hwc@gmail.com";
				private final String Pw = "#Inanis10.";

				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(Un, Pw);
				}
			});
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(EMAIL_ADDRESS));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			msg.setSubject("����ī��:::::::::::::: ���� �����Դϴ�.");
			msg.setText(content(certification, num));
			msg.setHeader("content-Type", "text/html");
			Transport.send(msg);
		} catch (MessagingException me) {
			me.printStackTrace();
		}
	}
	
	private String content(String certification, int num) {
		String html = "";
		if(num == 0) {
			html = "<!DOCTYPE html> "
				+ "<html>"
				+ "<head>"
				+ "<meta charset='UTF-8'/>"
				+ "</head>"
				+ "<body>"
				+ "<h1 style='text-align:center'>���� ���� �����Դϴ�</h1>"
				+ "<hr><br><br>"
				+ "<h3 style='text-align:center'>���� ������ȣ�� �Է����ּ���.</h3>"
				+ "<h3 style='text-align:center'>" + certification + "</h3>"
				+ "</body>"
				+ "</html>";
		} else {
			html = "<!DOCTYPE html> "
					+ "<html>"
					+ "<head>"
					+ "<meta charset='UTF-8'/>"
					+ "</head>"
					+ "<body>"
					+ "<h1 style='text-align:center'>�ӽ� ��й�ȣ�Դϴ�</h1>"
					+ "<hr><br><br>"
					+ "<h3 style='text-align:center'>���� �ӽ� ��й�ȣ�� �α��� �� ��й�ȣ�� �����Ͽ� ����ϼ���.</h3>"
					+ "<h3 style='text-align:center'>" + certification + "</h3>"
					+ "</body>"
					+ "</html>";
		}
		return html;
	}

}