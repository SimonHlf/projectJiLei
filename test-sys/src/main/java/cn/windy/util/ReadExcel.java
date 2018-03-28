package cn.windy.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class ReadExcel {
    //总行数
    private int totalRows = 0;
    //总条数  
    private int totalCells = 0;
    //错误信息接收器  
    private String errorMsg;

    private boolean cmd;

    //构造方法  
    public ReadExcel() {
    }

    //获取总行数  
    public int getTotalRows() {
        return totalRows;
    }

    //获取总列数  
    public int getTotalCells() {
        return totalCells;
    }

    //获取错误信息  
    public String getErrorInfo() {
        return errorMsg;
    }

    /**
     * 读EXCEL文件，获取信息集合
     *
     * @param cmd 0为用户 1为试题
     * @return
     */
    public List<Map<String, Object>> getExcelInfo(MultipartFile mFile, int cmd) {
        if (cmd == 1) {
            this.cmd = true;
        } else {
            this.cmd = false;
        }
        String fileName = mFile.getOriginalFilename();//获取文件名  
        try {
            if (!validateExcel(fileName)) {// 验证文件名是否合格  
                return null;
            }
            boolean isExcel2003 = true;// 根据文件名判断文件是2003版本还是2007版本  
            if (isExcel2007(fileName)) {
                isExcel2003 = false;
            }
            List<Map<String, Object>> maps = createExcel(mFile.getInputStream(), isExcel2003);
            return maps;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    /**
     * 根据excel里面的内容读取客户信息
     *
     * @param is          输入流
     * @param isExcel2003 excel是2003还是2007版本
     * @return
     * @throws IOException
     */
    public List<Map<String, Object>> createExcel(InputStream is, boolean isExcel2003) {
        try {
            Workbook wb = null;
            if (isExcel2003) {// 当excel是2003时,创建excel2003  
                wb = new HSSFWorkbook(is);
            } else {// 当excel是2007时,创建excel2007  
                wb = new XSSFWorkbook(is);
            }  
            /*List<User> userList = readExcelValue(wb);*/
            // 读取Excel里面客户的信息  
            List<Map<String, Object>> mapList = readExcelValue(wb);
            return mapList;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;

    }

    /**
     * 读取Excel里面客户的信息
     *
     * @param wb
     * @return
     */
    private List<Map<String, Object>> readExcelValue(Workbook wb) {
        // 得到第一个shell
        Sheet sheet = wb.getSheetAt(0);
        // 得到Excel的行数  
        this.totalRows = sheet.getPhysicalNumberOfRows();
        // 得到Excel的列数(前提是有行数)  
        if (totalRows > 1 && sheet.getRow(0) != null) {
            this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
        }
        List<Map<String, Object>> list = new ArrayList<>();
        for (int r = 1; r < totalRows; r++) {
            Row row = sheet.getRow(r);
            if (row == null) {
                continue;
            }
            Map<String, Object> map = new HashMap<>();
            //为 true 是试题导入
            if (this.cmd) {
                String quesName = null;//试题名称
                String type = null;//试题类型 0单选 1多选 2判断
//                String gongiang = null;//是否共享 0共享 1不共享
                String A = null;//答案 A
                String B = null;//答案 B
                String C = null;//答案 C
                String D = null;//答案 D
                String rightKey = null;//正确答案


                for (int c = 0; c < this.totalCells; c++) {
                    Cell cell = row.getCell(c);
                    if (cell != null) {
                        switch (c){
                            case 0:
                                //如果是纯数字,比如你写的是25,cell.getNumericCellValue()获得是25.0,通过截取字符串去掉.0获得25
                                if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                    String  name = String.valueOf(cell.getNumericCellValue());
                                    quesName = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                                } else {
                                    quesName = cell.getStringCellValue();//试题名称
                                }
                                break;
                            case  1:
                                if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                    String  name = String.valueOf(cell.getNumericCellValue());
                                    type = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                                } else {
                                    type = cell.getStringCellValue();//试题类型
                                }
                                break;
                            case  2:
                                if(!type.equals("2")){
                                    if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                        String  name = String.valueOf(cell.getNumericCellValue());
                                        A = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                                    } else {
                                        A = cell.getStringCellValue();//答案 A
                                    }
                                }
                                break;
                            case  3:
                                if(!type.equals("2")){
                                    if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                        String  name = String.valueOf(cell.getNumericCellValue());
                                        B = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                                    } else {
                                        B = cell.getStringCellValue();//答案 B
                                    }
                                }
                                break;
                            case  4:
                                if(!type.equals("2")){
                                    if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                        String  name = String.valueOf(cell.getNumericCellValue());
                                        C = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                                    } else {
                                        C = cell.getStringCellValue();//答案 C
                                    }
                                }
                                break;
                            case  5:
                                if(!type.equals("2")){
                                    if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                        String  name = String.valueOf(cell.getNumericCellValue());
                                        D = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                                    } else {
                                        D = cell.getStringCellValue();//答案 D
                                    }
                                }
                                break;
                            case  6:
                                if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                    String  name = String.valueOf(cell.getNumericCellValue());
                                    rightKey = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                                } else {
                                    rightKey = cell.getStringCellValue();//正确答案
                                }
                                break;
                        }
                       /* if (c == 0) {
                            //如果是纯数字,比如你写的是25,cell.getNumericCellValue()获得是25.0,通过截取字符串去掉.0获得25
                            if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                String  name = String.valueOf(cell.getNumericCellValue());
                                quesName = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                            } else {
                                quesName = cell.getStringCellValue();//试题名称
                            }
                        }
                        if(c == 1){
                            if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                String  name = String.valueOf(cell.getNumericCellValue());
                                type = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                            } else {
                                type = cell.getStringCellValue();//试题类型
                            }
                        }*/
//                        if(c == 2){
//                            if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
//                                String  name = String.valueOf(cell.getNumericCellValue());
//                                gongiang = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
//                            } else {
//                                gongiang = cell.getStringCellValue();//是否共享
//                            }
//                        }
                        /*if(c == 2){
                            if(!type.equals("2")){
                                if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                    String  name = String.valueOf(cell.getNumericCellValue());
                                    A = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                                } else {
                                    A = cell.getStringCellValue();//答案 A
                                }
                            }
                        }
                        if(c == 3){
                            if(!type.equals("2")){
                                if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                    String  name = String.valueOf(cell.getNumericCellValue());
                                    B = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                                } else {
                                    B = cell.getStringCellValue();//答案 B
                                }
                            }
                        }
                        if(c == 4){
                            if(!type.equals("2")){
                                if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                    String  name = String.valueOf(cell.getNumericCellValue());
                                    C = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                                } else {
                                    C = cell.getStringCellValue();//答案 C
                                }
                            }
                        }
                        if(c == 5){
                            if(!type.equals("2")){
                                if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                    String  name = String.valueOf(cell.getNumericCellValue());
                                    D = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                                } else {
                                    D = cell.getStringCellValue();//答案 D
                                }
                            }
                        }
                        if(c == 6){
                            if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                String  name = String.valueOf(cell.getNumericCellValue());
                                rightKey = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//十进制
                            } else {
                                rightKey = cell.getStringCellValue();//正确答案
                            }
                        }*/

                    }
                }
                map.put("quesName", quesName);//试题名称
                map.put("type",type);//试题类型
