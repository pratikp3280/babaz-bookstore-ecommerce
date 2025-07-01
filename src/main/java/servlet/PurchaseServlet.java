package servlet;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class PurchaseServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("🚀 PurchaseServlet called");
		try {
            // 🔹 Retrieve cart total from session
            HttpSession session = request.getSession();
            Double cartTotal = (Double) session.getAttribute("cartTotal");

            if (cartTotal == null || cartTotal <= 0) {
                request.setAttribute("error", "Cart total is missing or invalid.");
                request.getRequestDispatcher("jsp/user/error.jsp").forward(request, response);
                return;
            }

            // 🔹 Convert to paise (Razorpay uses paise)
            int amountInPaise = (int) (cartTotal * 100);

            // 🔹 Initialize Razorpay client with your Test API Keys
            RazorpayClient razorpay = new RazorpayClient(
                "rzp_test_g7LE651NjLs2WH", // ✅ Your Test Key ID
                "cj2ElrptSfPlMLpuUSXjpB7N"  // ✅ Your Test Secret
            );

            // 🔹 Create a Razorpay Order
            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", amountInPaise); // amount in paise
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", "order_rcptid_" + System.currentTimeMillis());
            orderRequest.put("payment_capture", 1); // auto capture

            Order order = razorpay.orders.create(orderRequest);


            // 🔹 Pass order details to checkout.jsp
            request.setAttribute("orderId", order.get("id"));
            request.setAttribute("amount", amountInPaise);
            request.setAttribute("key", "rzp_test_g7LE651NjLs2WH");

            // 🔹 Forward to Razorpay checkout page
            request.getRequestDispatcher("jsp/user/checkout.jsp").forward(request, response);

        } catch (RazorpayException e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong during payment setup: " + e.getMessage());
            request.getRequestDispatcher("jsp/user/error.jsp").forward(request, response);
        }
    }
}
