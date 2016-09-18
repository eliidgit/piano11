package com.jfinalshiromh.module.file.domain;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.File;
import java.io.IOException;
import java.util.*;



public class MultipartRequest extends HttpServletRequestWrapper {
    private static String baseUploadPath;
    private static int maxPostSize;
    private static String encoding;
    static FileRenamePolicy fileRenamePolicy = new DefaultFileRenamePolicy();

    private List<UploadFile> uploadFiles;
    private com.oreilly.servlet.MultipartRequest multipartRequest;

    static void init(String baseUploadPath, int maxPostSize, String encoding) {
        MultipartRequest.baseUploadPath = baseUploadPath;
        MultipartRequest.maxPostSize = maxPostSize;
        MultipartRequest.encoding = encoding;
    }

    public MultipartRequest(HttpServletRequest request, String uploadPath, int maxPostSize, String encoding) {
        super(request);
        wrapMultipartRequest(request, getFinalPath(uploadPath), maxPostSize, encoding);
    }

    public MultipartRequest(HttpServletRequest request, String uploadPath, int maxPostSize) {
        super(request);
        wrapMultipartRequest(request, getFinalPath(uploadPath), maxPostSize, encoding);
    }

    public MultipartRequest(HttpServletRequest request, String uploadPath) {
        super(request);
        wrapMultipartRequest(request, getFinalPath(uploadPath), maxPostSize, encoding);
    }

    public MultipartRequest(HttpServletRequest request) {
        super(request);
        wrapMultipartRequest(request, baseUploadPath, maxPostSize, encoding);
    }

    
    private String getFinalPath(String uploadPath) {
        if (uploadPath == null) {
            throw new IllegalArgumentException("uploadPath can not be null.");
        }

        uploadPath = uploadPath.trim();
        if (uploadPath.startsWith("/") || uploadPath.startsWith("\\")) {
            if (baseUploadPath.equals("/")) {
                return uploadPath;
            } else {
                return baseUploadPath + uploadPath;
            }
        } else {
            return baseUploadPath + File.separator + uploadPath;
        }
    }

    private void wrapMultipartRequest(HttpServletRequest request, String uploadPath, int maxPostSize, String encoding) {
        File dir = new File(uploadPath);
        if ( !dir.exists()) {
            if (!dir.mkdirs()) {
                throw new RuntimeException("Directory " + uploadPath + " not exists and can not create directory.");
            }
        }






        uploadFiles = new ArrayList<UploadFile>();

        try {
            multipartRequest = new  com.oreilly.servlet.MultipartRequest(request, uploadPath, maxPostSize, encoding, fileRenamePolicy);
            Enumeration files = multipartRequest.getFileNames();
            while (files.hasMoreElements()) {
                String name = (String)files.nextElement();
                String filesystemName = multipartRequest.getFilesystemName(name);

                
                if (filesystemName != null) {
                    String originalFileName = multipartRequest.getOriginalFileName(name);
                    String contentType = multipartRequest.getContentType(name);
                   UploadFile uploadFile = new UploadFile(name, uploadPath, filesystemName, originalFileName, contentType);
                    if (isSafeFile(uploadFile))
                        uploadFiles.add(uploadFile);
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private boolean isSafeFile(UploadFile uploadFile) {
        String fileName = uploadFile.getFileName().trim().toLowerCase();
        if (fileName.endsWith(".jsp") || fileName.endsWith(".jspx")) {
            uploadFile.getFile().delete();
            return false;
        }
        return true;
    }

    public List<UploadFile> getFiles() {
        return uploadFiles;
    }

}
