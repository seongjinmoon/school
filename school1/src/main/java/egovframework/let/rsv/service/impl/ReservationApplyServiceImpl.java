package egovframework.let.rsv.service.impl;

import egovframework.com.cmm.service.FileVO;
import egovframework.let.board.service.BoardService;
import egovframework.let.board.service.BoardVO;
import egovframework.let.rsv.service.ReservationApplyService;
import egovframework.let.rsv.service.ReservationService;
import egovframework.let.rsv.service.ReservationVO;
import egovframework.let.rsv.service.ReservationApplyVO;
import egovframework.let.temp.service.TempVO;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.stereotype.Service;


@Service("reservationServiceApply")
public class ReservationApplyServiceImpl extends EgovAbstractServiceImpl implements ReservationApplyService {

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
    @Resource(name="reservationApplyMapper")
	private ReservationApplyMapper reservationApplyMapper;
    
    @Resource(name = "egovReqIdGnrService")
    private EgovIdGnrService idgenService;
    
    @Resource(name = "egovReqTempIdGnrService")
    private EgovIdGnrService idgenTempService;
    
    @Resource(name = "reservationService")
    private ReservationService reservationService;
    
    //????????? ????????????
  	@Override
  	public ReservationApplyVO insertReservationApply(ReservationApplyVO vo) throws Exception {
  		//?????? ?????? ??????
  		ReservationVO reservationVO = new ReservationVO();
  		reservationVO.setResveId(vo.getResveId());
  		ReservationVO result = reservationService.selectReservation(reservationVO);
  		if(result.getMaxAplyCnt() <= result.getApplyFCnt()) {
  			vo.setErrorCode("ERROR-R1");
  			vo.setMessage("?????? ???????????????.");
  		}else{
  			//?????? ????????????
  			if(reservationApplyMapper.duplicateApplyCheck(vo) > 0) {
  				vo.setErrorCode("ERROR-R2");
  				vo.setMessage("?????? ?????? ???????????? ????????? ????????? ????????????.");
  			}else {
  				String id = idgenService.getNextStringId();
  				vo.setReqstId(id);
  				reservationApplyMapper.insertReservationApply(vo);
  			}
  		}
  		
  		return vo;
  	}
  	
    //????????? ?????? ????????????
	@Override
	public List<EgovMap> selectReservationApplyList(ReservationApplyVO vo) throws Exception {
		return reservationApplyMapper.selectReservationApplyList(vo);
	}
	
	//????????? ?????? ???
	@Override
	public int selectReservationApplyListCnt(ReservationApplyVO vo) throws Exception {
		return reservationApplyMapper.selectReservationApplyListCnt(vo);
	}
	
	//????????? ????????????
	@Override
	public ReservationApplyVO selectReservationApply(ReservationApplyVO vo) throws Exception {
		return reservationApplyMapper.selectReservationApply(vo);
	}
	
	//????????? ????????????
	@Override
	public void updateReservationApply(ReservationApplyVO vo) throws Exception {
		reservationApplyMapper.updateReservationApply(vo);
	}
	
	//????????? ????????????
	@Override
	public void deleteReservationApply(ReservationApplyVO vo) throws Exception {
		reservationApplyMapper.deleteReservationApply(vo);
	}
	
	//????????? ????????????
	@Override
	public void updateReservationConfirm(ReservationApplyVO vo) throws Exception {
		reservationApplyMapper.updateReservationConfirm(vo);
	}
	
	//?????????????????? ??????
	@Override
	public ReservationApplyVO rsvCheck(ReservationApplyVO vo) throws Exception{
		//?????? ?????? ??????
  		ReservationVO reservationVO = new ReservationVO();
  		reservationVO.setResveId(vo.getResveId());
  		ReservationVO result = reservationService.selectReservation(reservationVO);
  		if(result.getMaxAplyCnt() <= result.getApplyFCnt()) {
  			vo.setErrorCode("ERROR-R1");
  			vo.setMessage("?????? ???????????????.");
  		}else if(reservationApplyMapper.duplicateApplyCheck(vo) > 0){
  			vo.setErrorCode("ERROR-R2");
			vo.setMessage("?????? ?????? ???????????? ????????? ????????? ????????????.");
  		}
  		
  		return vo;
	}
	
