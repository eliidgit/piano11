package com.jfinalshiromh.module.music;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.course.Course;
import com.jfinalshiromh.module.course.coursepart.Coursepart;
import com.jfinalshiromh.module.course.coursepart.po.TreeViewNode;

import com.jfinalshiromh.module.music.tone.Tone;

import com.jfinalshiromh.utils.ext.route.ControllerBind;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


@ControllerBind(controllerKey = "/admin/music", viewPath = "/page/admin/music")
public class MusicAdminController extends BaseController {

    private static Logger LOGGER = LoggerFactory.getLogger(MusicAdminController.class);

    public void index() {
        String name = getPara("name");
        setAttr("page", Music.me.page(getParaToInt("p", 1), defaultPageSize(), name));
        setAttr("name", name);
        render("index.ftl");
    }

    public void add() {

        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            List<Tone> tones = Tone.me.getAllParentTone();
            setAttr("tones", tones);
            render("add.ftl");
        } else {
            if (method.equalsIgnoreCase(Constants.POST)) {
                
                
             if (getModel(Music.class, "music").save())
                    redirect("/admin/music");
                else
                    redirect("/admin");
            }
        }
    }

    /*
 public void edit() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            List<Tone> tones = Tone.me.getAllParentTone();
            setAttr("tones", tones);
            render("edit.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {
            
            

            if (getModel(Music.class, "music").update())
                redirect("/admin/music");
            else
                redirect("/admin");
        }
    }
*/


    public void edit() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)) {
            int id = getParaToInt(0,-1);
            int  toneId=Music.me.getToneIdById(id);
            int  parentId=Tone.me.getParentIdByToneId(toneId);
            int course_part_id= Music.me.getCoursePartIdById(id);
            String course_part_name=Coursepart.me.getNameById(course_part_id);
            String toneName=Tone.me.getToneNameByToneId(toneId);

            List<Tone> tones = Tone.me.getAllParentTone();
            if (parentId!=0){
                List<Tone> child_tones = Tone.me.getByParentId(parentId);

                setAttr("child_tones",child_tones);
            }else{

                setAttr("child_tones",null);
            }

            String parentName=Tone.me.getParentNameByParentId(parentId);

            setAttr("tone_id",toneId);
            setAttr("parent_tone_id",parentId);
            setAttr("course_part_id",course_part_id);
            setAttr("parent_name",parentName);
            setAttr("tone_name",toneName);
            setAttr("part_name",course_part_name);
            setAttr("tones", tones);

            setAttr("music", Music.me.findById(getParaToInt(0, -1)));

            render("edit.ftl");
        } else if (method.equalsIgnoreCase(Constants.POST)) {

            if (getModel(Music.class, "music").update())
                redirect("/admin/music");
            else
                redirect("/admin");
        }
    }


    @Before(Tx.class)
    public void delete() {
        int id = getParaToInt("music_id", -1);
        if (id != -1) {
            Music music = Music.me.findById(id);
            String realPath = getRequest().getServletContext().getRealPath("/");
            System.out.println(realPath);
            String stavePath = realPath + music.getStr("stave_path");
            String midiPath = realPath + music.getStr("midi_path");
            String oggPath = realPath + music.getStr("ogg_path");
            String txtaPath = realPath + music.getStr("txt_a");
            String txtbPath = realPath + music.getStr("txt_b");
            File staveFile = new File(stavePath);
            File midiFile = new File(midiPath);
            File oggFile = new File(oggPath);
            File txtaFile = new File(txtaPath);
            File txtbFile = new File(txtbPath);
            Music.me.deleteById(id);
            
            if(staveFile.exists()){
                staveFile.delete();
            }
            if(midiFile.exists()){
                midiFile.delete();
            }
            if(oggFile.exists()){
                oggFile.delete();
            }
            if(txtaFile.exists()){
                txtaFile.delete();
            }
            if(txtbFile.exists()){
                txtbFile.delete();
            }
            success("删除成功！");
        } else {
            error("音乐ID不正确");
        }

    }

    public void info() {
        int id = getParaToInt(0,-1);
        int course_part_id= Music.me.getCoursePartIdById(id);
        int  toneId=Music.me.getToneIdById(id);
        int  parentId=Tone.me.getParentIdByToneId(toneId);
        String course_part_name=Coursepart.me.getNameById(course_part_id);
        String parentName=Tone.me.getParentNameByParentId(parentId);
        String toneName=Tone.me.getToneNameByToneId(toneId);
        if(id != -1){
            Music music = Music.me.findById(id);
            if (music != null) {
                setAttr("part_name",course_part_name);
                setAttr("tone_name",toneName);
                setAttr("parent_name",parentName);
                setAttr("music", music);
                render("info.ftl");
            }else{
                LOGGER.error("根据ID查询的音乐不存在"+id);
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
                TreeViewNode partNode = Coursepart.me.getNodeById(partId, false,Constants.PART_TYPE_RESOURCE_MUSIC);
                partViewList.add(partNode);
            }
            courseNode.setNodes(partViewList);
            
        }
        success(re);
    }

    public void getChildTonesByParentId(){
        Integer parentId = getParaToInt("parentId");
        List<Tone> tones = Tone.me.getAllChildToneByParentId(parentId);
        success(tones);
    }


}
