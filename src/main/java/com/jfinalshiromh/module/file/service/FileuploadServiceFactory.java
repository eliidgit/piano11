package com.jfinalshiromh.module.file.service;

import com.jfinalshiromh.module.file.domain.OreillyCos;
import com.jfinalshiromh.module.file.service.impl.FileuploadServiceImpl;

import javax.servlet.http.HttpServletRequest;



public class FileuploadServiceFactory {

    
    public static FileuploadService createFileuploadService(String uploadBaseDir,HttpServletRequest request){

        
        OreillyCos.init(uploadBaseDir,1024*1024*100,"UTF-8");
        
        return new FileuploadServiceImpl(request);
    }
}
