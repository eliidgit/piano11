package com.jfinalshiromh.module.file.service.impl;


import com.jfinalshiromh.module.file.domain.MultipartRequest;
import com.jfinalshiromh.module.file.domain.UploadFile;
import com.jfinalshiromh.module.file.service.FileService;
import com.jfinalshiromh.module.file.service.FileuploadService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


 
public class FileuploadServiceImpl implements FileuploadService{

    private HttpServletRequest request;

    private FileuploadServiceImpl(){}

    public FileuploadServiceImpl(HttpServletRequest resquest) {
        this.request = resquest;
    }


    @Override
    public List<UploadFile> getFiles(String uploadPath, Integer maxPostSize, String encoding) {
        if (request instanceof MultipartRequest == false)
            request = new MultipartRequest(request, uploadPath, maxPostSize, encoding);
        return ((MultipartRequest)request).getFiles();
    }

    @Override
    public UploadFile getFile(String parameterName, String uploadPath, Integer maxPostSize, String encoding) {
        getFiles(uploadPath, maxPostSize, encoding);
        return getFile(parameterName);
    }

    @Override
    public List<UploadFile> getFiles(String uploadPath, int maxPostSize) {
        if (request instanceof MultipartRequest == false)
            request = new MultipartRequest(request, uploadPath, maxPostSize);
        return ((MultipartRequest)request).getFiles();
    }
    @Override
    public UploadFile getFile(String parameterName, String uploadPath, int maxPostSize) {
        getFiles(uploadPath, maxPostSize);
        return getFile(parameterName);
    }
    @Override
    public List<UploadFile> getFiles(String uploadPath) {
        if (request instanceof MultipartRequest == false)
            request = new MultipartRequest(request, uploadPath);
        return ((MultipartRequest)request).getFiles();
    }
    @Override
    public UploadFile getFile(String parameterName, String uploadPath) {
        getFiles(uploadPath);
        return getFile(parameterName);
    }
    @Override
    public List<UploadFile> getFiles() {
        if (request instanceof MultipartRequest == false)
            request = new MultipartRequest(request);
        return ((MultipartRequest)request).getFiles();
    }
    @Override
    public UploadFile getFile() {
        List<UploadFile> uploadFiles = getFiles();
        return uploadFiles.size() > 0 ? uploadFiles.get(0) : null;
    }
    @Override
    public UploadFile getFile(String parameterName) {
        List<UploadFile> uploadFiles = getFiles();
        for (UploadFile uploadFile : uploadFiles) {
            if (uploadFile.getParameterName().equals(parameterName)) {
                return uploadFile;
            }
        }
        return null;
    }
}
