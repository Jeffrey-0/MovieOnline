package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

<<<<<<< HEAD
import model.Resource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import servlet.JDBCUtils;
=======
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
import utils.JdbcUtils;

import dao.UserDao;
import model.User;

public class UserDaoImpl implements UserDao {

	@Override
<<<<<<< HEAD
	public User queryByIdAndPwd(String number, String password) {
=======
	public User queryByIdAndPwd(int id, String password) {
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522

		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtils.getConnection();
<<<<<<< HEAD
			String sql = "select * from user where user_number=? and user_password=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, number);
=======
			String sql = "select * from user where user_id=? and user_password=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, id);
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
			prepareStatement.setString(2, password);
			ResultSet resultset = prepareStatement.executeQuery();
			if(resultset.next()) {			
				String name = resultset.getString("user_name");
				String speak = resultset.getString("user_speak");
<<<<<<< HEAD
				int id = resultset.getInt("user_id");
				User user = new User(id, name,speak);
=======
				User user = new User(id, name,speak);
				user.setId(id);
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
				return user;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(connection, prepareStatement, null);
		}
		return null;
	
	}

	@Override
	public void save(User user) {
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtils.getConnection();
<<<<<<< HEAD
			String sql = "insert into user (user_name,user_password,user_selfdescn,user_speak,user_number,back_pass_tip) value(?,?,?,?,?,?)";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, user.getName());
			prepareStatement.setString(3, user.getSelfdescn());
			prepareStatement.setString(2, user.getPassword());
			prepareStatement.setInt(4, 1);
			prepareStatement.setString(5,user.getPhonenumber());
			prepareStatement.setString(6,user.getBackPassTip());
=======
			String sql = "insert into user (user_id,user_name,user_password,user_selfdescn,user_speak,user_number) value(?,?,?,?,?,?)";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, user.getId());
			prepareStatement.setString(2, user.getName());
			prepareStatement.setString(4, user.getSelfdescn());
			prepareStatement.setString(3, user.getPassword());
			prepareStatement.setInt(5, 1);
			prepareStatement.setString(6,user.getPhonenumber());
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
			prepareStatement.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(connection, prepareStatement, null);
		}		
	}

	@Override
<<<<<<< HEAD
	public User queryById(String Phonenumber) {
=======
	public User queryById(int id) {
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
		Connection connection = null;
		PreparedStatement prepareStatement = null;
		try {
			connection = JdbcUtils.getConnection();
<<<<<<< HEAD
			String sql = "select * from user where user_number=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1,Phonenumber );
			ResultSet resultset = prepareStatement.executeQuery();
			if(resultset.next()) {
			
				return new User();
=======
			String sql = "select * from user where user_id=?";
			prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setInt(1, id);
			ResultSet resultset = prepareStatement.executeQuery();
			if(resultset.next()) {
			
				return new User(id);
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtils.close(connection, prepareStatement, null);
		}
		return null;
	}
<<<<<<< HEAD
	JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
	@Override
	public User queryByNumAndTip(String number,String backPassTip) {
		String sql = "select * from user where user_number = ? and back_pass_tip=?";
		try {
			return template.queryForObject(sql, new BeanPropertyRowMapper<>(User.class),number,backPassTip);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int modifyPassword(String number,String password) {
		String sql = "update user set user_password = ? where user_number = ?";
		int update = template.update(sql, password, number);
		return update;
	}
=======
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522

}
