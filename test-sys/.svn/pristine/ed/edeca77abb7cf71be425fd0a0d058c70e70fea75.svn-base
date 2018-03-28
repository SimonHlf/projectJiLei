package cn.windy.module.util;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.log4j.Logger; 

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;


/**
 * 创建word文档 步骤: 1,建立文档 2,创建一个书写器 3,打开文档 4,向文档中写入数据 5,关闭文档
 */
public class WordDemo {
	/** 日志记录器 */     
    static private Logger logger = Logger.getLogger(WordDemo.class);
	
	
	
	// word文档
	private Dispatch doc;
	public Dispatch getDoc() {
		return doc;
	}

	// word运行程序对象
	private ActiveXComponent word;
	public ActiveXComponent getWord() {
		return word;
	}


	// 所有word文档集合
	private Dispatch documents;
	// 选定的范围或插入点
	private Dispatch selection;
	

	private boolean saveOnExit = true;

	/**
	 * @param visible
	 *            true表示word应用程序可见
	 */
	public WordDemo(boolean visible) {
		// TODO Auto-generated constructor stub
		if (word == null) {
			word = new ActiveXComponent("Word.Application");
			word.setProperty("Visible", new Variant(visible));
		}
		if (documents == null)
			documents = word.getProperty("Documents").toDispatch();
	}

	/**
	 * 创建一个新的word文档
	 */
	public void createNewDocument() {
		doc = Dispatch.call(documents, "Add").toDispatch();
		selection = Dispatch.get(word, "Selection").toDispatch();
	}

	/**
	 * 打开一个已存在的文档
	 * 
	 * @param docPath
	 */
	public void openDocument(String docPath) {
		closeDocument();
		doc = Dispatch.call(documents, "Open", docPath).toDispatch();
		selection = Dispatch.get(word, "Selection").toDispatch();
	}

	/**
	 * 把选定的内容或插入点向上移动
	 * 
	 * @param pos
	 *            移动的距离
	 */
	public void moveUp(int pos) {
		if (selection == null)
			selection = Dispatch.get(word, "Selection").toDispatch();
		for (int i = 0; i < pos; i++)
			Dispatch.call(selection, "MoveUp");
	}
	public Dispatch getSelection() {
		return selection;
	}

	/**
	 * 把选定的内容或者插入点向下移动
	 * 
	 * @param pos
	 *            移动的距离
	 */
	public void moveDown(int pos) {
		if (selection == null)
			selection = Dispatch.get(word, "Selection").toDispatch();
		for (int i = 0; i < pos; i++)
			Dispatch.call(selection, "MoveDown");
	}

	/**
	 * 把选定的内容或者插入点向左移动
	 * 
	 * @param pos
	 *            移动的距离
	 */
	public void moveLeft(int pos) {
		if (selection == null)
			selection = Dispatch.get(word, "Selection").toDispatch();
		for (int i = 0; i < pos; i++) {
			Dispatch.call(selection, "MoveLeft");
		}
	}

	
	
	/**    
     * 回车键    
     */     
    public void enterDown(int count){      
              
        logger.debug("按回车键...");      
        for(int i = 0;i < count;i++) {      
            Dispatch.call(this.selection, "TypeParagraph");      
        }      
    } 
	
	
	
	
	/**
	 * 从选定内容或插入点开始查找文本
	 * 
	 * @param selection
	 *            选定内容
	 * @param toFindText
	 *            要查找的文本
	 * @return true：查找到并选中该文本；false：未查找到文本。
	 */
	public boolean find(Dispatch selection, String toFindText) {
		// 从selection所在位置开始查询
		moveStart();
		Dispatch find = Dispatch.call(selection, "Find").toDispatch();
		// 设置要查找的内容
		Dispatch.put(find, "Text", toFindText);
		// 向前查找
		Dispatch.put(find, "Forward", "True");
		// 设置格式
		Dispatch.put(find, "format", "True");
		// 大小写匹配
		/* Dispatch.put(find, "MatchCase", "False"); */
		// 全字匹配
		/*Dispatch.put(find, "MatchWholeWord", "True");*/
		// 查找并选中
		return Dispatch.call(find, "Execute").getBoolean();
	}

