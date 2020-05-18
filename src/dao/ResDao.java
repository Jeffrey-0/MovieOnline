package dao;

import com.alibaba.fastjson.JSON;
import model.Resource;
import org.junit.Test;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import servlet.JDBCUtils;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ResDao {
    JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    /**
     * 查询最新的五条数据
     *
     * @return String，JSON格式
     */
    public String queryNewRes() {
        String sql = "select * from src order by id desc limit 5 ";
        List<Resource> resourceList = template.query(sql, new BeanPropertyRowMapper<>(Resource.class));
        return JSON.toJSONString(resourceList);
    }

    /**
     * 查询随机的五条数据
     *
     * @return String，JSON格式
     */
    public String queryRanRes(Integer num) {
        String sql = "SELECT * FROM src ORDER BY RAND() LIMIT ?";
        List<Resource> resourceList = template.query(sql, new BeanPropertyRowMapper<>(Resource.class),num);
        return JSON.toJSONString(resourceList);
    }

    /**
     * 通过id查询资源
     *
     * @param id String
     * @return String, 对象的JSON数据
     */

    public String queryResById(String id, int num) {
        String sql = "SELECT * FROM src where id=?";
        Resource resource = template.queryForObject(sql, new BeanPropertyRowMapper<>(Resource.class), id);
        resource.setNum(this.getNum(resource.getCode()));
        resource.setCode(this.getUrl(resource.getCode(),num));
        return JSON.toJSONString(resource);
    }

    public String queryResByName(String search, String page) {
        String sql = "SELECT * FROM src where name like '%" + search + "%' limit " + (Integer.parseInt(page) - 1) * 10 + ",10";
        List<Resource> resourceList = template.query(sql, new BeanPropertyRowMapper<>(Resource.class));
        return JSON.toJSONString(resourceList);
    }

    public Integer querySearchPages(String search) {
        String sql = "SELECT count(id) FROM src where name like '%" + search + "%'";
        Integer count = template.queryForObject(sql, Integer.class);
        return (count / 11) + 1;
    }

    public String queryResByCategory(String search, String page) {
        String sql = "SELECT * FROM src where category=? limit " + (Integer.parseInt(page) - 1) * 10 + ",10";
        List<Resource> resourceList = template.query(sql, new BeanPropertyRowMapper<>(Resource.class), search);
        return JSON.toJSONString(resourceList);
    }

    public Integer queryCategoryPages(String search) {
        String sql = "SELECT count(id) FROM src where category=?";
        Integer count = template.queryForObject(sql, Integer.class, search);
        return (count / 11) + 1;
    }

    public String queryAllRes(String search, String page) {
        String sql = "SELECT * FROM src limit " + (Integer.parseInt(page) - 1) * 10 + ",10";
        List<Resource> resourceList = template.query(sql, new BeanPropertyRowMapper<>(Resource.class));
        return JSON.toJSONString(resourceList);
    }

    public Integer queryAllPages(String search) {
        String sql = "SELECT count(id) FROM src";
        Integer count = template.queryForObject(sql, Integer.class);
        return (count / 11) + 1;
    }

    public String queryResIndexCategory(String search) {
        String sql = "SELECT * FROM src where category = ? ORDER BY RAND() LIMIT 5";
        List<Resource> resourceList = template.query(sql, new BeanPropertyRowMapper<>(Resource.class), search);
        return JSON.toJSONString(resourceList);
    }

    public String queryResByUserId(Integer userId, String page) {
        String sql = "SELECT * FROM src where uploader=? limit " + (Integer.parseInt(page) - 1) * 10 + ",10";
        List<Resource> resourceList = template.query(sql, new BeanPropertyRowMapper<>(Resource.class), userId);
        return JSON.toJSONString(resourceList);
    }

    public Integer queryUserPages(Integer userId) {
        String sql = "SELECT count(id) FROM src where uploader=?";
        Integer count = template.queryForObject(sql, Integer.class, userId);
        return (count / 11) + 1;
    }

    public Integer deleteById(String id) {
        String sql = "delete from src where id=?";
        return template.update(sql, id);
     }
     @Test
     public void test1(){
        //获取集数
        String url = "123;234;345;234;345;234;345;234;345;234;345;234;345;";
         int num = this.getNum(url);
         System.out.println(num);
         for (int i = 0; i < num;i++){
             String url1 = this.getUrl(url, i+1);
             System.out.println(url1);
         }

     }
    //给定url字符串，求第num-1到num个分号之间的字符
    //123;234;345;
     public String getUrl(String url,int num){
         if (num == 1) {
             int num2 = this.getCharacterPosition(url,num);
             return url.substring(0,num2);
         }
        int num1 = this.getCharacterPosition(url,num-1);
        int num2 = this.getCharacterPosition(url,num);
       return url.substring(num1+1,num2);
    }
    //根据分号个数确定有多少集
    public Integer getNum(String url){
        //这里是获取"/"符号的位置
        Matcher slashMatcher = Pattern.compile(";").matcher(url);
        int mIdx = 0;
        while(slashMatcher.find()) {
            mIdx++;
        }
        if (mIdx == 0) {
            mIdx=1;
        }
        return mIdx;
    }
    //找到第n個字符的下標
    public  int getCharacterPosition(String string,int num){
        //这里是获取"/"符号的位置
        Matcher slashMatcher = Pattern.compile(";").matcher(string);
        int mIdx = 0;
        while(slashMatcher.find()) {
            mIdx++;
            //当"/"符号第三次出现的位置
            if(mIdx == num){
                break;
            }
        }
        if (mIdx==0){
            return string.length();
        }
        return slashMatcher.start();
    }
}
