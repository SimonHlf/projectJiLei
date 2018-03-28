package cn.windy.module.admin.controller;

import cn.windy.annotation.Cache;
import cn.windy.util.scan.ScanAllClasses;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

@Controller
@RequestMapping("/admin/cache")
public class ClearCacheController extends AdminBaseController {

    @RequestMapping("/clear")
    public String clear(ModelMap mm){
        ScanAllClasses sac = new ScanAllClasses("cn.windy");
        List<Class<?>> list = sac.get();
        for (Class<?> clazz : list) {
            Cache cache = clazz.getAnnotation(Cache.class);
            if(cache!=null){
                try {
                    Method method = clazz.getDeclaredMethod("clear");
                    method.invoke(null); //因为是静态方法，所以这个参数可以传入null
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }
        mm.put("message","已经清除所有缓存。");
        return "return/json";
    }
}
