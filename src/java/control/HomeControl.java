package control;

import dao.DAO;
import model.Category;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HomeControl", urlPatterns = {"/home"})
public class HomeControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO(); //lấy dữ liệu từ DAO
        List<Product> list = dao.getAllProduct(); //lấy thông tin các con chó
        List<Category> listC = dao.getAllCategory(); //loại chó
        Product last = dao.getLastDog(); //con chó mới nhất
        request.setAttribute("listP", list); //trả danh sách chó về trang jsp
        request.setAttribute("listCC", listC); //trả về danh sách category
        request.setAttribute("p", last); //trả về con cún mới nhất
        request.setAttribute("display", 0);
        request.setAttribute("contextPath", request.getContextPath());
        request.getRequestDispatcher("Home.jsp").forward(request, response);
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