	/**
	 * 把选定的内容或者插入点向右移动
	 * 
	 * @param pos
	 *            移动的距离
	 */
	public void moveRight(int pos) {
		if (selection == null)
			selection = Dispatch.get(word, "Selection").toDispatch();
		for (int i = 0; i < pos; i++)
			Dispatch.call(selection, "MoveRight");
	}

	/**
	 * 把插入点移动到文件首位置
	 */
	public void moveStart() {
		if (selection == null)
			selection = Dispatch.get(word, "Selection").toDispatch();
		Dispatch.call(selection, "HomeKey", new Variant(6));
	}

	public void moveEnd() {
		if (selection == null)
			selection = Dispatch.get(word, "Selection").toDispatch();
		Dispatch.call(selection, "EndKey", new Variant(6));
	}

	/**
	 * 向 document 中插入文本内容
	 * 
	 * @param textToInsert
	 *            插入的文本内容
	 */
	public void insertText(String textToInsert) {
		// 在指定的位置插入文本内容
		Dispatch.put(selection, "Text", textToInsert);
		// 取消选中,应该就是移动光标
		Dispatch format = Dispatch.get(selection, "ParagraphFormat").toDispatch();
		// 设置段落格式为首行缩进2个字符
		Dispatch.put(format, "CharacterUnitFirstLineIndent", new Variant(2));
		Dispatch.call(selection, "MoveRight", new Variant(1), new Variant(1));
		// moveRight(1);
		Dispatch.call(selection, "TypeParagraph");// 插入一个空行
		// Dispatch.call(selection, "MoveUp");
		// moveDown(1);
	}

	/**
	 * 插入标题
	 * 
	 * @param num
	 *            标题编号
	 * @param level
	 *            标题级别：-2：一级标题；-3：二级标题；-4：三级标题；-5：四级标题
	 * @param text
	 *            标题题目
	 */
	public void insertTitle(String num, int level, String text) {
		Dispatch activeDocument = Dispatch.get(word, "ActiveDocument").toDispatch();

		// Dispatch.call(selection, "TypeParagraph");// 插入一个空行
		// moveDown(1);
		Dispatch.put(selection, "Text", num + " " + text);
		Dispatch style = Dispatch.call(activeDocument, "Styles", new Variant(level)).toDispatch();
		Dispatch alignment = Dispatch.get(selection, "ParagraphFormat").toDispatch();// 段落格式
		Dispatch.put(alignment, "Alignment", "1"); // (1:置中 2:靠右 3:靠左)
		/*Dispatch.put(selection, "Style", style);*/
		moveRight(1);
		Dispatch.call(selection, "TypeParagraph");// 插入一个空行
		// moveDown(1);
	}

	/**
	 * 创建目录
	 */
	public void createCatalog() {
		Dispatch activeDocument = Dispatch.get(word, "ActiveDocument").toDispatch();

		/*Dispatch.call(selection, "HomeKey", new Variant(6)); */// 将光标移到文件首的位置
		Dispatch.call(selection, "TypeParagraph");// 插入一个空行
		moveUp(1);

		Dispatch.put(selection, "Text", "目录");
		/*Dispatch.call(selection, "TypeParagraph");*/
		Dispatch style = Dispatch.call(activeDocument, "Styles", new Variant(-2)).toDispatch();
		
		/*Dispatch.put(selection, "Style", style);*/
		Dispatch alignment = Dispatch.get(selection, "ParagraphFormat").toDispatch();// 段落格式
		Dispatch.put(alignment, "Alignment", "1"); // (1:置中 2:靠右 3:靠左)
		moveRight(1);
		Dispatch.call(selection, "TypeParagraph");// 插入一个空行

		Dispatch myRange = Dispatch.call(selection, "Range").toDispatch();

		/** 获取目录 */
		Dispatch tablesOfContents = Dispatch.get(activeDocument, "TablesOfContents").toDispatch();

		Dispatch add = Dispatch.call(tablesOfContents, "Add", myRange, new Variant(true), new Variant(1),
				new Variant(3), new Variant(true), new Variant(true), new Variant('T'), new Variant(true)).toDispatch();

		 Dispatch.put(add, "RightAlignPageNumbers", new Variant(true));
		 Dispatch.put(add, "UseHeadingStyles", new Variant(true));
		 Dispatch.put(add, "UpperHeadingLevel", new Variant(1));
		 Dispatch.put(add, "LowerHeadingLevel", new Variant(3));
		 Dispatch.put(add, "IncludePageNumbers", new Variant(true));
		 Dispatch.put(add, "UseHyperlinks", new Variant(true));
		 Dispatch.put(add, "HidePageNumbersInWeb", new Variant(true));

/*		 Dispatch.call(add, "Add", myRange);*/

		// 插入一个分页符
	/*	Dispatch.call(selection, "InsertBreak", new Variant(7));
		Dispatch.call(selection, "TypeBackspace");*/
	}
	public void juzhongxianshi(){
		Dispatch activeDocument = Dispatch.get(word, "ActiveDocument").toDispatch();
		Dispatch style = Dispatch.call(activeDocument, "Styles", new Variant(-2)).toDispatch();
		Dispatch.put(selection, "Style", style);
		Dispatch alignment = Dispatch.get(selection, "ParagraphFormat").toDispatch();// 段落格式
		Dispatch.put(alignment, "Alignment", "1"); // (1:置中 2:靠右 3:靠左)
	}