//                map.put("gongiang",gongiang);//是否共享
                map.put("A",A);
                map.put("B",B);
                map.put("C",C);
                map.put("D",D);
                map.put("rightKey",rightKey);
                list.add(map);

            } else {// 导入考生
                String code = null;//工号
                String username = null;//姓名
                String sex = null;//性别
                String phone = null;//手机号
                String birthday = null;//生日

                for (int c = 0; c < this.totalCells; c++) {
                    Cell cell = row.getCell(c);
                    if (cell != null) {
                        if (c == 0) {
                            //如果是纯数字,比如你写的是25,cell.getNumericCellValue()获得是25.0,通过截取字符串去掉.0获得25
                            if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                String name = String.valueOf(cell.getNumericCellValue());
                                code = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//工号
                            } else {
                                code = cell.getStringCellValue();//工号
                            }
                            code = code.replace(".","");
                        } else if (c == 1) {
                            if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                String name = String.valueOf(cell.getNumericCellValue());
                                username = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//姓名
                            } else {
                                username = cell.getStringCellValue();//姓名
                            }
                        } else if (c == 2) {
                            if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                String name = String.valueOf(cell.getNumericCellValue());
                                sex = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//性别
                            } else {
                                sex = cell.getStringCellValue();//性别
                            }
                        }else if (c == 3) {
                            /*if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                String name = String.valueOf(cell.getNumericCellValue());
                                phone = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//手机号
                            } else {
                                phone = cell.getStringCellValue();//手机号
                            }*/
                            DecimalFormat df = new DecimalFormat("#");
                            phone = df.format(cell.getNumericCellValue());//手机号
                        }else if (c == 4) {
                            if (0 == cell.getCellType()) {//判断是否为日期类型
                                if(HSSFDateUtil.isCellDateFormatted(cell)){//用于转化为日期格式
                                    Date d = cell.getDateCellValue();
                                    DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
                                    birthday = formater.format(d);
                                }else{// 用于格式化数字，只保留数字的整数部分
                                    DecimalFormat df = new DecimalFormat("########");
                                    birthday = df.format(cell.getNumericCellValue());
                                }
                        }



                            /*if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                String name = String.valueOf(cell.getNumericCellValue());
                                birthday = name.substring(0, name.length() - 2 > 0 ? name.length() - 2 : 1);//生日
                            } else {
                                birthday = cell.getStringCellValue();//生日
                            }*/
                        }
                    }
                }
                map.put("code", code);//存入 map
                map.put("name", username);
                map.put("sex", sex);
                map.put("phone", phone);
                map.put("birthday", birthday);
                list.add(map);
            }
        }
        return list;
    }

    /**
     * 验证EXCEL文件
     *
     * @param filePath
     * @return
     */
    public boolean validateExcel(String filePath) {
        if (filePath == null || !(isExcel2003(filePath) || isExcel2007(filePath))) {
            errorMsg = "文件名不是excel格式";
            return false;
        }
        return true;
    }

    // @描述：是否是2003的excel，返回true是2003   
    public static boolean isExcel2003(String filePath) {
        return filePath.matches("^.+\\.(?i)(xls)$");
    }

    //@描述：是否是2007的excel，返回true是2007   
    public static boolean isExcel2007(String filePath) {
        return filePath.matches("^.+\\.(?i)(xlsx)$");
    }
}
