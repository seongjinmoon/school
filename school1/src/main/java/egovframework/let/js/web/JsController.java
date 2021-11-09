package egovframework.let.js.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.let.utl.fcc.service.EgovStringUtil;

@Controller
public class JsController {

	//Jquery공부
	@RequestMapping(value = "/js/jstest.do")
	public String jstest(HttpServletRequest request) throws Exception{
		String param = request.getParameter("part");
		if(EgovStringUtil.isEmpty(param)) {
			param = "1";
		}
		return "js/Jstest" + param;
	}

}