	/**
	 * 更新目录
	 * 
	 * @param outputPath
	 * @param doc
	 */
	public void updateCatalog() {
		/** 打开word文档 */
		// Dispatch doc = Dispatch.invoke(documents, "Open", Dispatch.Method,
		// new Object[] { outputPath, new Variant(false), new Variant(true) },
		// new int[1]).toDispatch();
		// Dispatch doc = Dispatch.call(documents, "Open",
		// outputPath).toDispatch();

		Dispatch activeDocument = word.getProperty("ActiveDocument").toDispatch();
		/** 获取目录 */
		Dispatch tablesOfContents = Dispatch.get(activeDocument, "TablesOfContents").toDispatch();
		/** 获取第一个目录。若有多个目录，则传递对应的参数 */
		Variant tablesOfContent = Dispatch.call(tablesOfContents, "Item", new Variant(1));
		/** 更新目录，有两个方法：Update 更新域，UpdatePageNumbers 只更新页码 */
		Dispatch toc = tablesOfContent.toDispatch();
		toc.call(toc, "Update");

	/*	*//** 另存为 *//*
		Dispatch.call((Dispatch) Dispatch.call(word, "WordBasic").getDispatch(), "FileSaveAs", outputPath);
		// System.out.println("更新目录");
		*//** 关闭word文档 *//*
		Dispatch.call(doc, "Close", new Variant(false));

		*//** 退出word进程 *//*
		close();*/
	}
	
	public void nextPage()  
		    throws Exception  
		{  
		   
		   
		 Dispatch.call(selection, "EndKey", new Variant(6));  
		// 插入分页符  
		Dispatch.call(selection,  "InsertBreak" ,  new Variant(7) );   
		}  
	

	/**
	 * 在当前插入点插入图片
	 * 
	 * @param imagePath
	 *            图片路径
	 */
	public void insertImage(String imagePath) {
		Dispatch.call(selection, "TypeParagraph");
		Dispatch.call(Dispatch.get(selection, "InLineShapes").toDispatch(), "AddPicture", imagePath);
	
		Dispatch.call(selection, "TypeParagraph");// 插入一个空行
		Dispatch alignment = Dispatch.get(selection, "ParagraphFormat").toDispatch();// 段落格式
		Dispatch.put(alignment, "Alignment", "3"); // (1:置中 2:靠右 3:靠左)
		
		/*Dispatch.put(alignment, "Width", new Variant(250));
		Dispatch.put(alignment, "Height", new Variant(240));*/
		// moveRight(1);
		/*putText("图" + c + "-" + tc + " " + title);*/
		moveRight(1);
		Dispatch.call(selection, "TypeParagraph");// 插入一个空行
	}

	
	
