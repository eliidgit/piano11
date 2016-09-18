package com.jfinalshiromh.module.homework;

import com.jfinal.upload.UploadFile;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.Result;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "homework")
public class HomeworkController extends BaseController {


    public void upload(){

        UploadFile uploadFile = getFile("video-upload", Constants.UPLOAD_DIR_VIDEO);
        String path = Constants.UPLOAD_DIR_ROOT + Constants.UPLOAD_DIR_VIDEO+ "/" + uploadFile.getFileName();
        String realPath = Constants.UPLOAD_DIR + "/video/" + uploadFile.getFileName();
        renderJson( new Result("200","success",path));
    }



    
    public void uploadPics() throws Exception{
        String picsName = getPara("pics_name","");
        if (!StrUtil.isBlank(picsName)) {
            UploadFile uploadFile = getFile(picsName, Constants.UPLOAD_DIR_HOMEWORK);
            String path = Constants.UPLOAD_DIR_ROOT + Constants.UPLOAD_DIR_HOMEWORK + "/" + uploadFile.getFileName();

            
            
            
            renderJson(new Result("200", "success", path));
        }else{
            error("pics_name参数为空");
        }
    }

    

    
    public void uploadOgg() throws Exception{
        String oggName = getPara("ogg_name","");
        if (!StrUtil.isBlank(oggName)) {
            UploadFile uploadFile = getFile(oggName, Constants.UPLOAD_DIR_HOMEWORK);
            String path = Constants.UPLOAD_DIR_ROOT + Constants.UPLOAD_DIR_HOMEWORK + "/" + uploadFile.getFileName();

            
            
            
            renderJson(new Result("200", "success", path));
        }else{
            error("ogg_name参数为空");
        }
    }


}
