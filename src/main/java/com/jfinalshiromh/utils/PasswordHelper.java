package com.jfinalshiromh.utils;

import com.jfinalshiromh.module.user.AdminUser;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;


 
public class PasswordHelper {
    private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();

    private String algorithmName = "md5";
    private final int hashIterations = 2;

    public void encryptPassword(AdminUser adminUser) {

        String salt = randomNumberGenerator.nextBytes().toHex();
        System.out.println("salt: " + salt);

        adminUser.set("salt", salt);

        String newPassword = new SimpleHash(
                algorithmName,
                adminUser.getStr("password"),
                ByteSource.Util.bytes(adminUser.getStr("username") + adminUser.getStr("salt")),
                hashIterations).toHex();

        adminUser.set("password", newPassword);
    }

    public static void main(String[] args) {
        AdminUser adminUser = new AdminUser();
        adminUser.set("username", "admin")
                .set("password", "123123");
        PasswordHelper passwordHelper = new PasswordHelper();
        passwordHelper.encryptPassword(adminUser);
        System.out.println(adminUser.get("password"));
    }
}
