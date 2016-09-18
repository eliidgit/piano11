package com.jfinalshiromh.module.school.piano;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.module.school.School;
import com.jfinalshiromh.module.school.piano.classroom.Classroom;
import com.jfinalshiromh.module.school.piano.malfunction.PianoMalfunction;
import com.jfinalshiromh.module.school.piano.malfunction.detail.PianoMalfunctionDetail;
import com.jfinalshiromh.module.user.User;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;
@ControllerBind(controllerKey = "/admin/piano", viewPath = "/page/admin/piano")
public class PianoAdminController extends BaseController {
    public void index() {
    	try {
	    	List<School> schools = School.me.getAll();
			setAttr("schools", schools);
			Integer schoolId= getParaToInt("schoolId",-1);
			setAttr("schoolId", schoolId);
			setAttr("page",Piano.me.page(getParaToInt("p", 1), 10,schoolId));
		} catch (Exception e) {
			e.printStackTrace();
		}
		render("index.ftl");
    }
    public  void mal(){
    	Integer schoolId= getParaToInt("schoolId",-1);
		setAttr("schoolId", schoolId);
    	setAttr("page",PianoMalfunction.me.page(getParaToInt("p", 1), 10, schoolId));
    	List<School> schools = School.me.getAll();
		setAttr("schools", schools);
    	render("mal.ftl");
    }
    public void delMal(){
    	try {
			Integer id = getParaToInt("id");
			if (!StrUtil.checkParamIsNotNull(id)) {
				error("ID不能为空");
				return;
			}
			if (PianoMalfunction.me.deleteById(id)) {
				success();
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("删除失败");
    }
    
    public void del(){
    	try {
			Integer id = getParaToInt("id");
			if (!StrUtil.checkParamIsNotNull(id)) {
				error("ID不能为空");
				return;
			}
			if (Piano.me.deleteById(id)) {
				success();
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	error("删除失败");
    }
    public void detail(){
    	System.out.println("==============");
    	try {
			if (Constants.GET.equalsIgnoreCase(this.getRequest().getMethod())) {
				Integer id = getParaToInt("id");
				Integer pid = getParaToInt("pid");
				String	piano_id = getPara("piano_id");
				if(!StrUtil.checkParamIsNotNull(id,pid,piano_id)){
					error("参数不能为空不能为空！");
					return;
				}
				List<PianoMalfunctionDetail> detail = PianoMalfunctionDetail.me
						.getAllByMalId(id);
				setAttr("detail", detail);
				setAttr("id", id);
				setAttr("pid", pid);
				setAttr("piano_id", piano_id);
				render("detail.ftl");
			} else {
				if(getModel(PianoMalfunctionDetail.class).save()){
					Integer pid = getParaToInt("pid");
					if("1".equals(getPara("type"))){
						Piano.me.updateStatus("2", pid);
						PianoMalfunction.me.updateStatus("2", getParaToInt("pianoMalfunctionDetail.mal_id"));
					}else{
						PianoMalfunction.me.updateStatus("3", getParaToInt("pianoMalfunctionDetail.mal_id"));
						Piano.me.updateStatus("1", pid);
					}
					redirect("/admin/piano/mal");
				}else{
					setAttr("error", "保存失败");
					render("detail.ftl");
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			setAttr("error", "保存失败");
			render("detail.ftl");
		}
    }
    
    

}
