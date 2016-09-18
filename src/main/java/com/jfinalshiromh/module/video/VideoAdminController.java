package com.jfinalshiromh.module.video;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.course.Course;
import com.jfinalshiromh.module.course.coursepart.Coursepart;
import com.jfinalshiromh.module.course.coursepart.po.TreeViewNode;
import com.jfinalshiromh.module.demolesson.Demolesson;
import com.jfinalshiromh.module.music.Music;
import com.jfinalshiromh.utils.ext.route.ControllerBind;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


@ControllerBind(controllerKey = "/admin/video", viewPath = "/page/admin/video")
public class VideoAdminController extends BaseController {

    private static Logger LOGGER = LoggerFactory.getLogger(VideoAdminController.class);

    public void index() {
        String name = getPara("name");
        String authorName = getPara("author_name");
        setAttr("page", Video.me.page(getParaToInt("p", 1), defaultPageSize(), name, authorName));
        setAttr("name", name);
        setAttr("author_name", authorName);
        render("index.ftl");
    }

    public void add() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            render("add.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            
            

            if (getModel(Video.class, "video").save())
                redirect("/admin/video");
            else
                redirect("/admin");
        }
    }


    public void edit() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)){
            int id = getParaToInt(0,-1);
            int course_part_id= Video.me.getCoursePartIdById(id);
            String course_part_name=Coursepart.me.getNameById(course_part_id);
            setAttr("part_name",course_part_name);
            System.out.println("course_part_name===="+course_part_name);

            setAttr("video", Video.me.findById(getParaToInt(0, -1)));
            render("edit.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            getModel(Video.class, "video").update();
            redirect("/admin/video");
        }

    }

    @Before(Tx.class)
    public void delete() {
        int id = getParaToInt("video_id", -1);
        if (id != -1) {
            Video video = Video.me.findById(id);
            String realPath = getRequest().getServletContext().getRealPath("/");
            String videoPath = realPath + video.getStr("path");
            String authorAvatar = realPath + video.getStr("author_avatar");
            String picPath = realPath + video.getStr("pic_path");
            File videoFile = new File(videoPath);
            File avatarFile = new File(authorAvatar);
            File picFile = new File(picPath);
            if (videoFile.exists()
                    && avatarFile.exists()
                    && picFile.exists()) {
                if (videoFile.delete()
                        && avatarFile.delete()
                        && picFile.delete()
                        && Video.me.deleteById(id))
                    success("删除成功");
                else
                    error("删除失败");
            } else {
                error("视频文件不存在");
            }

            
            
        } else {
            error("视频ID不正确");
        }

    }

    public void info() {
        int id = getParaToInt(0,-1);
        if(id != -1){
            Video video = Video.me.findById(id);
            if (video != null) {
                setAttr("video_path", video.getStr("path"));
                render("info.ftl");
            }else{
                LOGGER.error("根据ID查询的视频不存在"+id);
                renderError(500);
            }
        }else{
            LOGGER.error("前台ID未获取到"+id);
            renderError(500);
        }
    }

    
    public void treeViewData() {
        List<TreeViewNode> re = new ArrayList<TreeViewNode>();
        
        List<Course> courseList = Course.me.list();
        for (Course course : courseList
                ) {
            
            int courseId = course.getInt("id");
            TreeViewNode courseNode = new TreeViewNode();
            re.add(courseNode);
            courseNode.setText(course.getStr("name"));
            courseNode.setHref("-1");
            
            List<Coursepart> firstChannelList = Coursepart.me.getFirstPartByCid(courseId);

            List<TreeViewNode> partViewList = new ArrayList<TreeViewNode>();

            for (Coursepart part : firstChannelList
                    ) {
                int partId = part.getInt("id");
                TreeViewNode partNode = Coursepart.me.getNodeById(partId, false,Constants.PART_TYPE_RESOURCE_VIDEO);
                partViewList.add(partNode);
            }
            courseNode.setNodes(partViewList);
            
        }
        success(re);
    }


}
