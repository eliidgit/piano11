package com.jfinalshiromh.module.user;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.interceptor.UserInterceptor;
import com.jfinalshiromh.utils.ImageUtil;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;

import java.util.List;


@ControllerBind(controllerKey = "/user", viewPath = "page")
public class UserController extends BaseController {

    public void index() {








    }

    public void collects() {
        /*
        String uid = getPara(0);
        User user = User.me.findById(uid);
        if (user == null) {
            renderText(Constants.OP_ERROR_MESSAGE);
        } else {
            setAttr("current_user", user);
            Page<Collect> collectPage = Collect.me.findByAuthorIdWithTopic(getParaToInt("p", 1),
                    defaultPageSize(), user.getStr("id"));
            setAttr("page", collectPage);
            render("front/user/collects.ftl");
        }
        */
    }

    public void topics() {
        /*
        String uid = getPara(0);
        User user = User.me.findById(uid);
        if (user == null) {
            renderText(Constants.OP_ERROR_MESSAGE);
        } else {
            setAttr("current_user", user);
            Page<Topic> page = Topic.me.paginateByAuthorId(getParaToInt("p", 1),
                    defaultPageSize(), user.getStr("id"));
            setAttr("page", page);
            render("front/user/topics.ftl");
        }
        */
    }

    public void replies() {
        /*
        String uid = getPara(0);
        User user = User.me.findById(uid);
        if (user == null) {
            renderText(Constants.OP_ERROR_MESSAGE);
        } else {
            setAttr("current_user", user);
            Page<Topic> myReplyTopics = Topic.me.paginateMyReplyTopics(getParaToInt("p", 1), defaultPageSize(), user.getStr("id"));
            setAttr("page", myReplyTopics);
            render("front/user/replies.ftl");
        }
        */
    }

    public void top100() {
        /*
        List<User> top100 = User.me.findBySize(100);
        setAttr("top100", top100);
        render("front/user/top100.ftl");
        */
    }

    @Before(UserInterceptor.class)
    public void message() {
        /*
        String uid = getPara(0);
        if (StrUtil.isBlank(uid)) renderText(Constants.OP_ERROR_MESSAGE);
        List<Notification> notifications = Notification.me.findNotReadByAuthorId(uid);
        setAttr("notifications", notifications);
        Page<Notification> oldMessages = Notification.me.paginate(getParaToInt("p", 1),
                defaultPageSize(), uid);
        setAttr("oldMessages", oldMessages);
        
        Notification.me.updateNotification(uid);
        render("front/user/message.ftl");
        */
    }

    @Before(UserInterceptor.class)
    public void setting() throws InterruptedException {

        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            setAttr("save", getPara("save"));
            render("front/user/setting.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            User user = getSessionAttr(Constants.USER_SESSION);
            String url = getPara("url");
            String nickname = getPara("nickname");
            if (!user.getStr("nickname").equalsIgnoreCase(nickname) && User.me.findByNickname(nickname) != null) {
                error("此昵称已被注册,请更换昵称");
            } else {
                if (!StrUtil.isBlank(url)) {
                    if (!url.substring(0, 7).equalsIgnoreCase("http://")) {
                        url = "http://" + url;
                    }
                }
                user.set("url", StrUtil.transHtml(url))
                        .set("nickname", StrUtil.noHtml(nickname).trim())
                        .set("signature", StrUtil.transHtml(getPara("signature"))).update();
                
                setSessionAttr(Constants.USER_SESSION, user);
                success();
            }
        }
    }

    @Before(UserInterceptor.class)
    public void cancelBind() {

























    }

    @Before(UserInterceptor.class)
    public void uploadAvatar() throws Exception {

        UploadFile uploadFile = getFile("avatar", Constants.UPLOAD_DIR_AVATAR);
        String path = "/static/upload/" + Constants.UPLOAD_DIR_AVATAR + "/" + uploadFile.getFileName();
        User user = (User) getSession().getAttribute(Constants.USER_SESSION);
        user.set("avatar", path).update();
        
        String realPath = Constants.UPLOAD_DIR + "/avatar/" + uploadFile.getFileName();
        ImageUtil.zoomImage(realPath, realPath, 100, 100);
        redirect("/user/setting");
    }

}
