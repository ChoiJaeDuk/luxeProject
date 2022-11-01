package luxe.dao.order;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailTest {

	public static void MailSend(String address, String subject, String text) {
		//smtop 서버 정보를 설정
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host", "smtp.naver.com");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.ssl.enable", "true");

		Authenticator auth = new MyAuthentication();

		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);
		
		//email전송
		try {

			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();
			from = new InternetAddress("aj5452@naver.com"); // 수신자

			msg.setFrom(from);

			InternetAddress to = new InternetAddress(address); // 발신자
			msg.setRecipient(Message.RecipientType.TO, to);

			msg.setSubject(subject, "UTF-8");

			msg.setText(text, "UTF-8");

			msg.setHeader("content-Type", "text/html");

			javax.mail.Transport.send(msg, msg.getAllRecipients());

		} catch (AddressException addr_e) {
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) {
			msg_e.printStackTrace();
		} catch (Exception msg_e) {
			msg_e.printStackTrace();
		}
	}

}

class MyAuthentication extends Authenticator {

	PasswordAuthentication pa;

	public MyAuthentication() {

		String id = "aj5452@naver.com";
		String pw = "wldms!4869";

		pa = new PasswordAuthentication(id, pw);
	}

	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
