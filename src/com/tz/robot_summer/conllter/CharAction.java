package com.tz.robot_summer.conllter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/chart")
public class CharAction extends HttpServlet{
    //和前端页面交互
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String text = req.getParameter("text");
		System.out.println(text);
		String apikey="11b7e862765847c79d3da14143d39a6c";
		String success=getResponse(apikey,text);
      resp.getWriter().print(success);
	}
	 public  String getResponse(String apikey,String info){
	        String httpUrl;
	        try {
	            httpUrl = "http://www.tuling123.com/openapi/api?key=" + apikey + "&info=" + URLEncoder.encode(info,"UTF-8");
	            URL url = new URL(httpUrl);
	            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	            connection.setRequestMethod("POST");
	            connection.setReadTimeout(5000);
	            connection.setConnectTimeout(5000);
	             
	            InputStream inputStream = connection.getInputStream();
	            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream,"UTF-8"));
	            String line = "";
	            String reg = "\"text\":\"(.*)?\"}";
	            Pattern pattern = Pattern.compile(reg);
	            Matcher matcher;
	            while((line = reader.readLine()) != null){
	                matcher = pattern.matcher(line);
	                if(matcher.find()){
	                    connection.disconnect();
	                    System.out.println(matcher.group(1));
	                    return matcher.group(1);
	                }
	            }
	            connection.disconnect();   
	        } catch (UnsupportedEncodingException e1) {
	            e1.printStackTrace();
	        } catch (MalformedURLException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        return "";
	    }
}
