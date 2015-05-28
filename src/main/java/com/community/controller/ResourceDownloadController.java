package com.community.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.community.service.ResourceDownloadService;

@Controller
@SessionAttributes("myUid")
public class ResourceDownloadController {
	private static final Logger logger = LoggerFactory
			.getLogger(ResourceDownloadController.class);

	@Autowired
	private ResourceDownloadService resourceDownloadService;

	@RequestMapping(value = "/resourceDownload/{rdid}", method = RequestMethod.DELETE)
	public @ResponseBody ResponseEntity<Void> delete(Model model, HttpServletRequest request,
			@PathVariable("rdid") Long rdid, @ModelAttribute("myUid") Long myUid) {
		boolean success = resourceDownloadService.deleteResourceDownload(myUid, rdid);
		if (success) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	}

}
