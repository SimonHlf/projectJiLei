package cn.windy.exception;

/**
 * 此类为所有windy项目中异常的父类
 * @author zhangzunwei:1760708176@qq.com
 *
 */
public class WindyException extends RuntimeException {

    public WindyException(){}

    public WindyException(String message){
        super(message);
    }

}
