package com.booking.controllers;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.booking.payload.UploadFileResponse;
import com.booking.property.FileStorageProperties;
import com.booking.services.FileStorageService;

@RestController
@RequestMapping("/file")
@CrossOrigin(origins="*", allowedHeaders = "*")
public class FileController {

    private static final Logger logger = LoggerFactory.getLogger(FileController.class);
    
    @Autowired
    FileStorageService fileStorageService;
    
    @Autowired
    FileStorageProperties fileStorageProperties;
    
    @PostMapping("/upload")
    public UploadFileResponse uploadFile(@RequestParam("file") MultipartFile file) {
    	
    	String fileName = fileStorageService.storeFile(file);
    	
    	String fileDownloadUri = ServletUriComponentsBuilder.fromHttpUrl(fileStorageProperties.getDownloadUrl())
    			.path("/file/download/")
    			.path(fileName)
    			.toUriString();
    	
    	return new UploadFileResponse(fileName, fileDownloadUri, file.getContentType(), file.getSize());
    }
    
    @PostMapping("/uploadMultipleFiles")
    public List<UploadFileResponse> uploadMultipleFiles (@RequestParam("files") MultipartFile[] files){
    	
    	return Arrays.asList(files)
    			.stream()
    			.map(file -> uploadFile(file))
    			.collect(Collectors.toList());
    }
    
    @GetMapping("/download/{fileName:.+}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName, HttpServletRequest request){
    
    	Resource resource = fileStorageService.loadFileAsResource(fileName);
    	
    	String contentType = null;
    	
    	try {
    		contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
    	} catch (IOException ex) {
    		logger.info("Could not determine file type.");
    	}
    	
    	if (contentType==null) {
            contentType = "application/octet-stream";
    	}
    	
    	return ResponseEntity.ok()
    			.contentType(MediaType.parseMediaType(contentType))
    			.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\""+resource.getFilename() + "\"")
    			.body(resource);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	
}
