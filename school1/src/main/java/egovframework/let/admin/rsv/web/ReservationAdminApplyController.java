package egovframework.let.admin.rsv.web;

import java.util.List;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.rsv.service.ReservationApplyService;
import egovframework.let.rsv.service.ReservationApplyVO;
import egovframework.let.rsv.service.ReservationService;
import egovframework.let.rsv.service.ReservationVO;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ReservationAdminApplyController {

	
	@Resource(name = "reservationServiceApply")
    private ReservationApplyService reservationServiceApply;
	
	@Resource(name = "reservationService")
    private ReservationService reservationService;
	
	
	//예약자정보 목록 가져오기
	@RequestMapping(value = "/admin/rsv/selectApplyList.do")
	public String selectApplyList(@ModelAttribute("searchVO") ReservationApplyVO searchVO,  HttpServletRequest request, ModelMap model) throws Exception{
		//관리자
		searchVO.setMngAt("Y");
		
		List<EgovMap> resultList = reservationServiceApply.selectReservationApplyList(searchVO);
		model.addAttribute("resultList", resultList);
		
		return "admin/rsv/RsvApplySelectList";
	}
	/*
	//예약자정보 상세
	@RequestMapping(value = "/rsv/rsvApplySelect.do")
	public String rsvApplySelect(@ModelAttribute("searchVO") ReservationApplyVO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		model.addAttribute("USER_INFO", user);
		
		ReservationApplyVO result = reservationServiceApply.selectReservationApply(searchVO);
		
		model.addAttribute("result", result);
		return "rsv/RsvApplySelect";
	}
	
	//예약정보 등록/수정
	@RequestMapping(value = "/rsv/rsvApplyRegist.do")
	public String rsvApplyRegist(@ModelAttribute("searchVO") ReservationApplyVO ReservationVO, HttpServletRequest request, ModelMap model) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	    if(user == null){
	    	model.addAttribute("message", "로그인 후 사용가능합니다.");
	    	return "forward:/rsv/selectList.do";
		}else {
			model.addAttribute("USER_INFO", user);
		}
	    
	    ReservationApplyVO result = new ReservationApplyVO();
		if(!EgovStringUtil.isEmpty(ReservationVO.getReqstId())) {
			result = reservationServiceApply.selectReservationApply(ReservationVO);
		}else{
			
		}
		
		model.addAttribute("result", result);
		
		request.getSession().removeAttribute("sessionReservationApply");
		
		return "rsv/RsvApplyRegist";
	}
	
	//예약자정보 등록하기
	@RequestMapping(value = "/rsv/rsvApplyInsert.do")
	public String rsvApplyInsert(@ModelAttribute("searchVO") ReservationApplyVO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		//이중 서브밋 방지 체크
		if(request.getSession().getAttribute("sessionReservationApply") != null){
			return "forward:/rsv/selectList.do";
		}
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	    if(user == null){
	    	model.addAttribute("message", "로그인 후 사용가능합니다.");
	    	return "forward:/rsv/selectList.do";
		}
	    
	    searchVO.setUserId(user.getId());
	    searchVO.setCreatIp(request.getRemoteAddr());
	    
	    ReservationApplyVO result = reservationServiceApply.insertReservationApply(searchVO);
	    if(!EgovStringUtil.isEmpty(result.getErrorCode())) {
	    	model.addAttribute("message", result.getMessage());
	    }else{
	    	model.addAttribute("message", "신청완료되었습니다.");
	    }
		
		//이중 서브밋 방지
		request.getSession().setAttribute("sessionReservationApply", searchVO);
		return "forward:/rsv/selectList.do";
	}
	
	//예약정보 수정하기
	@RequestMapping(value = "/rsv/rsvApplyUpdate.do")
	public String rsvApplyUpdate(@ModelAttribute("searchVO") ReservationApplyVO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		//이중 서브밋 방지
		if(request.getSession().getAttribute("sessionReservationApply") != null){
			return "forward:/rsv/selectList.do";
		}
				
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	    if(user == null){
	    	model.addAttribute("message", "로그인 후 사용가능합니다.");
	    	return "forward:/rsv/selectList.do";
		}
	    
	    searchVO.setUserId(user.getId());
	    
	    reservationServiceApply.updateReservationApply(searchVO);
		
		//이중 서브밋 방지
		request.getSession().setAttribute("sessionReservation", searchVO);
		return "forward:/rsv/selectList.do";
	}
	*/
	//예약정보 삭제하기
	@RequestMapping(value = "/admin/rsv/rsvApplyDelete.do")
	public String rsvApplyDelete(@ModelAttribute("searchVO") ReservationApplyVO searchVO, HttpServletRequest request, ModelMap model) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	    if(user == null){
	    	model.addAttribute("message", "로그인 후 사용가능합니다.");
	    	return "forward:/rsv/selectList.do";
		}
	    
	    searchVO.setUserId(user.getId());
	    
	    reservationServiceApply.deleteReservationApply(searchVO);
		
	    return "forward:/admin/rsv/selectApplyList.do";
	}
	
}