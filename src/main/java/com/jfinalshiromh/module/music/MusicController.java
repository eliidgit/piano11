package com.jfinalshiromh.module.music;

import com.jfinal.upload.UploadFile;
import com.jfinalshiromh.common.BaseController;
import com.jfinalshiromh.common.Constants;
import com.jfinalshiromh.utils.Result;
import com.jfinalshiromh.utils.StrUtil;
import com.jfinalshiromh.utils.ext.route.ControllerBind;


@ControllerBind(controllerKey = "/music")
public class MusicController extends BaseController {


    public void upload(){

        UploadFile uploadFile = getFile("video-upload", Constants.UPLOAD_DIR_VIDEO);
        String path = Constants.UPLOAD_DIR_ROOT + Constants.UPLOAD_DIR_VIDEO+ "/" + uploadFile.getFileName();
        String realPath = Constants.UPLOAD_DIR + "/video/" + uploadFile.getFileName();
        renderJson( new Result("200","success",path));
    }

    
    public void uploadStave() throws Exception{
        String picName = getPara("pic_name","");
        if (!StrUtil.isBlank(picName)) {
            UploadFile uploadFile = getFile(picName, Constants.UPLOAD_DIR_STAVE);
            String path = Constants.UPLOAD_DIR_ROOT + Constants.UPLOAD_DIR_STAVE + "/" + uploadFile.getFileName();

            
            
            renderJson(new Result("200", "success", path));
        }else{
            error("pic_name参数为空");
        }
    }


    
    public void uploadMidi() throws Exception{
        String midiName = getPara("midi_name","");
        if (!StrUtil.isBlank(midiName)) {
            UploadFile uploadFile = getFile(midiName, Constants.UPLOAD_DIR_MIDI);
            String path = Constants.UPLOAD_DIR_ROOT + Constants.UPLOAD_DIR_MIDI + "/" + uploadFile.getFileName();

            
            
            
            renderJson(new Result("200", "success", path));
        }else{
            error("midi_name参数为空");
        }
    }

    
    public void uploadOgg() throws Exception{
        String oggName = getPara("ogg_name","");
        if (!StrUtil.isBlank(oggName)) {
            UploadFile uploadFile = getFile(oggName, Constants.UPLOAD_DIR_OGG);
            String path = Constants.UPLOAD_DIR_ROOT + Constants.UPLOAD_DIR_OGG + "/" + uploadFile.getFileName();

            
            
            
            renderJson(new Result("200", "success", path));
        }else{
            error("ogg_name参数为空");
        }
    }

    
    public void uploadTxta() throws Exception{
        String oggName = getPara("txt_a_name","");
        if (!StrUtil.isBlank(oggName)) {
            UploadFile uploadFile = getFile(oggName, Constants.UPLOAD_DIR_TXT);
            String path = Constants.UPLOAD_DIR_ROOT + Constants.UPLOAD_DIR_TXT + "/" + uploadFile.getFileName();

            
            
            
            renderJson(new Result("200", "success", path));
        }else{
            error("txt_a_name参数为空");
        }
    }

    
    public void uploadTxtb() throws Exception{
        String oggName = getPara("txt_b_name","");
        if (!StrUtil.isBlank(oggName)) {
            UploadFile uploadFile = getFile(oggName, Constants.UPLOAD_DIR_TXT);
            String path = Constants.UPLOAD_DIR_ROOT + Constants.UPLOAD_DIR_TXT + "/" + uploadFile.getFileName();

            
            
            
            renderJson(new Result("200", "success", path));
        }else{
            error("txt_b_name参数为空");
        }
    }


}
