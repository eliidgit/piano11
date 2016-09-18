
package com.jfinalshiromh.module.music.tone;

import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.music.tone.version.ToneVersion;

import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;

import static com.sun.tools.doclint.Entity.part;


@ControllerBind(controllerKey = "/admin/tone",viewPath = "/page/admin/tone")
public class ToneAdminController extends BaseController {

    public void index() {
        Integer parentId = getParaToInt("parent_id");
        String clientType = getPara("client_type","");
        String name = getPara("name");
        String englishName = getPara("english_name");
        
        
        setAttr("page", Tone.me.page(getParaToInt("p", 1), defaultPageSize(), name,englishName, parentId,clientType));
        setAttr("client_type", clientType);
        setAttr("name", name);
        setAttr("parent_id", parentId);
        setAttr("english_name", englishName);

        setAttr("parentTones",  Tone.me.getAllParentTone());
        render("index.ftl");

    }

    public void add() {

        int toneId  = getParaToInt("tone.tone_id",-1);
        int parentId  = getParaToInt("tone.parent_id",-1);
        String name = getPara("tone.name");
        String englishName = getPara("tone.english_name");
        String client_type =  getPara("tone.client_type");

        setAttr("parentTones", Tone.me.getAllParentTone());
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.GET)){
            render("add.ftl");
        } else if (Tone.me.checkToneIdisExist(toneId)!=null) {
            if (parentId==0) {
                renderText("不能给顶级音色手动添加ID，请置空ID");
            }
        }  else  if(!StrUtil.checkParamIsNotNull(name)){
            renderText("中文名不为空");
        }else  if(!StrUtil.checkParamIsNotNull(englishName)){
            renderText("英文名不为空");
        }else if (Tone.me.checkToneIdisExist(toneId)!=null){
            renderText("toneId已存在，请换一个");
        } else if (Tone.me.checkToneNameisExist(name)!=null){
            renderText("tonename已存在，请换一个");
        }else if (Tone.me.checkToneNameisExist(englishName)!=null){
            renderText("该英文名字已存在，请换一个");

        } else if (getModel(Tone.class, "tone").save()) {

            if(client_type!=null) {
                ToneVersion.me.updateByType(client_type);
            }

            System.out.println("toneId+++==" + toneId);
            System.out.println("name+++==" + name);
            System.out.println("client_type+++==" + client_type);
            redirect("/admin/tone");

        }

    }



    public void edit() {

        int toneId  = getParaToInt("tone.id",-1);
        int parentId  = getParaToInt("tone.parent_id",-1);

        String method = getRequest().getMethod();
        String name = getPara("tone.name");
        String englishName = getPara("tone.english_name");
        setAttr("parentTones", Tone.me.getAllParentTone());
        if (method.equalsIgnoreCase(Constants.GET)) {
            int id = getParaToInt(0,-1);
            if (id != -1) {
                Tone tone = Tone.me.findById(id);

                if (null != tone) {
                    setAttr("tone", tone);
                    render("edit.ftl");
                }
            }else{
                redirect("/admin/tone");
            }
        } else {
            if (Tone.me.checkToneIdisExist(toneId)!=null) {
                if (parentId==0) {
                    renderText("不能给顶级音色手动添加ID，请置空ID");
                }
            }else  if(!StrUtil.checkParamIsNotNull(name)){
                error("中文名不为空");return;
            }
            else  if(!StrUtil.checkParamIsNotNull(englishName)){
                error("英文名不为空");return;
            }

            else if(parentId<0){
                renderText("请选择音色属性！");
            }else if (Tone.me.checkToneIdisExist(toneId)!=null){
                renderText("该音色ID已经存在已存在，请换一个");
            } else if (getModel(Tone.class, "tone").update()) {
                String client_type =  getPara("tone.client_type");
                if(client_type!=null) {
                    ToneVersion.me.updateByType(client_type);
                }
                redirect("/admin/tone");
            }else {
                redirect("/admin/tone");
            }
        }
    }

    public void delete() {
        int id = getParaToInt("id", -1);

        String client_type =  getPara("client_type");
        if (id != -1 ) {
            if (Tone.me.deleteById(id)) {
                if(client_type!=null) {
                    ToneVersion.me.updateByType(client_type);
                }

                success("删除分类成功");
            }
            return;
        }
        error("ID有误");

    }

    public void info() {
        int id = getParaToInt(0, -1);

        if (id != -1) {
            Tone tone = Tone.me.findById(id);
            if (null != tone) {
                setAttr("tone", tone);
                int parent_id = tone.getInt("parent_id");
                setAttr("parentName", Tone.me.getParentNameByParentId(parent_id));

                render("info.ftl");
            } else {
                renderError(500);
            }
        }

    }

    public void gettone(){
        success(Tone.me.getAllParentTone());
    }


}
