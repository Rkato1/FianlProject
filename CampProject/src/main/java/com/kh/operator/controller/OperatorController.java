package com.kh.operator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.operator.model.dao.OperatorService;

@Controller
public class OperatorController {
@Autowired
private OperatorService service;
}
