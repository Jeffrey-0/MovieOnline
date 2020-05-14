package dao;

import model.User;

public interface UserDao {
<<<<<<< HEAD
	User queryByIdAndPwd(String number, String password);
	void save(User user);
	User queryById(String Phonenumber);

	User queryByNumAndTip(String number,String backPassTip);

	int modifyPassword(String number,String password);
=======
	User queryByIdAndPwd(int id, String password);	
	void save(User user);
	User queryById(int id);
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
}
