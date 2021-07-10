package com.main.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe.dao.CafeDAO;
import com.cafe.domain.CafeDTO;
import com.evaluation.dao.EvaluationDAO;
import com.evaluation.domain.TotalEvaluationDTO;

@Controller
public class HomeController {
	private final CafeDAO cafeDAO;
	private final EvaluationDAO evaluationDAO;
	
	@Autowired
	public HomeController(CafeDAO cafeDAO, EvaluationDAO evaluationDAO) {
		this.cafeDAO = cafeDAO;
		this.evaluationDAO = evaluationDAO;
	}
	
	// By Jay_메인 페이지 출력하기_2021_04_21
    @RequestMapping("main.do")
    public String home(Model model) {
        List<CafeDTO> recommendCafe =  cafeDAO.recommendCafe();
        List<TotalEvaluationDTO> evaluationList = evaluationDAO.total_evaluation_list();
		model.addAttribute("recommendCafe", recommendCafe);
		model.addAttribute("evaluationList", evaluationList);
		return "main/homepage";
    }
}
