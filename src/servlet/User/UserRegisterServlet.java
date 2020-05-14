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
<<<<<<< HEAD
		response.setCharacterEncoding("UTF-8");
=======
		String id = request.getParameter("id");
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
		String name = request.getParameter("username");
		String selfdescn = request.getParameter("selfdescn");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String Phonenumber = request.getParameter("Phonenumber");
<<<<<<< HEAD
		String backPassTip = request.getParameter("backPassTip");
=======
		String regExp = "&#\\d*;";
		Matcher m = Pattern.compile(regExp).matcher(name);
		Matcher m2 = Pattern.compile(regExp).matcher(selfdescn);
		StringBuffer name1 = new StringBuffer();
		StringBuffer selfdescn1 = new StringBuffer();
		String s = null;
		while (m.find())
		{
		s = m.group(0);
		s = s.replaceAll("(&#)|;", "");
		char c = (char) Integer.parseInt(s);
		name1.append(c);
		}
		
		String s1 = null;
		while (m2.find())
		{
		s1 = m2.group(0);
		s1 = s1.replaceAll("(&#)|;", "");
		char c2 = (char) Integer.parseInt(s1);
		selfdescn1.append(c2);
		}
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
		

		
		
		
		UserDao userdao =new UserDaoImpl();
<<<<<<< HEAD
		User user=userdao.queryById(Phonenumber);
=======
		User user=userdao.queryById(Integer.parseInt(id));
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
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
<<<<<<< HEAD
//				user.setId(Integer.parseInt(id));
				user.setName(name);
				user.setSelfdescn(selfdescn);
				user.setPassword(password);
				user.setPhonenumber(Phonenumber);
				user.setBackPassTip(backPassTip);
=======
				user.setId(Integer.parseInt(id));
				user.setName(name1.toString());
				user.setSelfdescn(selfdescn1.toString());
				user.setPassword(password);
				user.setPhonenumber(Phonenumber);
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
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
