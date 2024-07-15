package com.kh.redclip.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.kh.redclip.barter.model.dao.BarterMapper;
import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.member.model.dao.MemberMapper;
import com.kh.redclip.member.model.vo.BlockMember;
import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.region.model.vo.Region;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;
	private final BarterMapper barterMapper;

	@Override
	public int idCheck(String userId) {
		return memberMapper.checkId(userId);
	}
	
	
	@Override
	public int nickCheck(String userNick) {
		return memberMapper.checkNick(userNick);
	}


	@Override
	public Member login(Member member) {
		return memberMapper.login(member);
	}

	@Override
	public int update(Member member) {
		return memberMapper.update(member);
	}

	@Override
	public int changeStatus(String userId) {
		return memberMapper.changeStatus(userId);
	}

	@Override
	public int delete(String userId) {
		return memberMapper.delete(userId);
	}

	@Override
	public int insertAdmin(Member member) {
		return memberMapper.insertAdmin(member);
	}

	@Override
	public List<Region> selectgu(int cityCode) {
		return memberMapper.selectgu(cityCode);
	}


	@Override
	public List<Region> selectdong(int townCode) {
		return memberMapper.selectdong(townCode);
	}


	@Override
	public int insert(Member member) {
		return memberMapper.insertMember(member);
		
	}
	


	@Override
	public List<Barter> selectById(String userId) {
		return memberMapper.selectById(userId);
	}

	
	public String searchid(Member member) {
		return memberMapper.searchid(member);
	}


	@Override

	public String getToken(String code) throws IOException, ParseException  {
	
		String tokenUrl = "https://kauth.kakao.com/oauth/token";
		URL url = new URL(tokenUrl);
		HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();

		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);
		
		BufferedWriter bw =
							new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		
		StringBuilder sb = new StringBuilder();
		sb.append("client_id=dd2c51ceb08c2d3fd9f505935aa18931");
		sb.append("&grant_type=authorization_code");
		sb.append("&redirect_uri=http://localhost/redclip/member/oauth");
		sb.append("&code=");
		sb.append(code);
		
		bw.write(sb.toString());
		bw.flush();
		
		BufferedReader br = 
			    new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			String line = "";
			String responseData = "";

			while ((line = br.readLine()) != null) {
			    responseData += line;
			}
			
			log.info("겟토큰 리스폰{}",responseData);
			JSONParser parser = new JSONParser();
			JSONObject element = (JSONObject)parser.parse(responseData);

			String accessToken = element.get("access_token").toString();

			br.close();
			bw.close();

			return accessToken;

	}
	public List<BlockMember> selectByBlock(String userId) {
		return memberMapper.selectByBlock(userId);

	}


	@Override

	public void kakaoLogout(String accessToken) throws IOException {
		String logoutUrl = "https://kapi.kakao.com/v1/user/logout";
		URL url;
		HttpURLConnection conn;


		    url = new URL(logoutUrl);
		    conn = (HttpURLConnection)url.openConnection();
		    conn.setRequestMethod("POST");
		    conn.setRequestProperty("Authorization", "Bearer " + accessToken);
		    
		    BufferedReader br = 
		    		new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    
		    String responseData = "";
		    String line = "";
		    while((line = br.readLine()) != null) {
		        responseData = line;
		        
		        log.info("로그아웃 리스폰스데이타{}",responseData);
		    }



	}

	//소셜로그인 유저 정보가져오기
	@Override
	public void getUserInfo(String accessToken) {
		
		String userInfoUrl = "https://kapi.kakao.com/v2/user/me";

		try {
		    URL url = new URL(userInfoUrl);
		    HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		    urlConnection.setRequestMethod("GET");
		    urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);

		    BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));

		    String responseData = br.readLine();

		    log.info("유저인포 {}",responseData);

		    
		} catch (MalformedURLException e) {
		    e.printStackTrace();
		} catch (IOException e) {
		    e.printStackTrace();
		}

		
	}

	public int deleteByBlock(String usreId) {
		return memberMapper.deleteByBlock(usreId);
	}


	
}
