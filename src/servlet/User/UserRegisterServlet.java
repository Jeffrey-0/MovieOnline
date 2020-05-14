package servlet.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dao.Impl.UserDaoImpl;
import model.User;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType ("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("username");
		String selfdescn = request.getParameter("selfdescn");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String Phonenumber = request.getParameter("Phonenumber");
		String backPassTip = request.getParameter("backPassTip");
		

		
		
		
		UserDao userdao =new UserDaoImpl();
		User user=userdao.queryById(Phonenumber);
		if(user!=null) {
		
			 PrintWriter out = response.getWriter();
			 String a = URLEncoder.encode("账号已存在，请重试!", "UTF-8"); 
			 out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'));window.location.href='login.jsp?method=sindex';</script>");
			 out.flush();
			 out.close();			
	
		}
		else {

			if(password.equals(password2)) {
				user=new User();
//				user.setId(Integer.parseInt(id));
				user.setName(name);
				user.setSelfdescn(selfdescn);
				user.setPassword(password);
				user.setPhonenumber(Phonenumber);
				user.setBackPassTip(backPassTip);
				userdao.save(user);
				request.getSession().setAttribute("loginUser", user);
				
				PrintWriter out = response.getWriter();
				String a = URLEncoder.encode("注册成功！", "UTF-8"); 
				out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'));window.location.href='index';</script>");
				out.flush();
				out.close();		
			}else {
				PrintWriter out = response.getWriter();
				 String a = URLEncoder.encode("两次密码输入不一致", "UTF-8"); 
				 out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'));window.location.href='login.jsp?method=sindex';</script>");
				 out.flush();
				 out.close();			
			}
				
			
		}
	
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
