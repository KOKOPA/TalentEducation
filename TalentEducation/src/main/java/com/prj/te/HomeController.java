package com.prj.te;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.prj.te.dto.MemberDto;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@RequestMapping(value = "/member/mypagehome.do")
	public String myPageHome() {
		
		return "mypagehome";
	}
	@RequestMapping(value = "/member/mypageinfo.do")
	public String myPageInfo() {
		return "mypageinfo";
	}
	
	
	@RequestMapping(value = "/boardlist.do")
	public String boardList() {
		
		return "boardlist";
	}
	@RequestMapping(value = "/selectone.do")
	public String selectOne() {
		
		return "boardselectone";
	}
	
}
