package cn.windy.module.core.spring.bean;

import cn.windy.module.util.WindyConstants;
import cn.windy.util.encrypt.MD5;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class WindySessionInterceptor extends HandlerInterceptorAdapter {
    private List<String> excludes;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String uri = httpServletRequest.getRequestURI();
        String referer = httpServletRequest.getHeader("Referer");
        //if(StringUtil.isBlank(referer) && uri.indexOf("/admin/")!=-1
        //        && !uri.equalsIgnoreCase("/admin/index.htm")){
        //    httpServletResponse.sendRedirect("/admin/index.htm");
        //    return false;
        //}
        
        if(uri.endsWith("test-sys/admin.htm")) {//只校验后台程序，前端不过滤
            
                String path = httpServletRequest.getContextPath();
                String basePath = httpServletRequest.getScheme()+"://"+httpServletRequest.getServerName()+":"+httpServletRequest.getServerPort()+path+"/";

                httpServletResponse.sendRedirect(basePath+"admin/login.jsp");
                return false;
           
        }


        if(uri.indexOf("/admin/")!=-1) {//只校验后台程序，前端不过滤
            HttpSession session = httpServletRequest.getSession();
            Object obj = session.getAttribute(WindyConstants.SESSION_USER);
            if (obj == null) {
                for (String exclude : excludes) {      
                    if (uri.indexOf(exclude) != -1) {
                        return true;
                    } else {
                        continue;
                    }
                }

                String path = httpServletRequest.getContextPath();
                String basePath = httpServletRequest.getScheme()+"://"+httpServletRequest.getServerName()+":"+httpServletRequest.getServerPort()+path+"/";

                httpServletResponse.sendRedirect(basePath+"/admin/index.htm");
                return false;
            }
        }
        return super.preHandle(httpServletRequest,httpServletResponse,o);
    }

    public List<String> getExcludes() {
        return excludes;
    }

    public void setExcludes(List<String> excludes) {
        this.excludes = excludes;
    }

    public static void main(String[] args) {
        String str = "123456";
        System.out.println(MD5.getMD5Big(str));
    }
}
