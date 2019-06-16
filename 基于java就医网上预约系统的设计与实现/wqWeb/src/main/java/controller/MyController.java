package controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.aspectj.org.eclipse.jdt.core.dom.ThisExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import service.Admin_wqService;
import service.Dock_wqService;
import service.Keshi_wqService;
import service.Treat_wqService;
import service.User_wqService;
import util.AddDateMinut;
import common.Response;
import entity.Admin_wqBean;
import entity.Dock_wqBean;
import entity.Keshi_wqBean;
import entity.Page_wqBean;
import entity.Treat_wqBean;
import entity.User_wqBean;
import freemarker.template.utility.StringUtil;

@Controller
@RequestMapping("/")
public class MyController {

	@Autowired
	private Admin_wqService admin_wqService;
	@Autowired
	private Dock_wqService dock_wqService;
	@Autowired
	private Keshi_wqService keshi_wqService;
	@Autowired
	private User_wqService user_wqService;
	@Autowired
	private Treat_wqService treat_wqService;
	
	
	protected final Logger log = Logger.getLogger(this.getClass());
	
	public int dockId=0;
	
	
	//**$$$$$$$$$$$浠ヤ笅鏄疉PP绔搴旂殑api鎺ュ彛$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$*/
	
	//鏍规嵁鐢ㄦ埛Id鏉ユ煡璇㈣嚜宸辩殑瀹屾垚璇婃柇
	@ResponseBody
	@RequestMapping(value = "/GetYijiuzhenTreatInfoByUserIdByUser",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String GetYijiuzhenTreatInfoByUserIdByUser(HttpServletRequest request){
		Response response = new Response();
		try {
			int userId = Integer.parseInt(request.getParameter("userId"));
			
			List<Treat_wqBean> treats = treat_wqService.GetAllYijiuzhenTreatByUserIdByUser(userId);
			
			if(treats != null){
				response.setResult(true);
				response.setObject(treats);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
				
			}else{
				response.setResult(false);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	//鏍规嵁鐢ㄦ埛Id鏉ユ煡璇㈣嚜宸辩殑瀹屾垚璇婃柇
	@ResponseBody
	@RequestMapping(value = "/GetTreatByTidIdByUser",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String GetTreatByTidIdByUser(HttpServletRequest request){
		Response response = new Response();
		try {
			int treatId = 0;
			if(!request.getParameter("treatId").equals(""))
				treatId= Integer.parseInt(request.getParameter("treatId"));
			
			Treat_wqBean treat = treat_wqService.findTreatByTreatId(treatId);
			
			if(treat != null){
				response.setResult(true);
				response.setObject(treat);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
				
			}else{
				response.setResult(false);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	//鏍规嵁鐢ㄦ埛Id鏉ユ煡璇㈣嚜宸辩殑棰勭害
	@ResponseBody
	@RequestMapping(value = "/GetTreatInfoByUserIdByUser",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String GetTreatInfoByUserIdByUser(HttpServletRequest request){
		Response response = new Response();
		try {
			int userId = Integer.parseInt(request.getParameter("userId"));
			
			List<Treat_wqBean> treats = treat_wqService.GetAllPreTreatByUserIdByUser(userId);
			
			if(treats != null){
				response.setResult(true);
				response.setObject(treats);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
				
			}else{
				response.setResult(false);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	//鏍规嵁鐢ㄦ埛Id鏉ユ煡璇㈣嚜宸辩殑棰勭害
	@ResponseBody
	@RequestMapping(value = "/GetTreatInfoByUserShenByUser",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String GetTreatInfoByUserShenByUser(HttpServletRequest request){
		Response response = new Response();
		try {
			String shen = request.getParameter("shen");
			
			System.out.println("shen = " + shen);
			
			List<Treat_wqBean> treats = treat_wqService.findTreatAllOneByDockShen(shen);
			
			if(treats != null){
				response.setResult(true);
				response.setObject(treats);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
				
			}else{
				response.setResult(false);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	//棰勭害鍖荤敓
	@ResponseBody
	@RequestMapping(value = "/YuyueDockInfoByUser",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String insertDingdanInfo(HttpServletRequest request){
		Response response = new Response();
		try {
			String title = request.getParameter("title");
			title=new String(title.getBytes("ISO-8859-1"),"UTF-8");
			System.out.println(title);
			
			String shen = request.getParameter("shen");
			System.out.println(shen);
			
			int dockId  = 0;
			if(!request.getParameter("dockId").equals(""))
				dockId = Integer.parseInt(request.getParameter("dockId"));
			
			System.out.println(dockId);
			
			int keshiId = 0;
			if(!request.getParameter("keshiId").equals(""))
				keshiId = Integer.parseInt(request.getParameter("keshiId"));
		
			System.out.println(keshiId);
			
			int userId = 0;
			if(!shen.equals("")){
				User_wqBean user = user_wqService.findUserByShen(shen);
				userId = user.getUid_wq();
			}
			
			System.out.println(userId);
			
			Date date = new Date();
			System.out.println("data1 = "+date.toLocaleString());
			date.setHours(new Date().getHours()+3);
			System.out.println("date2 = "+date.toLocaleString());
			
			String treatTime = date.toLocaleString();
			
			System.out.println(treatTime);
			
			System.out.println("dockId="+dockId);
			
			int treatPreIndex = 1;
			Treat_wqBean treat = treat_wqService.findTreatPreIndexMaxByStaus(dockId);
			if(treat!=null)
				treatPreIndex = treat.getPreIndexMax() + 1;
			
			System.out.println("treatPreIndex="+treatPreIndex);
			
			int treatTotalCount = 1;
			Treat_wqBean treat2 = treat_wqService.findTreatTotalMaxByStaus(dockId);
			if(treat2!=null)
				treatTotalCount= treat2.getTotalMax() + 1;
			
			System.out.println("treatTotalCount="+treatTotalCount);
			
			Treat_wqBean endTreat = new Treat_wqBean();
			endTreat.setPreIndexMax(treatPreIndex);
			endTreat.setTbianhao_wq(shijianchuo());
			endTreat.setTisUse_wq(1);
			endTreat.setTKeshiId_wq(keshiId);
			endTreat.setTDid_wq(dockId);
			endTreat.setTotalCont(treatTotalCount);
			endTreat.setTotalMax(treatTotalCount);
			endTreat.setTpreIndex_wq(treatPreIndex);
			endTreat.setTpreTime_wq(timestampDate());
			endTreat.setTshenfenzheng_wq(shen);
			endTreat.setTstatus_wq(0);
			endTreat.setTstatusStr_wq("棰勭害涓�");
			endTreat.setTtitle_wq(title);
			endTreat.setTtotal_wq(treatTotalCount);
			endTreat.setTtreattime_wq(strFormatTimetamp(treatTime));
			endTreat.setTUid_wq(userId);
			
			//鏍规嵁鐢ㄦ埛韬唤璇佸拰dockId鏉ユ煡璇俊鎭�
			//Treat_wqBean treatt = treat_wqService.GetTtreatByUidAndDockId(endTreat);
		
			treat_wqService.insertTreatInfo(endTreat);
			response.setResult(true);
			JSONObject json = JSONObject.fromObject(response);
			return json.toString();
			
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	//鏍规嵁鍖荤敓Id鏉ユ煡璇㈠尰鐢熶俊鎭�
	@ResponseBody
	@RequestMapping(value = "/GetDockInfoByIdByUser",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String GetDockInfoByIdByUser(HttpServletRequest request){
		Response response = new Response();
		try {
			int dockId = 0;
			if(!request.getParameter("dockId").equals(""))
				dockId = Integer.parseInt(request.getParameter("dockId"));
			
			Dock_wqBean dock = dock_wqService.findDockByIdByUser(dockId);
			
			if(dock != null){
				response.setResult(true);
				response.setObject(dock);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
				
			}else{
				response.setResult(false);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	//鏍规嵁鍖荤敓鍚嶅瓧鏉ユ煡璇㈠尰鐢熶俊鎭�
	@ResponseBody
	@RequestMapping(value = "/GetDockInfoByDockNameByUser",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String GetDockInfoByDockNameByUser(HttpServletRequest request){
		Response response = new Response();
		try {
			String dockName = request.getParameter("dockName");
			dockName=new String(dockName.getBytes("ISO-8859-1"),"UTF-8");
			String endName = "%"+dockName+"%";
			System.out.println(endName);
			List<Dock_wqBean> docks = dock_wqService.findDockAllByDockName(endName);
			
			if(docks != null){
				response.setResult(true);
				response.setObject(docks);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
				
			}else{
				response.setResult(false);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	//閫夋嫨鏌愮瀹や腑鐨勬墍鏈夊尰鐢�绉戝鍚嶇О閫夋嫨)
	@ResponseBody
	@RequestMapping(value = "/GetAllDockInfoInKeshiByUser",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String GetAllDockInfoInKeshiByUser(HttpServletRequest request){
		Response response = new Response();
		try {
			String kname = request.getParameter("kname");
			kname=new String(kname.getBytes("ISO-8859-1"),"UTF-8");
			String endName = "%"+kname+"%";
			
			Keshi_wqBean keshi_wqBean = null;
			int keshiId =0;
			if(!kname.equals("")){
				System.out.println(endName);
				keshi_wqBean = keshi_wqService.findKeshiInfoByName(endName);
				keshiId = keshi_wqBean.getKid_wq();
				System.out.println(keshiId);
			}
			
			System.out.println(keshiId);
			
			List<Dock_wqBean> docks = dock_wqService.findDockAllBykeshiId(keshiId);
			
			if(docks != null){
				response.setResult(true);
				response.setObject(docks);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
				
			}else{
				response.setResult(false);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	//鑾峰彇鎵�湁鍖荤敓淇℃伅
	@ResponseBody
	@RequestMapping(value = "/GetAllKeshiInfoByUser",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
    public String GetAllKeshiInfoByUser(HttpServletRequest request){
		Response response = new Response();
		try {
			
			List<Keshi_wqBean> keshis = keshi_wqService.findKeshiAll();
			
			if(keshis != null){
				response.setResult(true);
				response.setObject(keshis);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
				
			}else{
				response.setResult(false);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	//鑾峰彇鎵�湁鍖荤敓淇℃伅
	@ResponseBody
	@RequestMapping(value = "/GetAllDockInfoByUser",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
    public String GetAllDockInfoByUser(HttpServletRequest request){
		Response response = new Response();
		try {
			
			List<Dock_wqBean> docks = dock_wqService.findDockAll();
			
			if(docks != null){
				response.setResult(true);
				response.setObject(docks);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
				
			}else{
				response.setResult(false);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	
	//鐢ㄦ埛娉ㄥ唽
	@ResponseBody
	@RequestMapping(value = "/UserRegist",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String UserRegist(HttpServletRequest request){
		Response response = new Response();
		try {
			String userName = request.getParameter("userName");
			userName=new String(userName.getBytes("ISO-8859-1"),"UTF-8");
			
			System.out.println(userName);
			
			String pwd = request.getParameter("passWord");
			String tel = request.getParameter("tel");
			
			System.out.println(tel);
			
			String attr = request.getParameter("attr");
			attr=new String(attr.getBytes("ISO-8859-1"),"UTF-8");
			
			System.out.println(attr);
			
			String sex = request.getParameter("sex");
			sex=new String(sex.getBytes("ISO-8859-1"),"UTF-8");
			
			System.out.println(sex);
			
			int age = 0;
			if(!request.getParameter("age").equals(""))
				age = Integer.parseInt(request.getParameter("age"));
			
			System.out.println("age = "+age);
			
			
			String img = request.getParameter("img");
			String shen = request.getParameter("shen");
			
			System.out.println("shen = "+ shen);
			
			String jianjie = request.getParameter("jianjie");
			jianjie=new String(jianjie.getBytes("ISO-8859-1"),"UTF-8");
			
			System.out.println("jianjie = " + jianjie);
			
			User_wqBean user = new User_wqBean();
			user.setUage_wq(age);
			user.setUattr_wq(attr);
			user.setUbianhao_wq(shijianchuo());
			user.setUimg_wq(img);
			user.setUjianjie_wq(jianjie);
			user.setUname_wq(userName);
			user.setUpwd_wq(pwd);
			user.setUshenfenzheng_wq(shen);
			user.setUtel_wq(tel);
			user.setUTime_wq(timestampDate());
			user.setUtypeId_wq(3);
			user.setUsex_wq(sex);
			
			User_wqBean user2 = user_wqService.checkLogin(user);
			
			if(user2 != null){
				response.setResult(false);
				response.setMessage("璇ョ敤鎴峰凡缁忔敞鍐岋紝璇风洿鎺ョ櫥褰�");
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}else{
				user_wqService.UserRegist(user);
				response.setResult(true);
				response.setObject(user);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		response.setMessage("璇ョ敤鎴峰凡缁忔敞鍐岋紝璇风洿鎺ョ櫥褰�");
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	//鏍规嵁鐢ㄦ埛韬唤璇佽幏鍙栫敤鎴蜂俊鎭�
	@ResponseBody
	@RequestMapping(value = "/GetUserInfoByUserShenByUser",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String GetUserInfoByUserShenByUser(HttpServletRequest request){
		Response response = new Response();
		try {
			String shen = request.getParameter("shen");
			
			User_wqBean user = user_wqService.findUserInfoByUserShen(shen);
			
			if(user != null){
				response.setResult(true);
				response.setObject(user);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
				
			}else{
				response.setResult(false);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	//鐢ㄦ埛淇敼瀵嗙爜
	@ResponseBody
	@RequestMapping(value = "/UpdateUserPwd",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String UpdateUserPwd(HttpServletRequest request){
		Response response = new Response();
		try {
			String userName = request.getParameter("userName");
			userName=new String(userName.getBytes("ISO-8859-1"),"UTF-8");
			
			String pwd = request.getParameter("passWord");
			String tel = request.getParameter("tel");
			
			String attr = request.getParameter("attr");
			attr=new String(attr.getBytes("ISO-8859-1"),"UTF-8");
			
			String sex = request.getParameter("sex");
			sex=new String(sex.getBytes("ISO-8859-1"),"UTF-8");
			
			int age = 0;
			if(!request.getParameter("age").equals(""))
				age= Integer.parseInt(request.getParameter("age"));
			
			String img = request.getParameter("img");
			String shen = request.getParameter("shen");
			
			String jianjie = request.getParameter("jianjie");
			jianjie=new String(jianjie.getBytes("ISO-8859-1"),"UTF-8");
			
			User_wqBean user = new User_wqBean();
			user.setUage_wq(age);
			user.setUattr_wq(attr);
			user.setUimg_wq(img);
			user.setUjianjie_wq(jianjie);
			user.setUname_wq(userName);
			user.setUpwd_wq(pwd);
			user.setUshenfenzheng_wq(shen);
			user.setUtel_wq(tel);
			user.setUTime_wq(timestampDate());
			user.setUsex_wq(sex);
			
			user_wqService.updateUserInfoByShen(user);
			response.setResult(true);
			JSONObject json = JSONObject.fromObject(response);
			return json.toString();
			
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }

	//鐢ㄦ埛鐧诲綍
	@ResponseBody
	@RequestMapping(value = "/UserLogin",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String login(HttpServletRequest reques){
		Response response = new Response();
		try {
			String shen = reques.getParameter("shen");
			String passWord = reques.getParameter("passWord");
			
			User_wqBean user = new User_wqBean();
			user.setUpwd_wq(passWord);
			user.setUshenfenzheng_wq(shen);
				
			User_wqBean user2 = user_wqService.login(user);
			if(user2 != null){
				response.setResult(true);
				response.setObject(user2);
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}else{
				response.setResult(false);
				response.setMessage("鐧诲綍澶辫触,鐢ㄦ埛鍚嶆垨瀵嗙爜閿欒!");
				JSONObject json = JSONObject.fromObject(response);
				return json.toString();
			}
		} catch (Exception e) {
			response.setResult(false);
			response.setMessage(e.toString());
		}
		response.setResult(false);
		response.setMessage("鐧诲綍澶辫触,鐢ㄦ埛鍚嶆垨瀵嗙爜閿欒!");
		JSONObject json = JSONObject.fromObject(response);
		return json.toString();
    }
	
	
	
	
	
	
	//**$$$$$$$$$$$浠ヤ笅鏄郴缁熷搴旂殑controller鎺ュ彛$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$*/
	
	/********浠ヤ笅鏄尰鐢熷鍚庡彴绯荤粺鐨勬搷浣�********* **********************/
	
	//鑾峰彇鎵�湁宸插氨璇婁俊鎭�
	@RequestMapping(value="/getDockAllWeijiuzhenListPage.do")
	public String getDockAllWeijiuzhenListPage(Page_wqBean page, HttpServletRequest request){
		List<Treat_wqBean> treats = treat_wqService.findDockWeijiuzhenTreatAll(dockId);
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = treats.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(treats.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("treats", page.getDataList());  
	    return "dockTreatWeijiuzhenManagerrList";
	}
	
	//鑾峰彇鎵�湁宸插氨璇婁俊鎭�
	@RequestMapping(value="/getDockAllYijiuzhenListPage.do")
	public String getDockAllYijiuzhenListPage(Page_wqBean page, HttpServletRequest request){
		List<Treat_wqBean> treats = treat_wqService.findDockYijiuzhenTreatAll(dockId);
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = treats.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(treats.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("dockyijiuzhentreats", page.getDataList());  
	    return "dockTreatYijiuzhenManagerrList";
	}
	
	//鑾峰彇鎵�湁灏辫瘖淇℃伅
	@RequestMapping(value="/dockTreatListManager.do")
	public String dockTreatListManager(Page_wqBean page, HttpServletRequest request){
	
		List<Treat_wqBean> treats = treat_wqService.findTreatAllOneByDockId(dockId);
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = treats.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(treats.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("treats", page.getDataList());  
	    return "dockTreatManagerrList";
	}
	
	@RequestMapping(value="/dockOneSelfData.do")
	public String dockOneSelfData(Page_wqBean page, HttpServletRequest request,HttpSession session){
		Dock_wqBean dock = (Dock_wqBean)session.getAttribute("docklogin");
		List<Dock_wqBean> dood = dock_wqService.findDockDataBydid(dock.getYid_wq());
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = dood.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(dood.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("dood", page.getDataList());  
	    return "dockOneUpInfo";
	}
	
	//淇敼鍖荤敓淇℃伅
	@RequestMapping(value = "/upDockOneInfo.do",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String upDockOneInfo(HttpServletRequest request) throws Exception{
		
		
		String name = request.getParameter("name").trim();
			name = URLDecoder.decode(name,"UTF-8"); 
		String pwd = request.getParameter("pwd").trim();
		String tel = request.getParameter("tel").trim();
		String attr = request.getParameter("attr").trim();
			attr = URLDecoder.decode(attr,"UTF-8");
		int age = Integer.parseInt(request.getParameter("age").equals("")?"0":request.getParameter("age"));
		String sex = request.getParameter("sex").trim();
			sex = URLDecoder.decode(sex,"UTF-8");
		String jianjie = request.getParameter("jianjie").trim();
			jianjie = URLDecoder.decode(jianjie,"UTF-8");
		String img = request.getParameter("img");
		int id = Integer.parseInt(request.getParameter("id"));
			
		Dock_wqBean dock = new Dock_wqBean();
		dock.setYaddTime_wq(timestampDate());
		dock.setYage_wq(age);
		dock.setYattr_wq(attr);
		dock.setYjianjie_wq(jianjie);
		dock.setYname_wq(name);
		dock.setYpwd_wq(pwd);
		dock.setYsex_wq(sex);
		dock.setYtel_wq(tel);
		dock.setYid_wq(id);
		dock.setYimg_wq(img);
		
		if(img.equals("")) 
			dock_wqService.updateDockInfo1(dock);
		else
			dock_wqService.updateDockInfo2(dock);
		
		return "redirect:/dockOneSelfData.do";
	}
	
	//鏇村姞绠＄悊鍛業d鏉ヤ慨鏀逛俊鎭�
	@RequestMapping(value="/upDockInfo/{id}/toUpdate.do")
	public String UpDockOneInfoById(@PathVariable Integer id, Model model){
		return "dockOneUpInfo";
	}
	
	//鏇村姞绠＄悊鍛榠d鏉ヨ幏鍙栦俊鎭�
	@RequestMapping(value="/getDockInfo/{id}/detial.do")
	public String GetDockfoById(@PathVariable Integer id, Model model){
		Dock_wqBean dock_wqBean = dock_wqService.findDockById(id);
		model.addAttribute("dockOne",dock_wqBean);
		return "dockOneInfo";
	}
	
	/********浠ヤ笅鏄鐞嗗憳瀵瑰悗鍙扮郴缁熺殑鎿嶄綔********** **********************/
	
	/**------绠＄悊鍛樺鐢ㄦ埛杩涜鎿嶄綔--------------------------------------*/

	//鑾峰彇鎵�湁宸插氨璇婁俊鎭�
	@RequestMapping(value="/getAllWeijiuzhenListPage.do")
	public String getAllWeijiuzhenListPage(Page_wqBean page, HttpServletRequest request){
		List<Treat_wqBean> treats = treat_wqService.findWeijiuzhenTreatAll();
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = treats.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(treats.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("treats", page.getDataList());  
	    return "treatWeijiuzhenManagerrList";
	}
	
	//瀹屾垚灏辫瘖淇℃伅
	@RequestMapping(value = "/UpWanchengJiuzhenTreatById1",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String UpWanchengJiuzhenTreatById1(HttpServletRequest request) throws Exception{
		int id = Integer.parseInt(request.getParameter("tId"));
		Treat_wqBean treat = treat_wqService.findTreatById(id);
		List<Treat_wqBean> trsYanzheng = treat_wqService.findTreatPreIndexYanzhengByStaus(treat);
		List<Treat_wqBean> trJianyi = treat_wqService.findTreatPreIndexJianyiByStaus(treat);
		
		if(trsYanzheng.size() == 0){
			treat.setTstatus_wq(1); 
			treat.setTstatusStr_wq("已就诊");
			treat.setTid_wq(id);
			
			
			treat_wqService.updateWanchengTreatInfo(treat);
		}else{
			for(int i = 0; i<trJianyi.size(); i++){
				trJianyi.get(i).setTpreIndex_wq(trJianyi.get(i).getTpreIndex_wq() - 1);
				trJianyi.get(i).setTtotal_wq(trJianyi.get(i).getTtotal_wq() - 1);
				
				treat_wqService.updatePreAndTotalTreatInfo(trJianyi.get(i));
			}
		}
		
		
		return "redirect:/getAllWeijiuzhenListPage.do";
	}
	
	//鍒犻櫎鏈氨璇婁俊鎭�
	@RequestMapping(value = "/deleteUpWwijiuzhenById",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String deleteUpWwijiuzhenById(HttpServletRequest request) throws Exception{
		int id = Integer.parseInt(request.getParameter("uId"));
		Treat_wqBean treat = treat_wqService.findTreatById(id);
		treat.setTisUse_wq(0);
		treat_wqService.updateDelTreatInfo(treat);
		return "redirect:/getAllWeijiuzhenListPage.do";
	}
	
	//鑾峰彇鎵�湁宸插氨璇婁俊鎭�
	@RequestMapping(value="/getAllYijiuzhenListPage.do")
	public String getAllYijiuzhenListPage(Page_wqBean page, HttpServletRequest request){
		List<Treat_wqBean> treats = treat_wqService.findYijiuzhenTreatAll();
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = treats.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(treats.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("treats", page.getDataList());  
	    return "treatYijiuzhenManagerrList";
	}
	
	//鑾峰彇鎵�湁灏辫瘖淇℃伅
	@RequestMapping(value="/TreatListManager.do")
	public String TreatListManager(Page_wqBean page, HttpServletRequest request){
		List<Treat_wqBean> treats = treat_wqService.findTreatAll();
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = treats.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(treats.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("treats", page.getDataList());  
	    return "treatManagerrList";
	}
	
	//娣诲姞灏辫瘖淇℃伅
	@RequestMapping(value = "/AddTreatInfo",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String AddTreatInfo(HttpServletRequest request) throws Exception{
		String title = request.getParameter("title").trim();
			title = URLDecoder.decode(title,"UTF-8"); 
		String shen = request.getParameter("shen").trim();
		String uname = request.getParameter("uname").trim();
			uname = URLDecoder.decode(uname,"UTF-8"); 
		
			System.out.println("uname="+uname);
			
		int keshiid =0;
		int dockid =0;
		if(!request.getParameter("keshiid").equals("") && !request.getParameter("dockid").equals("")){
			keshiid = Integer.parseInt(request.getParameter("keshiid"));
			dockid = Integer.parseInt(request.getParameter("dockid"));
		}
		
		System.out.println("dockid="+dockid);
		
		//鍏堝垽鏂韬唤璇佸彿鏁版嵁搴撲腑鏄惁瀛樺湪锛屽鏋滃瓨鍦紝鍙栧嚭瀵瑰簲鐨剈id锛屽鏋滄病鏈夊瓨鍦紝鍒欏垱寤猴紝鍐嶈繑鍥濽id
		System.out.println(shen);
		User_wqBean user = user_wqService.findUserByShen(shen);
		int userId = 0;
		if(user!=null)
			userId = user.getUid_wq();
		else{
			User_wqBean user2 = new User_wqBean();
			user2.setUbianhao_wq(shijianchuo());
			user2.setUpwd_wq("1234");
			user2.setUshenfenzheng_wq(shen);
			user2.setUtypeId_wq(3);
			user2.setUTime_wq(timestampDate());
			user2.setUname_wq(uname);
			
			if(user_wqService.InserUserInfo(user2) > 0)
				userId = user_wqService.findUserByShen(shen).getUid_wq();
		}
		
		System.out.println("userId="+userId);
		
		//鏍规嵁鍖荤敓id鏌ュ嚭瀵瑰簲鐨刾reindex鍜宼otal
		int preIndex = 1;
		int total = 1;
		System.out.println("preIndex="+preIndex);
		Treat_wqBean tttr = treat_wqService.findTreatTotalByStaus(dockid);
		Treat_wqBean tttr2 = treat_wqService.findTreatTotalPreIndexByStaus(dockid);
		System.out.println("total="+total);
		if(tttr != null && tttr2 != null){
			preIndex = tttr2.getPreCont()+1;
			total = tttr.getTotalCont()+ 1;
		}
		
		Treat_wqBean treat = new Treat_wqBean();
		treat.setTbianhao_wq(shijianchuo());
		treat.setTDid_wq(dockid);
		treat.setTKeshiId_wq(keshiid);
		treat.setTpreIndex_wq(preIndex);
		treat.setTpreTime_wq(timestampDate());
		treat.setTshenfenzheng_wq(shen);
		treat.setTtitle_wq(title);
		treat.setTtotal_wq(total);
		treat.setTUid_wq(userId);
		treat.setTstatus_wq(0);
		treat.setTstatusStr_wq("未就诊");
		treat.setTisUse_wq(1);
		
		treat_wqService.insertTreatInfo(treat);
		return "redirect:/TreatListManager.do";
	}
	
	//瀹屾垚灏辫瘖淇℃伅
	@RequestMapping(value = "/UpWanchengJiuzhenTreatById",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String UpWanchengJiuzhenTreatById(HttpServletRequest request) throws Exception{
		int id = Integer.parseInt(request.getParameter("tId"));
		Treat_wqBean treat = treat_wqService.findTreatById(id);
		List<Treat_wqBean> trsYanzheng = treat_wqService.findTreatPreIndexYanzhengByStaus(treat);
		List<Treat_wqBean> trJianyi = treat_wqService.findTreatPreIndexJianyiByStaus(treat);
		
		if(trsYanzheng.size() == 0){
			treat.setTstatus_wq(1); 
			treat.setTstatusStr_wq("宸插氨璇�");
			treat_wqService.updateWanchengTreatInfo(treat);
		}
		
		for(int i = 0; i<trJianyi.size(); i++){
			trJianyi.get(i).setTpreIndex_wq(trJianyi.get(i).getTpreIndex_wq() - 1);
			trJianyi.get(i).setTtotal_wq(trJianyi.get(i).getTtotal_wq() - 1);
			
			treat_wqService.updatePreAndTotalTreatInfo(trJianyi.get(i));
		}
		
		return "redirect:/TreatListManager.do";
	}
	
	//鍒犻櫎灏辫瘖淇℃伅
	@RequestMapping(value = "/deleteUpTreatById",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String deleteUpTreatById(HttpServletRequest request) throws Exception{
		int id = Integer.parseInt(request.getParameter("uId"));
		Treat_wqBean treat = treat_wqService.findTreatById(id);
		treat.setTisUse_wq(0);
		treat_wqService.updateDelTreatInfo(treat);
		List<Treat_wqBean> trs = treat_wqService.findTreatPreIndexJianyiByStaus(treat);
		
		System.out.println("deleteUpTreatById00trs.size="+trs.size());
		
		for(int i = 0; i<trs.size(); i++){
			
			System.out.println("鍓�=" + trs.get(i).getTpreIndex_wq() );
			
			trs.get(i).setTpreIndex_wq(trs.get(i).getTpreIndex_wq() - 1);
			trs.get(i).setTtotal_wq(trs.get(i).getTtotal_wq() - 1);
			
			System.out.println("鍚�= " + trs.get(i).getTpreIndex_wq() );
			
			
			treat_wqService.updatePreAndTotalTreatInfo(trs.get(i));
		}
		
		return "redirect:/TreatListManager.do";
	}
	
	//鑾峰彇鎵�湁鐢ㄦ埛淇℃伅
	@RequestMapping(value="/UserListManager.do")
	public String UserListManager(Page_wqBean page, HttpServletRequest request){
		List<User_wqBean> users = user_wqService.findUserAll();
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = users.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(users.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("users", page.getDataList());  
	    return "userManagerrList";
	}
	
	//淇敼鐢ㄦ埛淇℃伅
	@RequestMapping(value = "/upUserInfo",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String upUserInfo(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name").trim();
			name = URLDecoder.decode(name,"UTF-8"); 
		String pwd = request.getParameter("pwd").trim();
		String tel = request.getParameter("tel").trim();
		String attr = request.getParameter("attr").trim();
			attr = URLDecoder.decode(attr,"UTF-8");
		String sex = request.getParameter("sex").trim();
			sex = URLDecoder.decode(sex,"UTF-8");
		String shen = request.getParameter("shen").trim();
		String jianjie = request.getParameter("jianjie").trim();
			jianjie = URLDecoder.decode(jianjie,"UTF-8");
		int age = Integer.parseInt(request.getParameter("age"));
		String img = request.getParameter("img").trim();
		int id = Integer.parseInt(request.getParameter("id"));
		
		User_wqBean user = new User_wqBean();
		user.setUage_wq(age);
		user.setUattr_wq(attr);
		user.setUimg_wq(img);
		user.setUjianjie_wq(jianjie);
		user.setUname_wq(name);
		user.setUpwd_wq(pwd);
		user.setUsex_wq(sex);
		user.setUshenfenzheng_wq(shen);
		user.setUtel_wq(tel);
		user.setUTime_wq(timestampDate());
		user.setUid_wq(id);
		
		if(img.equals("")) 
			user_wqService.updateUserInfo(user);
		else
			user_wqService.updateUserInfo2(user);
		
		return "redirect:/UserListManager.do";
	}
	
	//鏍规嵁绉戝id鍒犻櫎绉戝淇℃伅
	@RequestMapping(value="/deleteUserById",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String deleteUserById(HttpServletRequest request){
		int uId = Integer.parseInt(request.getParameter("uId"));
	    user_wqService.deleteUserById(uId);
		return "redirect:/UserListManager.do";
	}
	
	//鑾峰彇鎵�湁绉戝淇℃伅
	@RequestMapping(value="/KeshiListManager.do")
	public String KeshiListManager(Page_wqBean page, HttpServletRequest request){
		List<Keshi_wqBean> keshis = keshi_wqService.findKeshiAll();
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = keshis.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(keshis.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("keshis", page.getDataList());  
	    return "keshiManagerList";
	}
	
	//娣诲姞绉戝淇℃伅
	@RequestMapping(value = "/addKeshiInfo",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String addKeshiInfo(HttpServletRequest request) throws Exception{
		String name = request.getParameter("kname").trim();
			name = URLDecoder.decode(name,"UTF-8"); 
		String kuname = request.getParameter("kuname").trim();
			kuname = URLDecoder.decode(kuname,"UTF-8"); 
		String ktel = request.getParameter("ktel").trim();
			ktel = URLDecoder.decode(ktel,"UTF-8"); 
		String kjianjie = request.getParameter("kjianjie").trim();
			kjianjie = URLDecoder.decode(kjianjie,"UTF-8"); 
			
		//閫氳繃绉戝鍚嶅瓧鑾峰彇瀵瑰簲鐨勭瀹d
		Keshi_wqBean keshi = new Keshi_wqBean();
		
		keshi.setKtime_wq(timestampDate());
		keshi.setKfuzeren_wq(kuname);
		keshi.setKjianjie_wq(kjianjie);
		keshi.setKname_wq(name);
		keshi.setKtel_wq(ktel);
		
		keshi_wqService.insertKeshiInfo(keshi);
		return "redirect:/KeshiListManager.do";
	}

	//淇敼绉戝淇℃伅
	@RequestMapping(value = "/upKeshiInfo",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String upKeshiInfo(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name").trim();
			name = URLDecoder.decode(name,"UTF-8"); 
		String tel = request.getParameter("tel").trim();
		String uname = request.getParameter("uname").trim();
			uname = URLDecoder.decode(uname,"UTF-8");
		String jianjie = request.getParameter("jianjie").trim();
			jianjie = URLDecoder.decode(jianjie,"UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		
		Keshi_wqBean keshi = new Keshi_wqBean();
		keshi.setKfuzeren_wq(uname);
		keshi.setKjianjie_wq(jianjie);
		keshi.setKname_wq(name);
		keshi.setKtel_wq(tel);
		keshi.setKtime_wq(timestampDate());
		keshi.setKid_wq(id);
		
		keshi_wqService.updateKeshiInfo(keshi);
		
		return "redirect:/KeshiListManager.do";
	}
	
	//鏍规嵁绉戝id鍒犻櫎绉戝淇℃伅
	@RequestMapping(value="/deleteKeshiById",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String deleteKeshiById(HttpServletRequest request){
		int uId = Integer.parseInt(request.getParameter("uId"));
	    keshi_wqService.deleteKeshiById(uId);
		return "redirect:/KeshiListManager.do";
	}
	
	//鑾峰彇鎵�湁鍖荤敓淇℃伅
	@RequestMapping(value="/DockListManager.do")
	public String DockListManager(Page_wqBean page, HttpServletRequest request){
		List<Dock_wqBean> docks = dock_wqService.findDockAll();
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = docks.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(docks.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("docks", page.getDataList());  
	    return "dockManagerrList";
	}
	
	//娣诲姞鍖荤敓淇℃伅
	@RequestMapping(value = "/addDockInfo",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String addDockInfo(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name").trim();
			name = URLDecoder.decode(name,"UTF-8"); 
		String pwd = request.getParameter("pwd").trim();
		String tel = request.getParameter("tel").trim();
		String attr = request.getParameter("attr").trim();
			attr = URLDecoder.decode(attr,"UTF-8"); 
		int age = Integer.parseInt(request.getParameter("age"));
		String sex = request.getParameter("sex").trim();
			sex = URLDecoder.decode(sex,"UTF-8"); 
		String keshiname = request.getParameter("keshiname").trim();
			keshiname = URLDecoder.decode(keshiname,"UTF-8"); 
		String jianjie = request.getParameter("jianjie").trim();
			jianjie = URLDecoder.decode(jianjie,"UTF-8"); 
		String img = request.getParameter("img");
			
			
		//閫氳繃绉戝鍚嶅瓧鑾峰彇瀵瑰簲鐨勭瀹d
		Keshi_wqBean keshi_wqBean = keshi_wqService.findKeshiInfoByName(keshiname);
		int keshiId = 0;
		if(keshi_wqBean!=null) keshiId = keshi_wqBean.getKid_wq();
		
		Dock_wqBean dock = new Dock_wqBean();
		dock.setYaddTime_wq(timestampDate());
		dock.setYage_wq(age);
		dock.setYattr_wq(attr);
		dock.setYbianhao_wq(shijianchuo());
		dock.setYjianjie_wq(jianjie);
		dock.setYkeshiId_wq(keshiId);
		dock.setYname_wq(name);
		dock.setYpwd_wq(pwd);
		dock.setYsex_wq(sex);
		dock.setYtel_wq(tel);
		dock.setYimg_wq(img);
		
		dock_wqService.insertDockInfo(dock);
		return "redirect:/DockListManager.do";
	}
	
	//淇敼鍖荤敓淇℃伅
	@RequestMapping(value = "/upDockInfo",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String upDockInfo(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name").trim();
			name = URLDecoder.decode(name,"UTF-8"); 
		String pwd = request.getParameter("pwd").trim();
		String tel = request.getParameter("tel").trim();
		String attr = request.getParameter("attr").trim();
			attr = URLDecoder.decode(attr,"UTF-8");
		int age = Integer.parseInt(request.getParameter("age").equals("")?"0":request.getParameter("age"));
		String sex = request.getParameter("sex").trim();
			sex = URLDecoder.decode(sex,"UTF-8");
		String keshiname = request.getParameter("keshiname").trim();
			keshiname = URLDecoder.decode(keshiname,"UTF-8");
		String jianjie = request.getParameter("jianjie").trim();
			jianjie = URLDecoder.decode(jianjie,"UTF-8");
		String img = request.getParameter("img");
		int id = Integer.parseInt(request.getParameter("id"));
			
		
		//閫氳繃绉戝鍚嶅瓧鑾峰彇瀵瑰簲鐨勭瀹d
		Keshi_wqBean keshi_wqBean = keshi_wqService.findKeshiInfoByName(keshiname);
		int keshiId = 0;
		if(keshi_wqBean!=null) keshiId = keshi_wqBean.getKid_wq();
		
		Dock_wqBean dock = new Dock_wqBean();
		dock.setYaddTime_wq(timestampDate());
		dock.setYage_wq(age);
		dock.setYattr_wq(attr);
		dock.setYjianjie_wq(jianjie);
		dock.setYkeshiId_wq(keshiId);
		dock.setYname_wq(name);
		dock.setYpwd_wq(pwd);
		dock.setYsex_wq(sex);
		dock.setYtel_wq(tel);
		dock.setYid_wq(id);
		dock.setYimg_wq(img);
		
		if(img.equals("")) 
			dock_wqService.updateDockInfo1(dock);
		else
			dock_wqService.updateDockInfo2(dock);
		
		return "redirect:/DockListManager.do";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/getAllKeshiDataInfo",method=RequestMethod.GET)
	public Keshi_wqBean getAllKeshiDataInfo(){
		return Keshi_wqBean.getJsonResult(200, "123", keshi_wqService.findKeshiAll());
	}
	
	@ResponseBody
	@RequestMapping(value="/getAllDockDataInfo",method=RequestMethod.GET)
	public Dock_wqBean getAllDockDataInfo(HttpServletRequest request) throws Exception{
		int keshiId = Integer.parseInt(request.getParameter("keshiId"));
		System.out.println(keshiId);
		return Dock_wqBean.getJsonResult(200, "123", dock_wqService.findDockAllBykeshiId(keshiId));
	}

	//鏍规嵁鍖荤敓id鍒犻櫎鍖荤敓淇℃伅
	@RequestMapping(value="/deleteDockById",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String deleteDockById(HttpServletRequest request){
		int uId = Integer.parseInt(request.getParameter("uId"));
	    dock_wqService.deleteDockById(uId);
		return "redirect:/DockListManager.do";
	}
	
	
	//鑾峰彇鎵�湁绠＄悊鍛樹俊鎭�
		@RequestMapping(value="/aaa.do")
		public String aaaa(Page_wqBean page, HttpServletRequest request){
			
		    return "TaocanList";
		}
	
	
	//鑾峰彇鎵�湁绠＄悊鍛樹俊鎭�
	@RequestMapping(value="/AdminListManager.do")
	public String GetAllKuaidiyuanList(Page_wqBean page, HttpServletRequest request){
		List<Admin_wqBean> admins = admin_wqService.findAdminAll();
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = admins.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(admins.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("admins", page.getDataList());  
	    return "adminManagerList";
	}
	
	//娣诲姞绠＄悊鍛樹俊鎭�
	@RequestMapping(value = "/addAdminInfo",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String AddDianyuanInfo(HttpServletRequest request) throws Exception{
		String name = request.getParameter("addKName");
		name=new String(name.getBytes("ISO-8859-1"),"UTF-8");
		
		Admin_wqBean admin = new Admin_wqBean();
		admin.setAbianhao_wq(shijianchuo());
		admin.setAloginTime_wq(timestampDate());
		admin.setAname_wq(name);
		admin.setApwd_wq("123");
		admin.setAtypeId_wq(1);
		
		admin_wqService.addAdminInfo(admin);
		return "redirect:/AdminListManager.do";
	}
		
	
	/*-------绠＄悊鍛樹釜浜轰俊鎭搷浣�----------------------------------------*/
	//閫氳繃鐐瑰嚮浜嬩欢鏉ヤ慨鏀圭鐞嗗憳淇℃伅
	@RequestMapping(value="/updateAdminInfo.do")
	public String BtnUpdateAdminInfoById(HttpServletRequest request) throws Exception{
		
		String name = request.getParameter("name").trim();
		name = URLDecoder.decode(name,"UTF-8"); 
		String pwd = request.getParameter("pwd").trim();
		int id = Integer.parseInt(request.getParameter("id").trim());
		
		Admin_wqBean admin = new Admin_wqBean();
		admin.setAname_wq(name);
		admin.setApwd_wq(pwd);
		admin.setAid_wq(id);
		
		admin_wqService.updateAdminInfo(admin);
		return "redirect:/myAdminInfo.do";
	}
		
	//閫氳繃鐐瑰嚮浜嬩欢鏉ヤ慨鏀圭鐞嗗憳淇℃伅
	@RequestMapping(value="/{id}/update.do")
	public String BtnUpdateAdminInfoById(@PathVariable Integer id, Admin_wqBean admin, Model model){
		admin.setAid_wq(id);
		admin.setAloginTime_wq(strFormatTimetamp(returnDateTimeStr()));
		
		admin_wqService.updateAdminInfo(admin);
		model.addAttribute("admin",admin);
		return "adminOneInfo";
	}
	
	//鏇村姞绠＄悊鍛業d鏉ヤ慨鏀逛俊鎭�
	@RequestMapping(value="/upAdminInfo/{id}/toUpdate.do")
	public String UpAdminInfoById(@PathVariable Integer id, Model model){
		return "adminOneUpInfo";
	}
	
	//鏇村姞绠＄悊鍛榠d鏉ヨ幏鍙栦俊鎭�
	@RequestMapping(value="/getAdminInfo/{id}/detial.do")
	public String GetAdminInfoById(@PathVariable Integer id, Model model){
		Admin_wqBean admin_wqBean = admin_wqService.findAdminById(id);
		model.addAttribute("admin",admin_wqBean);
		return "adminOneInfo";
	}
	
	@RequestMapping(value="/myAdminInfo.do",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
	public String myAdminInfo(Page_wqBean page, HttpServletRequest request,HttpSession session){
		Admin_wqBean aa = (Admin_wqBean)session.getAttribute("loged");
		List<Admin_wqBean> admins = admin_wqService.findAdminByIds(aa.getAid_wq());
		if (page.getCurrentPage() == null){
	        page.setCurrentPage(1);
	    } else {
	        page.setCurrentPage(page.getCurrentPage());
	    }
	    page.setPageSize(10);
	    page.setStar((page.getCurrentPage() - 1) * page.getPageSize());
	    int count = admins.size();
	    page.setTotalPage(count % 10 == 0 ? count / 10 : count / 10 + 1);
	    page.setDataList(admins.subList(page.getStar(),count-page.getStar()>page.getPageSize()?page.getStar()+page.getPageSize():count));
	    request.setAttribute("paging", page);    
	    request.setAttribute("adminsss", page.getDataList());  
		return "adminOneInfo";
	}
	
	//鍒ゆ柇绠＄悊鍛樺拰鍖荤敓鐧诲綍
	@RequestMapping(value = "/adminLogin",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String adminLogin(HttpSession session, Admin_wqBean adminBean){
		
		if(adminBean.getUserType().equals("1")){
			Admin_wqBean admin_wqBean = admin_wqService.login(adminBean);
			if(admin_wqBean!=null){
				session.setAttribute("loged", admin_wqBean);
				return "adminIndex";
			}else{
				return "redirect:/goLogin?message=1";
			}
		} 
		else if(adminBean.getUserType().equals("2")){
			Dock_wqBean dock = new Dock_wqBean();
			dock.setYbianhao_wq(adminBean.getAbianhao_wq());
			dock.setYpwd_wq(adminBean.getApwd_wq());
			
			Dock_wqBean dock_wqBean = dock_wqService.login(dock);
			
			if(dock_wqBean!=null){
				session.setAttribute("docklogin", dock_wqBean);
				dockId = dock_wqBean.getYid_wq();
				return "dockIndex";
			}else{
				return "redirect:/goLogin?message=1";
			}
		}else{
			System.out.println(adminBean.getUserType()+"cc");
			return "redirect:/goLogin?message=1";
		}
    }
	
	//杩涘叆鐧诲綍鐣岄潰
	@RequestMapping(value = "/goLogin",method = RequestMethod.GET,produces = "text/json;charset=UTF-8")
    public String goLogin(HttpServletRequest reques){
		if(reques.getParameter("message")!=null && reques.getParameter("message").equals("1")){

			reques.setAttribute("message","鐢ㄦ埛鍚嶆垨瀵嗙爜閿欒!!");
		}
		return "index";
    }
	
	
	/*鍥剧墖涓婁紶寮�*/
	@RequestMapping("/admin/uplode/photo")
    @ResponseBody
    public  Map<String, Object>  updatePhoto(HttpServletRequest request,HttpServletResponse response,@RequestParam("myFile") MultipartFile myFile){
		 Map<String, Object> json = new HashMap<String, Object>();
	        try {
	            //杈撳嚭鏂囦欢鍚庣紑鍚嶇О
	            System.out.println(myFile.getOriginalFilename());
	            DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	            //鍥剧墖鍚嶇О
	            String name = df.format(new Date());

	            Random r = new Random();
	            for(int i = 0 ;i<3 ;i++){
	                name += r.nextInt(10);
	            }
	            
	            String ext = FilenameUtils.getExtension(myFile.getOriginalFilename());
	            //淇濆瓨鍥剧墖       File浣嶇疆 锛堝叏璺緞锛�  /upload/fileName.jpg
	            String url = request.getSession().getServletContext().getRealPath("/upload");
	            //鐩稿璺緞
	            String path = "/"+name + "." + ext;
	            File file = new File(url);
	            if(!file.exists()){
	                file.mkdirs();
	            }
	            
	            myFile.transferTo(new File(url+path));
	            /*json.put("success", "/static/img/upload/phono/"+path);*/
	            json.put("success",path);
	            
	            System.out.println("url="+url);
	            System.out.println("path="+path);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	       return json ;
    }
	
	/*鍥剧墖涓婁紶缁撴潫*/
	
	
	/*鍥剧墖涓婁紶寮�*/
	@RequestMapping("/admin/uplode/photo2")
    @ResponseBody
    public  Map<String, Object> updatePhoto2(HttpServletRequest request,HttpServletResponse response,@RequestParam("myUpFile") MultipartFile myFile){
		 Map<String, Object> json = new HashMap<String, Object>();
	        try {
	            //杈撳嚭鏂囦欢鍚庣紑鍚嶇О
	            System.out.println(myFile.getOriginalFilename());
	            DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	            //鍥剧墖鍚嶇О
	            String name = df.format(new Date());

	            Random r = new Random();
	            for(int i = 0 ;i<3 ;i++){
	                name += r.nextInt(10);
	            }
	            
	            String ext = FilenameUtils.getExtension(myFile.getOriginalFilename());
	            //淇濆瓨鍥剧墖       File浣嶇疆 锛堝叏璺緞锛�  /upload/fileName.jpg
	            String url = request.getSession().getServletContext().getRealPath("/upload");
	            //鐩稿璺緞
	            String path = "/"+name + "." + ext;
	            File file = new File(url);
	            if(!file.exists()){
	                file.mkdirs();
	            }
	            
	            myFile.transferTo(new File(url+path));
	            json.put("success",path);
	            
	            System.out.println("url="+url);
	            System.out.println("path="+path);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	       return json ;
    }
	
	/*鍥剧墖涓婁紶缁撴潫*/
	
	
	//杩斿洖褰撳墠鏃堕棿Timestamp鏍煎紡鏁版嵁
	public Timestamp timestampDate(){
		return strFormatTimetamp(returnDateTimeStr());
	}
	
	//鏍规嵁褰撳墠鏃堕棿杩斿洖鏃堕棿鎴�
	public String shijianchuo(){
		return System.currentTimeMillis()+"";
	}
	
	public String returnDateTimeStr(){
		DateFormat df2 = DateFormat.getDateTimeInstance();
       return df2.format(new Date()); 
	}
	
	private Timestamp strFormatTimetamp(String str){
	    DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    format.setLenient(false);
	    try {
		    Timestamp ts = new Timestamp(format.parse(str).getTime());
		    return ts;
	    } catch (Exception e) {
	     e.printStackTrace();
	     return null;
	    }
	}
}
