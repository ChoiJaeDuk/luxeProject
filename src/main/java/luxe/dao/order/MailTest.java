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
 
//    public static void main(String[] args) {
//         
//       MailSend.MailSend();
//}

//class MailSend{
	public static void MailSend(String address, String subject, String text){
		Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail�� true ����
        p.put("mail.smtp.host", "smtp.naver.com");      // 이메일 발송을 처리해줄 STMP 서버
        p.put("mail.smtp.auth","true");                 // gmail�� true ����
        p.put("mail.smtp.port", "465");                 // SMTP서버와 통신하는 포트
        //p.put("mail.smtp.ssl.protocols", "TLSv1.2"); //�ڵ� �߰� ����
        p.put("mail.smtp.ssl.enable", "true");
           
        Authenticator auth = new MyAuthentication();
        //session ���� ��  MimeMessage����
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            
            msg.setSentDate(new Date());
            InternetAddress from = new InternetAddress() ;
            from = new InternetAddress("aj5452@naver.com"); //수신자
            // �̸��� �߽���
            msg.setFrom(from);
            // �̸��� ������
            InternetAddress to = new InternetAddress(address); //발신자
            msg.setRecipient(Message.RecipientType.TO, to);
            // 메일제목
            msg.setSubject(subject, "UTF-8");
            // 메일내용
            msg.setText(text, "UTF-8");
            // �̸��� ���
            msg.setHeader("content-Type", "text/html");
            //���Ϻ�����
            javax.mail.Transport.send(msg, msg.getAllRecipients());
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }catch (Exception msg_e) {
            msg_e.printStackTrace();
        }
    }

	
}
 
class MyAuthentication extends Authenticator {
      
    PasswordAuthentication pa;
    public MyAuthentication(){	
         
        String id = "aj5452@naver.com";  //���̹� �̸��� ���̵�
        String pw = "wldms!3604";        //���̹� ��й�ȣ
 
        // ID�� ��й�ȣ�� �Է��Ѵ�.
        pa = new PasswordAuthentication(id, pw);
    }
 
    // �ý��ۿ��� ����ϴ� ��������
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
