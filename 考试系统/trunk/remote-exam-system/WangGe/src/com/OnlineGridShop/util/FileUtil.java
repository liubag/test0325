package com.OnlineGridShop.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.struts2.ServletActionContext;

import com.OnlineGridShop.brand.Entity.BrandgridGradenote;
@SuppressWarnings({ "unchecked", "deprecation" })
public class FileUtil {
	//用于维护，若该文件不存在，则表示维护当中...
	public static String maintenanceFilePath(String gridid,
			String goodsid) {
		return ServletActionContext.getRequest().getRealPath("../webapps/WangGe/WangGe.xml");
	}
	//散租上传图片路径
	public static String getScatteredGoodsPhotoPsth(String gridid,
			String goodsid) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/goodsphotos/" + gridid + "/" + goodsid);
	}
	public static String getScatteredGoodsPhotoPsth_grid(String gridid) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/goodsphotos/" + gridid);
	}
	//散租商品详细信息图片处理路径
	public static String getScatteredGoodsXqPhotoPsth1() {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/xqphotos");
	}
	public static String getScatteredGoodsXqPhotoPsth2(String gridid,
			String goodsid) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/xqphotos/" + gridid + "/" + goodsid);
	}
	public static String getScatteredGoodsXqPhotoPsth3(String gridid) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/xqphotos/" + gridid);
	}
	//格子店格主
	public static String getGoodsPhotoPsth_gridowner(String brand_id,String gridowner_id) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/brandGoodsPH/" + brand_id + "/" + gridowner_id) ;
	}
	public static String getDeleGoodsPhotoPsth_gridowner(String brand_id,String gridowner_id,String goodsid) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/brandGoodsPH/" + brand_id + "/" + gridowner_id + "/" + goodsid);
	}
	
	//格子店格主商品详细信息图片处理路径
	public static String getDeleGoodsXqPhotoPsth2(String gridowner_id,String goodsid) {
		return "../webapps/WangGe/brandXQPH/" + gridowner_id + "/" + goodsid;
	}
	
	//格子店格主LOGO图片路径
	public static String getGridLogoPsth(String gridowner_id) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/brand_gridLogo/" + gridowner_id);
	}
	
	//格子店LOGO图片路径
	public static String getBrandLogoPsth(String brandgrid_id) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/brand_Logo/" + brandgrid_id);
	}
	
	//业绩分析JS模板路径
	public static String getYeMoDoPsth() {
		return ServletActionContext.getRequest().getRealPath("/Brand/js_modo/yejifengxi_modo.js");
	}
	//生成的业绩分析JS路径
	public static String getNewYePsth(String brandgrid_id) {
		return ServletActionContext.getRequest().getRealPath("/Brand/brandmanage/yeji_js/" + brandgrid_id);
	}
	public static String getYeJiJS_fileName(String ownerStatus,Integer nStatu) {
		return "yejifengxi"+ownerStatus + nStatu +".js";
	}
	//广告位的jsp
	public static String getGuangGao_file() {
		return ServletActionContext.getRequest().getRealPath("/guanggao.jsp");
	}
	//广告位的html所在路径
	public static String getGuangGaoPath_file() {
		return ServletActionContext.getRequest().getRealPath("/");
	}
	//广告位的jsp  name
	public static String getGuangGao_name() {
		return "guanggao.jsp";
	}
	//保存广告位的img
	public static String getSaveGuangGao_file() {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/guanggao_img");
	}
	/**
	 * @file:文件域列表
	 * @fileName:上传文件的文件名
	 * @path:文件上传的目录，相对目录。
	 * 说明：文件上传所存放目录的规则：网站根目录下 files/会员ID/网站类型名称/上传文件分类名称/
	 * @返回结果：一个存放上传文件所在位置相对路径的ArrayList
	 * */
	public static ArrayList upload(List file, List fileName, String path,
			String Rname,String dotype,float used_space ,float spacesize) throws MyException {
		File dir = new File(path);
		if (dir.exists() == false) {
			dir.mkdirs();
		}
		ArrayList<String> list = new ArrayList<String>();
		Map<String,File> file_l = new HashMap<String,File>();
		Map<String,InputStream> is_l = new HashMap<String,InputStream>();
		long fileSize = 0;
		
			InputStream is;
			try {
				for (int i = 0; i < file.size(); ++i) {
					is = new FileInputStream(file.get(i).toString());
					fileSize = fileSize + is.available();
					String name = "";
					if(dotype.equals("s")){
						name = Rname + (i + 1) + ".jpg";// 重命名文件名称,命名规则为：时间+原文件名称
					}else{
						name = Rname + (i + 10) + ".jpg";// 重命名文件名称,命名规则为：时间+原文件名称
					}
					File destFile = new File(path, name);
					file_l.put(name, destFile);
					is_l.put(name, is);
				}
				if( (used_space + FileUtil.getFileInfoSize_float(fileSize)) > spacesize){   //可使用空间已使用完
					//空间使用已满
					return null;
				}
				Set<String> names = file_l.keySet();
				for(String name : names){
					is = is_l.get(name);
					OutputStream os = new FileOutputStream(file_l.get(name));
	
					byte[] buffer = new byte[400];
	
					int length = 0;
	
					while ((length = is.read(buffer)) > 0) {
						os.write(buffer, 0, length);
					}
					list.add(name);
					is.close();
					os.close();
				}
			}catch(Exception e){
				// 上传图片失败
				if (list.size() > 0) {
					FileUtil.delFolder(path);
				}
				throw new MyException(MyError.UPLOAD_PHOTO_FAIL);
			}
			
		return list;
	}
	
	
	
	/*
	 * path:路径
	 * Rname：重置的名称
	 */
	public static String upload_gridLogo(File file, String fileName, String path,
			String Rname) {
		File dir = new File(path);
		if (dir.exists() == false) {
			dir.mkdirs();
		}
		InputStream is;
		try {
				is = new FileInputStream(file.toString());
				fileName = Rname + ".jpg";
				
				File destFile = new File(path, fileName);
				OutputStream os = new FileOutputStream(destFile);

				byte[] buffer = new byte[400];

				int length = 0;

				while ((length = is.read(buffer)) > 0) {
					os.write(buffer, 0, length);
				}
				is.close();
				os.close();
				return fileName;
		}catch(Exception e){
			// 上传图片失败
			return null;
		}
	}

	
	public static void upload_guanggao(List<File> file_l, String path,
			List<String> Rname) {
		File dir = new File(path);
		if (dir.exists() == false) {
			dir.mkdirs();
		}
		InputStream is;
		for(File file : file_l){
			try {
					is = new FileInputStream(file.toString());
					String fileName = Rname.get(file_l.indexOf(file)) + ".jpg";
					
					File destFile = new File(path, fileName);
					OutputStream os = new FileOutputStream(destFile);
	
					byte[] buffer = new byte[400];
	
					int length = 0;
	
					while ((length = is.read(buffer)) > 0) {
						os.write(buffer, 0, length);
					}
					is.close();
					os.close();
			}catch(Exception e){
				// 上传图片失败
			}
		}
	}
	
	public static boolean dele(String path, String filename) {
		String root = ServletActionContext.getRequest().getRealPath(path);
		File dir = new File(root);
		if (dir.exists() == false) {
			return true;
		} else {
			dir.delete();
			return true;
		}
	}


	
	/**
	 * 删除文件
	 * @param filePathAndName  String 文件路径及名称 如c:/fqf.txt
	 * @param fileContent String
	 * @return boolean
	 */
	public static boolean delFile(String filePathAndName) {
		try {
			String filePath = filePathAndName;
			filePath = filePath.toString();
			java.io.File myDelFile = new java.io.File(filePath);
			myDelFile.delete();
			return true;
		} catch (Exception e) {
			System.out.println("删除文件操作出错");
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 删除文件夹
	 * 
	 * @param filePathAndName
	 *            String 文件夹路径及名称 如c:/fqf
	 * @param fileContent
	 *            String
	 * @return boolean
	 */
	
	public static boolean delFolder(String folderPath) {
		try {
			delAllFile(folderPath); // 删除完里面所有内容
			String filePath = folderPath;
			filePath = filePath.toString();
			java.io.File myFilePath = new java.io.File(filePath);
			myFilePath.delete(); // 删除空文件夹
			return true;
		} catch (Exception e) {
			System.out.println("删除文件夹操作出错");
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 删除文件夹里面的所有文件
	 * @param path String 文件夹路径 如 c:/fqf
	 */
	public static void delAllFile(String path) {
		File file = new File(path);
		if (!file.exists()) {
			return;
		}
		if (!file.isDirectory()) {
			return;
		}
		String[] tempList = file.list();
		File temp = null;
		for (int i = 0; i < tempList.length; i++) {
			if (path.endsWith(File.separator)) {
				temp = new File(path + tempList[i]);
			} else {
				temp = new File(path + File.separator + tempList[i]);
			}
			if (temp.isFile()) {
				temp.delete();
			}
			if (temp.isDirectory()) {
				delAllFile(path + "/" + tempList[i]);// 先删除文件夹里面的文件
				delFolder(path + "/" + tempList[i]);// 再删除空文件夹
			}
		}
	}
	
	/*
	 * 文件大小
	 * 输出大小字符串
	 */
	public static String getFileInfoSize_String(float fileSize,String unit)
	{
		String infoSize = "";
		String strFileInfoFormat = null;
		if(fileSize < 1024)
		{
			strFileInfoFormat = "%.0f B";
		}
		else
		{
			fileSize /= 1024;
			if (fileSize < 1024)
			{
				strFileInfoFormat = "%.1f KB";
			}
			else
			{
				fileSize /= 1024;
				strFileInfoFormat = "%.1f MB";
			}
		}
		infoSize = StringUtil.stringWithFormat(strFileInfoFormat, fileSize);
		return infoSize;
	}
	
	
	/*
	 * 文件大小
	 * 输出大小 
	 * 单位 "MB"
	 *  0.001MB = 1.024KB
	 */
	public static float getFileInfoSize_float(long fileSize)
	{
		java.text.DecimalFormat df = new   java.text.DecimalFormat("#0.000");  

		float result = (float) (fileSize / (1024 * 1024 * 1.0));
		System.out.println(df.format(result));
		result = Float.parseFloat(df.format(result));
		return result;
	}
	
	
	/*
	 * 获取某个格子文件夹大小
	 * 
	 */
	public static float getFolderInfoSize_float_grid(String gridid)
	{
		java.io.File myDelFile = new java.io.File(FileUtil.getScatteredGoodsPhotoPsth_grid(gridid));
		if(!myDelFile.exists()){
			return 0;
		}
		return FileUtil.getFileInfoSize_float(FileUtil.getFolderSize(myDelFile));
	}
	
	
	/*
	 * 获取品牌店某个格主文件夹大小
	 * 
	 */
	public static float getFolderInfoSize_float_brandgrid(String brand_id,String gridowner_id)
	{
		java.io.File myDelFile = new java.io.File(FileUtil.getGoodsPhotoPsth_gridowner(brand_id,gridowner_id));
		if(!myDelFile.exists()){
			return 0;
		}
		return FileUtil.getFileInfoSize_float(FileUtil.getFolderSize(myDelFile));
	}
	
	 // 递归
    public static long getFolderSize(File f)//取得文件夹大小
    {
        long size = 0;
        File flist[] = f.listFiles();
        for (int i = 0; i < flist.length; i++)
        {
            if (flist[i].isDirectory())
            {
                size = size + getFolderSize(flist[i]);
            } else
            {
                size = size + flist[i].length();
            }
        }
        return size;
    }
    /**
     *  复制整个文件夹内容
     *  @param  oldPath  String  原文件路径  如：c:/fqf
     *  @param  newPath  String  复制后路径  如：f:/fqf/ff
     *  @return  boolean
     */
    public static void copyFolder(String oldPath, String newPath) {
        try {
            (new File(newPath)).mkdirs(); //如果文件夹不存在  则建立新文件夹 

            File a = new File(oldPath);
            String[] file = a.list();
            File temp = null;

            for (int i = 0; i < file.length; i++) {
                if (oldPath.endsWith(File.separator)) {
                    temp = new File(oldPath + file[i]);
                } else {
                    temp = new File(oldPath + File.separator + file[i]);
                }

                if (temp.isFile()) {
                    FileInputStream input = new FileInputStream(temp);
                    FileOutputStream output = new FileOutputStream(newPath + "/" + (temp.getName()).toString());
                    byte[] b = new byte[1024 * 5];
                    int len;

                    while ((len = input.read(b)) != -1) {
                        output.write(b, 0, len);
                    }

                    output.flush();
                    output.close();
                    input.close();
                }

                if (temp.isDirectory()) { //如果是子文件夹 
                    copyFolder(oldPath + "/" + file[i], newPath + "/" + file[i]);
                }
            }
        } catch (Exception e) {
            System.out.println("复制整个文件夹内容操作出错");
            e.printStackTrace();
        }
    }

    /**
     *  移动文件到指定目录
     *  @param  oldPath  String  如：c:/fqf.txt
     *  @param  newPath  String  如：d:/fqf.txt
     */
    public void moveFile(String oldPath, String newPath) {
        copyFile(oldPath, newPath);
        delFile(oldPath);
    }
    /**
     *  复制单个文件
     *  @param  oldPath  String  原文件路径  如：c:/fqf.txt
     *  @param  newPath  String  复制后路径  如：f:/fqf.txt
     *  @return  boolean
     */
    public static void copyFile(String oldPath, String newPath) {
        try {
            int bytesum = 0;
            int byteread = 0;
            File oldfile = new File(oldPath);

            if (oldfile.exists()) { //文件存在时 

                InputStream inStream = new FileInputStream(oldPath); //读入原文件 
                FileOutputStream fs = new FileOutputStream(newPath);
                byte[] buffer = new byte[1444];

                while ((byteread = inStream.read(buffer)) != -1) {
                    bytesum += byteread; //字节数  文件大小 
                    System.out.println(bytesum);
                    fs.write(buffer, 0, byteread);
                }

                inStream.close();
            }
        } catch (Exception e) {
            System.out.println("复制单个文件操作出错");
            e.printStackTrace();
        }
    }
    
    /**
     *  复制单个文件,并删除oldPath
     *  @param  oldPath  String  原文件路径  如：c:/fqf.txt
     *  @param  newPath  String  复制后路径  如：f:/fqf.txt
     *  @return  boolean
     */
    public static void copyFileAndDele(String oldPath, String newPath) {
        try {
            int bytesum = 0;
            int byteread = 0;
            File oldfile = new File(oldPath);
           
            if (oldfile.exists()) { //文件存在时 

                InputStream inStream = new FileInputStream(oldPath); //读入原文件 
                FileOutputStream fs = new FileOutputStream(newPath);
                byte[] buffer = new byte[1444];

                while ((byteread = inStream.read(buffer)) != -1) {
                    bytesum += byteread; //字节数  文件大小 
                    System.out.println(bytesum);
                    fs.write(buffer, 0, byteread);
                }

                inStream.close();
                //删除文件
                oldfile.delete();
            }
            
        } catch (Exception e) {
            System.out.println("复制单个文件操作出错");
            e.printStackTrace();
        }
    }
    /*
     * 替换
     * infoB :全文
     * beforeStr：需要替换的位置
     * afterStr：代替的字符
     */
    public static StringBuilder changeInfo(StringBuilder infoB,String beforeStr,String afterStr){
    	int index = infoB.indexOf(beforeStr);
    	if(index != -1){
    		infoB.replace(index, index + beforeStr.length(), afterStr);
    		infoB = changeInfo(infoB,beforeStr,afterStr);
    	}
    	return infoB;
    }
  
    
    /*
     * 重新整理空间，将已失去关联的文件夹去除，保证空间的公正
     * hasFolader_l ： 有关联的 文件夹名
     */
    public static boolean cleanFolder(String root,List<String> hasFolader_l){ 
		Map<String,String> childFoder_map = FileUtil.findChildFolder(root);
		if(childFoder_map == null || childFoder_map.size() == 0){
			System.out.println("null");
			return false;
		}else{
			for(String hasFolder : hasFolader_l){
				hasFolder = hasFolder.toLowerCase();
				if(childFoder_map.get(hasFolder)!=null){
					childFoder_map.remove(hasFolder);
				}
			}
			Set<String> key_set = childFoder_map.keySet();
			if(childFoder_map.size() == 0){
				return false;
			}
			for(String key : key_set){
				System.out.println(childFoder_map.get(key));
				FileUtil.delFolder(childFoder_map.get(key));
			}
			return true;
		}
	}
	
	
	public static Map<String,String> findChildFolder(String root){
		Map<String,String> childFoder_map = new HashMap<String, String>();
		File file = new File(root);
		if (!file.exists()) {
			return null;
		}
		if (!file.isDirectory()) {
			return null;
		}
		String[] tempList = file.list();
		File temp = null;
		for (int i = 0; i < tempList.length; i++) {
			String file_path = "";
			if (root.endsWith(File.separator)) {
				file_path = root + tempList[i];
				temp = new File(root);
			} else {
				file_path = root + File.separator + tempList[i];
				temp = new File(file_path);
			}
			if (temp.isFile()) {
				continue;
			}
			if (temp.isDirectory()) {  //是文件夹
				childFoder_map.put(temp.getName(), file_path);
			}
		}
		return childFoder_map;
	}
	
	
	
	public static StringBuilder readFile(String filePath) {
		File f = new File(filePath); // create file object
		BufferedReader br = null; // create buffer reader that has a method
									// named readLine()
		String content = "";
		String line = "";
		try {
			br = new BufferedReader(new FileReader(f));
			while ((line = br.readLine()) != null) {
				content += (line + "\n");
			}
			br.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new StringBuilder(content);
	}

	public static void writeFile(StringBuilder content, String filePath,String filename) {
		File file = new File(filePath);
		String con = content.toString();
		con = con.substring(2, con.length());  //去掉头部开始的乱码
		try {
			if (file.exists() == false) {
				file.mkdirs();
			}
			file = new File(filePath + "\\" + filename);
			FileOutputStream fos=new FileOutputStream(file); 
			OutputStreamWriter osw=new OutputStreamWriter(fos,"utf-8");   //一定要转码
			BufferedWriter bw=new BufferedWriter(osw); 
			bw.write(con); 
			bw.close(); 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/*
	 * 创建业绩分析JS
	 * title_name01：业绩图主题
	 * title_name02：业绩图副标题
	 * x_Axis：x轴标尺，在枚举YeJiXuanZhe中有定义类型
	 * 例如：['03/04', '03/05', '03/06', '03/07', '03/08', '03/09','03/10']
	 * yAxis_title_name：y轴标题
	 * yAxis_unit：节点显示单位
	 * series_contest：不同折现名称及各节点在Y轴的大小
	 * 例如：
	 * 		{
                name: '销售趋势',
                data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2]
            }, {
                name: '销售总额',
                data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8]
            }, {
                name: '销售差价',
                data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6]
            }, {
                name: '进货趋势',
                data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0]
       		}
	 * 
	 */
	public static boolean makeYeJi_JSString(String brandgrid_id,String title_name01,String title_name02,YeJIXuanZhe yjxz,String yAxis_title_name,String yAxis_unit,  TreeMap<String,List<BrandgridGradenote>> series_map,String ownerStatus,Integer nStatu){
		StringBuilder content = FileUtil.readFile(FileUtil.getYeMoDoPsth());
		//处理改变相关位置的信息
		//需要改变的关键字
		String want_change[] = {
				"[title_name01]",
				"[title_name02]",
				"[x_Axis] ",
				"[yAxis_title_name]",
				"[yAxis_unit]",
				"[series_contest]",
		};
		//替换title_name01
		FileUtil.changeInfo(content, want_change[0], "品牌["+title_name01+"]网格业绩分析");
		//替换title_name02
		FileUtil.changeInfo(content, want_change[1], title_name02);
		//替换x_Axis
		FileUtil.changeInfo(content, want_change[2], yjxz.getValue());
		//替换yAxis_title_name
		FileUtil.changeInfo(content, want_change[3], yAxis_title_name);
		//替换yAxis_unit
		FileUtil.changeInfo(content, want_change[4], yAxis_unit);
		//替换series_contest
		FileUtil.changeInfo(content, want_change[5], FileUtil.makeSeries_contest(series_map));
		//生成JS
		writeFile(content,FileUtil.getNewYePsth(brandgrid_id),FileUtil.getYeJiJS_fileName(ownerStatus, nStatu+2));
		
		return true;
	}
	
	
	public static String makeSeries_contest(TreeMap<String,List<BrandgridGradenote>> series_map){
		Set<String> key_set = series_map.keySet();
		String series_contest = "";
		String mid_contest = "";
		String name = "name:'";
		String data = "data:[";
		for(String key : key_set){
			mid_contest = "\n{";
			mid_contest = mid_contest + name + key + "',\n";
			mid_contest = mid_contest + data +  FileUtil.arrayToString(series_map.get(key)) + "]},";
			series_contest = series_contest + mid_contest;
		}
		if(series_contest.length() > 0){
			series_contest = series_contest.substring(0, series_contest.length() -1);
		}
		return series_contest;
	}
	
	
	//转为---》JS数字的字符串
	public static String arrayToString(List<BrandgridGradenote> value){
		String str = "";
		for(BrandgridGradenote bggn : value){
			str = str + bggn.getTotal_price() + ",";
		}
		if(str.length()>0){
			str = str.substring(0, str.length()-1);
		}
		return str;
	}
	
	//获取广告Html文件的字符串
	public static String showToUpdata_aa(){
		String str = "";
		str =  FileUtil.readFile(FileUtil.getGuangGao_file()).toString();
		return str;
	}
}
