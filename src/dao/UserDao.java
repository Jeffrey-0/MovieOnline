package dao;

import model.User;

public interface UserDao {

	User queryByIdAndPwd(String number, String password);
	void save(User user);
	User queryById(String Phonenumber);

	User queryByNumAndTip(String number,String backPassTip);

	int modifyPassword(String number,String password);

}
