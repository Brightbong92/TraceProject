package tp.mentor.controller;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import tp.domain.Mentor_List;
import tp.mentor.service.MentorService;
import tp.vo.MentorProfileVo;


@Log4j
@RequestMapping("/mentor/*")
@Controller
@AllArgsConstructor
public class MentorController {
	private MentorService service;
	
	@GetMapping("mentor_apply.do")
	public String mentorApply() {
		return "mentor/mentor_apply";
	}
	
	@GetMapping("popup.do")
	public ModelAndView mentorProfilePopup(String mem_email) {
		MentorProfileVo mProfile = service.selectMentorProfile(mem_email);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mentor/mentor_profile_popup");
		mv.addObject("mProfile", mProfile);
		return mv;
	}
	@PostMapping("apply.do")
	public String apply(Model model, String mem_email, String ml_name,String ml_phone,String ml_yourself, String mtrcg_no, MultipartFile ml_ofname) {
		String ofname = ml_ofname.getOriginalFilename();
		if(ofname != null) ofname=ofname.trim();
    	if(ofname.length() !=0 ) {
    		service.saveStore(mem_email,ml_name,ml_phone,ml_yourself,mtrcg_no,ml_ofname);
    	}
		return "index/index";
	}
	@GetMapping("check_apply.do")
	public @ResponseBody String checkApply(String mem_email) {
		boolean flag = service.checkApply(mem_email);
		if(flag) {
			return "possible";
		}else {
			return "impossible";
		}
	}
	@ResponseBody 
	@RequestMapping("sendSms") 
	   public String sendSms(@RequestParam(value="receiver") String receiver) {
		
		log.info("#receiver : " + receiver);
		// 6자리 인증 코드 생성 
		int rand = (int) (Math.random() * 899999) + 100000; 
		
		//DB저장
		service.setCode(receiver, rand);
		// 문자 보내기 
		String hostname = "api.bluehouselab.com"; 
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms"; 
		
		CredentialsProvider credsProvider = new BasicCredentialsProvider(); 
		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM), 
				
		// 청기와랩에 등록한 Application Id 와 API key 를 입력합니다. 
		new UsernamePasswordCredentials("TraceProject", "42e9fa4c462811eab9760cc47a1fcfae")); 
		
		AuthCache authCache = new BasicAuthCache(); 
		authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme()); 
		
		HttpClientContext context = HttpClientContext.create(); 
		context.setCredentialsProvider(credsProvider); 
		context.setAuthCache(authCache); 
		
		DefaultHttpClient client = new DefaultHttpClient(); 
		
		try { 
			HttpPost httpPost = new HttpPost(url); 
			httpPost.setHeader("Content-type", "application/json; charset=utf-8"); 
			
			//문자에 대한 정보 
			String json = "{\"sender\":\"01021735831\",\"receivers\":[\"" + receiver 
					+ "\"],\"content\":\"발자취 프로젝트 본인인증 메세지 입니다. 인증번호 : "+rand+"\"}"; 
			
			StringEntity se = new StringEntity(json, "UTF-8"); 
			httpPost.setEntity(se); 
			HttpResponse httpResponse = client.execute(httpPost, context); 
			
			InputStream inputStream = httpResponse.getEntity().getContent(); 
			if (inputStream != null) { 
				BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream)); 
				String line = ""; 
				while ((line = bufferedReader.readLine()) != null) 
					log.info("line : " + line);
					inputStream.close(); 
				}
			return "true";
			
		} catch (Exception e) { 
			log.info("Exception : " + e);
			return "false";
		} finally { 
			client.getConnectionManager().shutdown(); 
		}
	}
	@ResponseBody 
	@RequestMapping("smsCheck") 
	public String smsCheck(String receiver, String code) { 
		String saveCode = service.getCode(receiver);//데이터베이스에 저장된 코드 불러오기 
				
		if(code.equals(saveCode)) { 
			service.removeCode(receiver);
			return "ok"; 
		}else { 
			return "no"; 
		} 
	}
	
}