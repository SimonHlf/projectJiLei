package cn.windy.module.admin.controller;

import cn.windy.module.admin.hibernate.model.Role;
import cn.windy.module.admin.hibernate.model.User;
import cn.windy.module.core.controller.BaseController;
import cn.windy.module.util.WindyConstants;

import java.util.ArrayList;
import java.util.List;

public class AdminBaseController extends BaseController {

    public User getCurUser(){
        Object obj = getSession().getAttribute(WindyConstants.SESSION_USER);
        if(obj == null) return null;
        else return (User) obj;
    }

    //是否超级管理员
    public boolean isSuper(){
        List<Role> roleList = (List<Role>) getSession().getAttribute(WindyConstants.SESSION_USER_ROLE);
        if(roleList==null || roleList.size()>0) {
            for (Role role : roleList) {
                if(role.getCode().equalsIgnoreCase("super")){
                    return true;
                }
            }
        }
        return false;
    }

    public boolean isUser(){
        List<Role> roleList = (List<Role>) getSession().getAttribute(WindyConstants.SESSION_USER_ROLE);
        if(roleList==null || roleList.size()>0) {
            for (Role role : roleList) {
                if(role.getCode().equalsIgnoreCase("user")){
                    return true;
                }
            }
        }
        return false;
    }
    
    public List<Role> getRoles(){
        List<Role> roleList = (List<Role>) getSession().getAttribute(WindyConstants.SESSION_USER_ROLE);
        if(roleList!=null || roleList.size()>0) return roleList;
        return new ArrayList<>();
    }

}
