package com.kh.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.admin.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService service;
}
