package test.com.news;

import com.news.dao.impl.RoleDaoImpl;
import com.news.model.Role;

import java.util.List;

public class RoleTest {
    public static void main(String[] args) {
        RoleDaoImpl dao = new RoleDaoImpl();
        List<Role> roleList = dao.getAll();
        System.out.println(roleList.toString());
    }
}