	//????????? ?????? ?????????
	public Map<String, Object> excelUpload(FileVO fileVO, ReservationApplyVO vo) throws Exception{
		String fileExt = fileVO.getFileExtsn();
		
		FileInputStream stream = new FileInputStream(fileVO.getFileStreCours() +"/"+ fileVO.getStreFileNm());
	    File file = new File(fileVO.getFileStreCours() +"/"+ fileVO.getStreFileNm());
		
	    Boolean result = true;
	    Boolean totResult = true;
	    String resultMsg = "";
	    List<EgovMap> resultList = new ArrayList<EgovMap>();
	    List<String> duplList = new ArrayList<String>();
	    
		Map<String, Object> map = new HashMap<String, Object>();
		
		//?????? ?????????
		List<EgovMap> existUserList = reservationApplyMapper.selectReservationApplyList(vo);
		
		//??????Id
		String tempId = idgenTempService.getNextStringId();
		vo.setReqsttempId(tempId);
		
		try {
	    	Workbook wb = null;
	    	if("XLS".equals(fileExt.toUpperCase())) {
	    		wb = WorkbookFactory.create(stream);
	    	} else if("XLSX".equals(fileExt.toUpperCase())) {
	    		wb = WorkbookFactory.create(stream);
	    	}
	    	FormulaEvaluator eval = wb.getCreationHelper().createFormulaEvaluator();
	    	
	    	//int sheetNum = wb.getNumberOfSheets(); //???????????? ????????????
	    	if(wb != null) {
		    	Sheet sheet = wb.getSheetAt(0);
		    	int rows = sheet.getPhysicalNumberOfRows(); //??? ?????? ????????????
		    	//System.out.println(rows+"--------rows---------");
	            for(int r = 1; r < rows; r++){ //row ??????            	
	            	Row row = sheet.getRow(r); //row ????????????
	                if(row != null) {
	                	int cells = row.getPhysicalNumberOfCells();
		                for(int c = 0; c < 4; c++) {	//cell ????????????
		                	Cell cell = row.getCell(c);
		                	result = true;
		                	if(cell != null) {
			                	String value = "";
			                	switch(cell.getCellType()) {
				                	case Cell.CELL_TYPE_FORMULA:
				                		if(!EgovStringUtil.isEmpty(cell.toString())) {
				                			switch(eval.evaluateFormulaCell(cell)) {
				                				case Cell.CELL_TYPE_NUMERIC:
				                					if (HSSFDateUtil.isCellDateFormatted(cell)){ 
							                	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
							                	        value = formatter.format(cell.getDateCellValue()); 
							                	    } else { 
							                	        value="" + (long)cell.getNumericCellValue(); 
							                	    }
				                					break;
				                				case Cell.CELL_TYPE_STRING:
							                		value = "" + cell.getRichStringCellValue();
							                		break;
							                	case Cell.CELL_TYPE_BLANK:
							                		value = "";
							                		break;
							                	case Cell.CELL_TYPE_ERROR:
							                		value = "" + cell.getErrorCellValue();
							                		break;
							                	case Cell.CELL_TYPE_BOOLEAN:
							                		value = "" + cell.getBooleanCellValue();
							                		break;
							                	default:
							                		break;
				                			}
				                		}
				                		break;
				                	case Cell.CELL_TYPE_NUMERIC:
				                		if (HSSFDateUtil.isCellDateFormatted(cell)){ 
				                	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
				                	        value = formatter.format(cell.getDateCellValue()); 
				                	    } else { 
				                	        value="" + (long)cell.getNumericCellValue(); 
				                	    }
				                	    
				                		break;
				                	case Cell.CELL_TYPE_STRING:
				                		value = "" + cell.getRichStringCellValue();
				                		break;
				                	case Cell.CELL_TYPE_BLANK:
				                		value = "";
				                		break;
				                	case Cell.CELL_TYPE_ERROR:
				                		value = "" + cell.getErrorCellValue();
				                		break;
				                	case Cell.CELL_TYPE_BOOLEAN:
				                		value = "" + cell.getBooleanCellValue();
				                		break;
				                	default:
				                		break;
			                	}
			                	
			                	if(!EgovStringUtil.isEmpty(value)) {
			                		value = value.trim();
			                	}
			                	
			                	switch(c) {
			                		case 0 :
			                			vo.setUserId(value);//?????????ID
			                			break;
			                		case 1 : 
			                			vo.setChargerNm(value);//????????????
			                			break;
			                		case 2 : 
			                			vo.setTelno(value);//?????????
			                			break;
			                		case 3 : 
			                			vo.setEmail(value);//?????????
			                			break;
					                default : break;
			                	}
		                	}
		                }
		                
		                //??? ?????? ??????
		                if(!EgovStringUtil.isEmpty(vo.getUserId())){
		                	List<String> existIdList = new ArrayList<>();
			                //???????????? ?????? ??????
			                if(existUserList != null){ 
					            for(EgovMap cu : existUserList){
					            	existIdList.add(cu.get("frstRegisterId").toString());
					            }
					            
							    if(existIdList.contains(vo.getUserId())) {
							    	EgovMap userMap = new EgovMap();
							    	userMap.put("userId", vo.getUserId());
							    	userMap.put("message", "?????? ????????? ID?????????.");
							    	resultList.add(userMap);
							    	
							    	result = false;
							    	totResult = false;
							    }
				            }
			                //?????? ?????? ??????
			                if(result && duplList.contains(vo.getUserId())) {
			                	EgovMap userMap = new EgovMap();
						    	userMap.put("userId", vo.getUserId());
						    	userMap.put("message", "????????? ???????????? ?????????????????????.");
						    	resultList.add(userMap);
						    	
						    	result = false;
						    	totResult = false;
			                }
		            		 
			                if(result && !EgovStringUtil.isEmpty(vo.getUserId())){
			                	String id = idgenService.getNextStringId();
			      				vo.setReqstId(id);
			      				reservationApplyMapper.insertReservationApplyTemp(vo);
		                		
		                		duplList.add(vo.getUserId());
		                	}
		                }
	                }
	            }
	            
	            List<EgovMap> tempList = reservationApplyMapper.selectReservationApplyTemp(vo);
	            if(tempList.size() > 0){
	            	//?????? ??????
	            	reservationApplyMapper.insertReservationApplyTempAll(vo);
	            }
	    	}
	    } catch(FileNotFoundException e) {
	    	result = false;
	    	resultMsg="????????? ???????????? ???????????? ??????????????????.";
	    	e.printStackTrace(); 
	    } catch(InvalidFormatException e) {
	    	result = false;
	    	resultMsg="????????? ???????????? ???????????? ??????????????????.";
	    	e.printStackTrace(); 
	    } catch(Exception e){
	    	result = false;
	    	resultMsg="????????? ???????????? ???????????? ??????????????????.";
        	e.printStackTrace(); 
        } finally {
        	/**?????? ????????? ??????***/
        	reservationApplyMapper.deleteReservationApplyTemp(vo);
        	file.delete();
        }
    	
	    map.put("success", totResult);
	    map.put("msg", resultMsg);
	    map.put("resultList", resultList);
	    
		return map;
	}
}