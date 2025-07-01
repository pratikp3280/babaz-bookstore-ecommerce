package servlet;

import java.io.IOException;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ContactServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        final String toEmail = "pattupammu123@gmail.com"; // Receiver (you)
        final String fromEmail = "pattupammu123@gmail.com"; // Gmail sender
        final String password = "qixsadutwvkffsyc"; // Gmail App Password

        // SMTP server configuration
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Create Session
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            // Create the email message
            Message mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(fromEmail));
            mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            mimeMessage.setSubject("Contact Form Submission from " + firstName + " " + lastName);
            mimeMessage.setText("Name: " + firstName + " " + lastName +
                    "\nEmail: " + email +
                    "\nPhone: " + phone +
                    "\n\nMessage:\n" + message);

            // Send the message
            Transport.send(mimeMessage);

            response.sendRedirect("contact.jsp?status=success");

        } catch (MessagingException e) {
            e.printStackTrace();
            response.sendRedirect("contact.jsp?status=error");
        }
    }
}