	/**
	* 像word中插入图片
	* @param imagePath 图片路径
	* @param width 宽度
	* @param height 高度
	*/
	/*public void insertImage(String imagePath,int width,int height)
	{
	Dispatch picture = Dispatch.call(Dispatch.get(selection, "InLineShapes").toDispatch(), "AddPicture", imagePath).toDispatch();
	Dispatch.put(picture, "Width", new Variant(width));
	Dispatch.put(picture, "Height", new Variant(height));
	}*/
	
	
	
	
	
	public void insertBlankRow() {
		Dispatch.call(selection, "TypeParagraph");// 插入一个空行
		Dispatch alignment = Dispatch.get(selection, "ParagraphFormat").toDispatch();// 段落格式
		Dispatch.put(alignment, "Alignment", "3"); // (1:置中 2:靠右 3:靠左)
	}

	/**
	 * 创建表格
	 * 
	 * @param cols
	 *            列数
	 * @param rows
	 *            行数
	 */
	public void createTable(int numCols, int numRows) {
		// Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
		// Dispatch range = Dispatch.get(selection, "Range").toDispatch();
		// Dispatch newTable = Dispatch.call(tables, "Add", range, new
		// Variant(numRows), new Variant(numCols))
		// .toDispatch();
		// Dispatch.call(selection, "MoveRight");
		// moveEnd();

		/*Dispatch.call(selection, "TypeParagraph");*/// 插入一个空行
		Dispatch alignment = Dispatch.get(selection, "ParagraphFormat").toDispatch();// 段落格式
		Dispatch.put(alignment, "Alignment", "1"); // (1:置中 2:靠右 3:靠左)
		/* putText("表" + c + "-" + tc + " " + title); */
		moveRight(1);
		/*Dispatch.call(selection, "TypeParagraph");// 插入一个空行
*/
		Dispatch activeDocument = Dispatch.get(word, "ActiveDocument").toDispatch();
		Dispatch tables1 = Dispatch.get(activeDocument, "Tables").toDispatch();

		Dispatch range = Dispatch.get(selection, "Range").toDispatch();
		Dispatch.call(tables1, "Add", range, new Variant(numRows), new Variant(numCols), new Variant(1), new Variant(0))
				.toDispatch();

		Dispatch.call(selection, "MoveDown", new Variant(5), new Variant(numRows), new Variant(1));
		Dispatch format = Dispatch.get(selection, "ParagraphFormat").toDispatch();
		Dispatch.put(format, "Alignment", new Variant(1));

		moveLeft(1);
	}

	/**
	 * 向选中的单元格中写入数据
	 * 
	 * @param text
	 */
	public void putText(String text) {
		Dispatch.put(selection, "Text", text);
	}

