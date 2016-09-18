package com.jfinalshiromh.module.demolesson;

import com.jfinal.kit.JsonKit;
import com.jfinal.upload.UploadFile;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.ImageUtil;
import com.jfinalshiromh.utils.Result;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


 @ControllerBind(controllerKey = "/demolesson",viewPath = "page/school/demolesson")
public class DemolessonController extends BaseController {

    public void index(){
        render("index.ftl");
    }

    public void upload(){

        UploadFile uploadFile = getFile("video-upload", Constants.UPLOAD_DIR_VIDEO);
        String path = "/static/upload/" + Constants.UPLOAD_DIR_VIDEO+ "/" + uploadFile.getFileName();
        String realPath = Constants.UPLOAD_DIR + "/video/" + uploadFile.getFileName();
        renderJson( new Result("200","success",path));
    }

    
    public void uploadPic() throws Exception{
        UploadFile uploadFile = getFile("pic-upload", Constants.UPLOAD_DIR_PIC);
        String path = "/static/upload/" + Constants.UPLOAD_DIR_PIC+ "/" + uploadFile.getFileName();

        
        String realPath = Constants.UPLOAD_DIR + "/pic/" + uploadFile.getFileName();
        
        renderJson( new Result("200","success",path));
    }

}
