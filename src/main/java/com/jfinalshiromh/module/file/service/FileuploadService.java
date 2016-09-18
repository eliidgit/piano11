package com.jfinalshiromh.module.file.service;


import com.jfinalshiromh.module.file.domain.UploadFile;

import java.util.List;


public interface FileuploadService {
    public List<UploadFile> getFiles(String uploadPath, Integer maxPostSize, String encoding);

    public UploadFile getFile(String parameterName, String uploadPath, Integer maxPostSize, String encoding);

    public List<UploadFile> getFiles(String uploadPath, int maxPostSize);

    
    public UploadFile getFile(String parameterName, String uploadPath, int maxPostSize) ;

    public List<UploadFile> getFiles(String uploadPath) ;

    public UploadFile getFile(String parameterName, String uploadPath);

    public List<UploadFile> getFiles();

    public UploadFile getFile();

    public UploadFile getFile(String parameterName);
}
