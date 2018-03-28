package cn.windy.util;

import org.apache.http.HttpEntity;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class HttpUtil {

    private static Logger log = LoggerFactory.getLogger(HttpUtil.class);

    /**
     *  参考当前类的main方法
     * @param url
     * @param entity 请使用UrlEncodedFormEntity或者ByteArrayEntity
     *               UrlEncodedFormEntity将参数作为url的一部分传递
     *               ByteArrayEntity将参数作为请求体
     * @return
     */
    public static String execute(String url,HttpEntity entity){
        log.info("HttpUtil:{}",url);
        HttpPost httpPost = new HttpPost(url);
        return execute(httpPost,entity,false);
    }

    public static String execute(HttpRequest request, HttpEntity entity,boolean isUploadFile){
        CloseableHttpClient httpClient = HttpClients.createDefault();

        ResponseHandler<String> responseHandler = new ResponseHandler<String>() {

            public String handleResponse(
                    final HttpResponse response) throws IOException {
                int status = response.getStatusLine().getStatusCode();
                if (status >= 200 && status < 300) {
                    HttpEntity entity = response.getEntity();
                    return entity != null ? EntityUtils.toString(entity, "UTF-8") : null;
                } else {
                    throw new ClientProtocolException("Unexpected response status: " + status);
                }
            }

        };

        //发送http请求
        String responseBody = null;
        try {
            if(request instanceof HttpPost){
                HttpPost httpPost = (HttpPost)request;
                if(entity != null)
                    httpPost.setEntity(entity);

                //如果不上传文件请使用此行代码，如果不使用，可能无法获取参数
                if(!isUploadFile)
                    httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded");

                responseBody = httpClient.execute(httpPost,responseHandler);
            }else if(request instanceof HttpGet){
                HttpGet httpGet = (HttpGet)request;
                responseBody = httpClient.execute(httpGet,responseHandler);
            }

            log.info("HttpUtil-return:{}",responseBody);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responseBody;
    }

    /**
     * 将list转化为xml文档，父标签为xml
     * @param nvps
     * @return
     */
    public static String toXml(List<NameValuePair> nvps){
        StringBuilder xml = new StringBuilder("<xml>");
        for(NameValuePair nvp:nvps){
            xml.append("<"+nvp.getName()+">");
            xml.append(nvp.getValue());
            xml.append("</"+nvp.getName()+">");
        }
        return xml.append("</xml>").toString();
    }

    /**
     * 将list转化为url地址
     * @param nvps
     * @return
     */
    public static String toUrl(List<NameValuePair> nvps){
        StringBuilder xml = new StringBuilder();
        for(NameValuePair nvp:nvps){
            xml.append(nvp.getName()+"=");
            xml.append(nvp.getValue()+"&");
        }
        return xml.toString();
    }

    public static ByteArrayEntity get(String body){
        try {
            return new ByteArrayEntity(body.getBytes("utf-8"));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static UrlEncodedFormEntity get(List<NameValuePair> nvps) throws Exception {
        return new UrlEncodedFormEntity(nvps, "utf-8");
    }

}
