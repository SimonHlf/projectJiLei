package cn.windy.module.examination.service.cache;

import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.examination.mybatis.model.PaperCreat;
import cn.windy.module.examination.service.PaperCreatService;
import cn.windy.module.examination.service.QuesTypeService;
import cn.windy.module.util.WindyConstants;
import cn.windy.util.spring.SpringUtil;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
public class creatListCache {


    public static List<PaperCreat> findAllSelectTwo() {
        PaperCreatService paperCreatService= SpringUtil.getBean("paperCreatService");
        User user = (User) getSession(WindyConstants.SESSION_USER);
        QuesTypeService quesTypeService = SpringUtil.getBean("quesTypeService");
        boolean s=quesTypeService.getRole(user.getId());
        List<PaperCreat> list;
        if(s){
            list = paperCreatService.findAllSelectTwo(null);
        } else {
            list = paperCreatService.findAllSelectTwo(user.getUpdateUser());
        }
        return list;
    }

    public static HttpServletRequest getRequest(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }


    public static HttpSession getSession(){
        return getRequest().getSession();
    }

    public static Object getSession(String key){
        return getSession().getAttribute(key);
    }




}
