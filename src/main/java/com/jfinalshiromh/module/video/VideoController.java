package com.jfinalshiromh.module.video;

import com.jfinal.upload.UploadFile;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.BaseModel;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.Result;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


 @ControllerBind(controllerKey = "/video")
public class VideoController extends BaseController {


    public void upload(){

        UploadFile uploadFile = getFile("video-upload", Constants.UPLOAD_DIR_VIDEO,1024*1024*100);
        String path = "/static/upload/" + Constants.UPLOAD_DIR_VIDEO+ "/" + uploadFile.getFileName();
        String realPath = Constants.UPLOAD_DIR + "/video/" + uploadFile.getFileName();
        renderJson( new Result("200","success",path));
    }

    
    public void uploadPic() throws Exception{
        String picName = getPara("pic_name","");
        if (!StrUtil.isBlank(picName)) {
            UploadFile uploadFile = getFile(picName, Constants.UPLOAD_DIR_PIC);
            String path = "/static/upload/" + Constants.UPLOAD_DIR_PIC + "/" + uploadFile.getFileName();

            
            String realPath = Constants.UPLOAD_DIR + "/pic/" + uploadFile.getFileName();
            
            renderJson(new Result("200", "success", path));
        }else{
            error("pic_name参数为空");
        }
    }


}
