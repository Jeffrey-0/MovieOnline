package servlet;

import com.alibaba.fastjson.JSON;
import dao.ResDao;
import model.Resource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/resource")
public class ResourceServlet extends HttpServlet {
    ResDao rd = new ResDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        int num = 1;
        String num1 = request.getParameter("num");
        if ( num1!= null) {
            num = Integer.parseInt(num1);
        }
//        String id = rd.queryResById(request.getParameter("id"),num);
        rd.queryResById(request.getParameter("id"),num);
        request.setAttribute("res",rd.queryResById(request.getParameter("id"),num));
        request.setAttribute("similarRes", rd.queryResIndexCategory(request.getParameter("classily")));
//        String sql = "SELECT * FROM src where id=?";
//        Resource resource = template.queryForObject(sql, new BeanPropertyRowMapper<>(Resource.class), request.getParameter("id"));
//        String s = JSON.toJSONString(rd.getNum(resource.getCode()));
//        request.setAttribute("jishu",s);
        request.getRequestDispatcher("resource.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