	/**
	 * 增加一行
	 * 
	 * @param tableIndex
	 *            word文档中的第N张表(从1开始)
	 */
	public void addRow(int tableIndex) {
		Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
		// 要填充的表格
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex)).toDispatch();
		// 表格的所有行
		Dispatch rows = Dispatch.get(table, "Rows").toDispatch();
		Dispatch.call(rows, "Add");
	}

	/**
	 * 合并单元格
	 * 
	 * @param tableIndex
	 * @param fstCellRowIdx
	 * @param fstCellColIdx
	 * @param secCellRowIdx
	 * @param secCellColIdx
	 */
	public void mergeCell(int tableIndex, int fstCellRowIdx, int fstCellColIdx, int secCellRowIdx, int secCellColIdx) {
		// 所有表格
		Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
		// 要填充的表格
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex)).toDispatch();
		Dispatch fstCell = Dispatch.call(table, "Cell", new Variant(fstCellRowIdx), new Variant(fstCellColIdx))
				.toDispatch();
		Dispatch secCell = Dispatch.call(table, "Cell", new Variant(secCellRowIdx), new Variant(secCellColIdx))
				.toDispatch();
		Dispatch.call(fstCell, "Merge", secCell);
	}

	/**
	 * 在指定的单元格里填写数据
	 * 
	 * @param tableIndex
	 * @param cellRowIdx
	 * @param cellColIdx
	 * @param txt
	 */
	public void putTxtToCell(int tableIndex, int cellRowIdx, int cellColIdx, String txt) {
		// 所有表格
		Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
		// 要填充的表格
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex)).toDispatch();
		Dispatch cell = Dispatch.call(table, "Cell", new Variant(cellRowIdx), new Variant(cellColIdx)).toDispatch();
		Dispatch.call(cell, "Select");
		Dispatch.put(selection, "Text", txt);
	}

	/**
	 * 增加一列
	 * 
	 * @param tableIndex
	 *            word文档中的第N张表(从1开始)
	 */
	public void addCol(int tableIndex) {
		// 所有表格
		Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
		// 要填充的表格
		Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex)).toDispatch();
		// 表格的所有行
		Dispatch cols = Dispatch.get(table, "Columns").toDispatch();
		Dispatch.call(cols, "Add").toDispatch();
		Dispatch.call(cols, "AutoFit");
	}

	/**
	 * 设置当前选定内容的字体
	 * 
	 * @param boldSize
	 * @param italicSize
	 * @param underLineSize
	 *            下划线
	 * @param colorSize
	 *            字体颜色
	 * @param size
	 *            字体大小
	 * @param name
	 *            字体名称
	 */
	public void setFont(boolean bold, boolean italic, boolean underLine, String colorSize, String size, String name) {
		Dispatch font = Dispatch.get(selection, "Font").toDispatch();
		Dispatch.put(font, "Name", new Variant(name));//样式名称
		Dispatch.put(font, "Bold", new Variant(bold));//是否是黑体
		Dispatch.put(font, "Italic", new Variant(italic));//是否斜体
		Dispatch.put(font, "Underline", new Variant(underLine));//是否加下划线
/*		Dispatch.put(font, "Color", colorSize);*/
		Dispatch.put(font, "Size", size);//字体大小
	}
	public void setFont(boolean bold, boolean italic, boolean underLine, String colorSize, String size, int name) {
		Dispatch font = Dispatch.get(selection, "Font").toDispatch();
		Dispatch.put(font, "Name", new Variant(name));
		Dispatch.put(font, "Bold", new Variant(bold));
		Dispatch.put(font, "Italic", new Variant(italic));
		Dispatch.put(font, "Underline", new Variant(underLine));
		Dispatch.put(font, "Color", colorSize);
		Dispatch.put(font, "Size", size);
	}

	/**
	 * 文件保存或另存为
	 * 
	 * @param savePath
	 *            保存或另存为路径
	 */
	public void save(String savePath) {
		Dispatch.call((Dispatch) Dispatch.call(word, "WordBasic").getDispatch(), "FileSaveAs", savePath);
	}

    /** *//** 
     * 自动调整表格 
     *     
     */ 
    @SuppressWarnings("deprecation")
	public void autoFitTable() { 
            Dispatch tables = Dispatch.get(doc, "Tables").toDispatch(); 
            int count = Dispatch.get(tables, "Count").toInt(); 
            for (int i = 0; i <count; i++) { 
                    Dispatch table = Dispatch.call(tables, "Item", new Variant(i + 1)) 
                                    .toDispatch(); 
                    Dispatch cols = Dispatch.get(table, "Columns").toDispatch(); 
                    Dispatch.call(cols, "AutoFit"); 
            } 
    } 
	
    
	
	/**
	 * 关闭当前word文档
	 */
	public void closeDocument() {
		if (doc != null) {
			Dispatch.call(doc, "Save");
			Dispatch.call(doc, "Close", new Variant(saveOnExit));
			doc = null;
		}
	}

	/**
	 * 全局替换
	 * 
	 * @param selection
	 * @param oldText
	 * @param replaceObj
	 */
	public void replaceAll(Dispatch selection, String oldText, Object replaceObj) {
		moveStart();
		String newText = (String) replaceObj;
		while (find(selection, oldText)) {
			replace(selection, newText);
			Dispatch.call(selection, "MoveRight");
		}
	}

	public void replace(Dispatch selection, String newText) {
		Dispatch.put(selection, "Text", newText);
	}

	/**
	 * 关闭全部应用
	 */
	public void close() {
		closeDocument();
		if (word != null) {
			Dispatch.call(word, "Quit");
			word = null;
		}
		selection = null;
		documents = null;
	}

	public static void main(String[] args) {
		// 替换内容
		WordDemo wordDemo = new WordDemo(true);
		wordDemo.openDocument("E:\\0143.doc");
		/* wordDemo.find(wordDemo.selection,"张三李四"); */
		wordDemo.replaceAll(wordDemo.selection, "中国银行", "12345");
		// 添加图片
		wordDemo.moveStart();
		wordDemo.find(wordDemo.selection, "图片");
		wordDemo.insertImage("C:\\Users\\Administrator\\Desktop\\ehr\\3314.jpg");
		wordDemo.moveStart();
		wordDemo.find(wordDemo.selection, "表格1");
		Dispatch.call(wordDemo.selection, "TypeParagraph");
		wordDemo.createTable(5, 10);// 根据数据来直接创建好多少行多少列5 20 列 行
		wordDemo.putTxtToCell(1, 1, 1, "1");
		wordDemo.setFont(false, false, false, "", "11", "宋体");
		wordDemo.putTxtToCell(1, 1, 2, "管理");
		wordDemo.setFont(false, false, false, "", "11", "宋体");
		wordDemo.putTxtToCell(1, 1, 3, "管理");
		wordDemo.setFont(false, false, false, "", "11", "宋体");
		wordDemo.putTxtToCell(1, 1, 4, "管理");
		wordDemo.setFont(false, false, false, "", "11", "宋体");
		wordDemo.putTxtToCell(1, 1, 5, "职务名称");
		wordDemo.setFont(false, false, false, "", "11", "宋体");
		//表内容
		int flay=2;
		//if(child.size()>2) size()/2+1
		wordDemo.putTxtToCell(1, flay, 1, "01");
		wordDemo.putTxtToCell(1, flay, 2, "管理");
		
		wordDemo.putTxtToCell(1, flay, 3, "管理");
		wordDemo.putTxtToCell(1, flay, 4, "管理");
		wordDemo.putTxtToCell(1, flay, 5, "管理");//child.get(0)
		wordDemo.mergeCell(1, flay, 1, 9, 2);
		//判断child个数 list.size();表示需要合并的个数
		//wordDemo.mergeCell(1, flay, 1, flay+list.size()-1, 1);// 合并哪一行那一列
		//wordDemo.mergeCell(1, flay, 1, flay+list.size()-1, 1);// 合并哪一行那一列
		/*if (child.size()>1) {
		 * for(int i=1;i<size())
			wordDemo.putTxtToCell(1, flay+i, 3, "管理");
			wordDemo.putTxtToCell(1, flay+i, 4, "管理");
			wordDemo.putTxtToCell(1, flay+i, 5, "管理");
		}
		flay+=list.size();
		*/
	/*	wordDemo.createCatalog();*/
		wordDemo.save("E:\\word1.doc");
		
		/*Object oSelection = wordDemo.getWord().getProperty("Selection").toDispatch();

		Object oFind =wordDemo.getWord().call((Dispatch) oSelection, "Find").toDispatch();

		Object alignment = Dispatch.get((Dispatch)oSelection, "ParagraphFormat").toDispatch();
		Object image = Dispatch.get((Dispatch)oSelection, "InLineShapes").toDispatch();

		//取得活动内容对象
		Object ActiveDocument = wordDemo.getWord().getProperty("ActiveDocument").toDispatch();
		//取得活动窗体对象
		Object ActiveWindow = wordDemo.getWord().getProperty("ActiveWindow").toDispatch();
		//取得活动窗格对象
		Object ActivePane = Dispatch.get((Dispatch) ActiveWindow, "ActivePane").toDispatch();
		//取得视窗对象
		Object View = Dispatch.get((Dispatch) ActivePane, "View").toDispatch();
		
		Dispatch.put((Dispatch) View, "SeekView", "9");
		Dispatch.put((Dispatch) oSelection, "Text", "页眉你出来吧！！	");
		Dispatch.call((Dispatch) oSelection, "MoveRight");
		Dispatch.call((Dispatch)image, "AddPicture", "d:\\321456.jpg");
		*/
		

	}
}