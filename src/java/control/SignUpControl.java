package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

@WebServlet(name = "SignUpControl", urlPatterns = {"/signup"})
public class SignUpControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String repassword = request.getParameter("repass");
        if (!password.equals(repassword)) {
            request.setAttribute("wrong", "Đăng kí không thành công!<br>Mật khẩu không trùng khớp");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            DAO dao = new DAO();
            Account a = dao.checkAccExist(username);
            if (a == null) {
                dao.signUp(username, password);
                request.setAttribute("ok", "Đăng kí thành công!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                request.setAttribute("wrong", "Đăng kí không thành công!<br>Tài khoản này đã tồn tại");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
