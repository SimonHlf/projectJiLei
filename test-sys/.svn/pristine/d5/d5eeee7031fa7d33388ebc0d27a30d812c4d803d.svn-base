package cn.windy.module.core.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class BaseController {

    public HttpServletRequest getRequest(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    public HttpServletResponse getResponse(){
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
    }

    public HttpSession getSession(){
        return getRequest().getSession();
    }

    public void putSession(String key,Object obj){
        getSession().setAttribute(key,obj);
    }

    public Object getSession(String key){
        return getSession().getAttribute(key);
    }
    
  //用户经纬度信息
    public Map<String,Lbs> lbsMap = new HashMap<>();

    public class Lbs{
        private String longitude;
        private String latitude;

        public Lbs(String longitude, String latitude) {
            this.longitude = longitude;
            this.latitude = latitude;
        }

        public String getLongitude() {
            return longitude;
        }

        public void setLongitude(String longitude) {
            this.longitude = longitude;
        }

        public String getLatitude() {
            return latitude;
        }

        public void setLatitude(String latitude) {
            this.latitude = latitude;
        }

        @Override
        public String toString() {
            return "Lbs{" +
                    "longitude='" + longitude + '\'' +
                    ", latitude='" + latitude + '\'' +
                    '}';
        }
    }

}
