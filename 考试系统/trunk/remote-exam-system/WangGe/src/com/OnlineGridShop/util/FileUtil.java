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
	//����ά���������ļ������ڣ����ʾά������...
	public static String maintenanceFilePath(String gridid,
			String goodsid) {
		return ServletActionContext.getRequest().getRealPath("../webapps/WangGe/WangGe.xml");
	}
	//ɢ���ϴ�ͼƬ·��
	public static String getScatteredGoodsPhotoPsth(String gridid,
			String goodsid) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/goodsphotos/" + gridid + "/" + goodsid);
	}
	public static String getScatteredGoodsPhotoPsth_grid(String gridid) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/goodsphotos/" + gridid);
	}
	//ɢ����Ʒ��ϸ��ϢͼƬ����·��
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
	//���ӵ����
	public static String getGoodsPhotoPsth_gridowner(String brand_id,String gridowner_id) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/brandGoodsPH/" + brand_id + "/" + gridowner_id) ;
	}
	public static String getDeleGoodsPhotoPsth_gridowner(String brand_id,String gridowner_id,String goodsid) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/brandGoodsPH/" + brand_id + "/" + gridowner_id + "/" + goodsid);
	}
	
	//���ӵ������Ʒ��ϸ��ϢͼƬ����·��
	public static String getDeleGoodsXqPhotoPsth2(String gridowner_id,String goodsid) {
		return "../webapps/WangGe/brandXQPH/" + gridowner_id + "/" + goodsid;
	}
	
	//���ӵ����LOGOͼƬ·��
	public static String getGridLogoPsth(String gridowner_id) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/brand_gridLogo/" + gridowner_id);
	}
	
	//���ӵ�LOGOͼƬ·��
	public static String getBrandLogoPsth(String brandgrid_id) {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/brand_Logo/" + brandgrid_id);
	}
	
	//ҵ������JSģ��·��
	public static String getYeMoDoPsth() {
		return ServletActionContext.getRequest().getRealPath("/Brand/js_modo/yejifengxi_modo.js");
	}
	//���ɵ�ҵ������JS·��
	public static String getNewYePsth(String brandgrid_id) {
		return ServletActionContext.getRequest().getRealPath("/Brand/brandmanage/yeji_js/" + brandgrid_id);
	}
	public static String getYeJiJS_fileName(String ownerStatus,Integer nStatu) {
		return "yejifengxi"+ownerStatus + nStatu +".js";
	}
	//���λ��jsp
	public static String getGuangGao_file() {
		return ServletActionContext.getRequest().getRealPath("/guanggao.jsp");
	}
	//���λ��html����·��
	public static String getGuangGaoPath_file() {
		return ServletActionContext.getRequest().getRealPath("/");
	}
	//���λ��jsp  name
	public static String getGuangGao_name() {
		return "guanggao.jsp";
	}
	//������λ��img
	public static String getSaveGuangGao_file() {
		return ServletActionContext.getRequest().getRealPath("../WGPhoto/guanggao_img");
	}
	/**
	 * @file:�ļ����б�
	 * @fileName:�ϴ��ļ����ļ���
	 * @path:�ļ��ϴ���Ŀ¼�����Ŀ¼��
	 * ˵�����ļ��ϴ������Ŀ¼�Ĺ�����վ��Ŀ¼�� files/��ԱID/��վ��������/�ϴ��ļ���������/
	 * @���ؽ����һ������ϴ��ļ�����λ�����·����ArrayList
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
						name = Rname + (i + 1) + ".jpg";// �������ļ�����,��������Ϊ��ʱ��+ԭ�ļ�����
					}else{
						name = Rname + (i + 10) + ".jpg";// �������ļ�����,��������Ϊ��ʱ��+ԭ�ļ�����
					}
					File destFile = new File(path, name);
					file_l.put(name, destFile);
					is_l.put(name, is);
				}
				if( (used_space + FileUtil.getFileInfoSize_float(fileSize)) > spacesize){   //��ʹ�ÿռ���ʹ����
					//�ռ�ʹ������
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
				// �ϴ�ͼƬʧ��
				if (list.size() > 0) {
					FileUtil.delFolder(path);
				}
				throw new MyException(MyError.UPLOAD_PHOTO_FAIL);
			}
			
		return list;
	}
	
	
	
	/*
	 * path:·��
	 * Rname�����õ�����
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
			// �ϴ�ͼƬʧ��
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
				// �ϴ�ͼƬʧ��
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
	 * ɾ���ļ�
	 * @param filePathAndName  String �ļ�·�������� ��c:/fqf.txt
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
			System.out.println("ɾ���ļ���������");
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * ɾ���ļ���
	 * 
	 * @param filePathAndName
	 *            String �ļ���·�������� ��c:/fqf
	 * @param fileContent
	 *            String
	 * @return boolean
	 */
	
	public static boolean delFolder(String folderPath) {
		try {
			delAllFile(folderPath); // ɾ����������������
			String filePath = folderPath;
			filePath = filePath.toString();
			java.io.File myFilePath = new java.io.File(filePath);
			myFilePath.delete(); // ɾ�����ļ���
			return true;
		} catch (Exception e) {
			System.out.println("ɾ���ļ��в�������");
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * ɾ���ļ�������������ļ�
	 * @param path String �ļ���·�� �� c:/fqf
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
				delAllFile(path + "/" + tempList[i]);// ��ɾ���ļ���������ļ�
				delFolder(path + "/" + tempList[i]);// ��ɾ�����ļ���
			}
		}
	}
	
	/*
	 * �ļ���С
	 * �����С�ַ���
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
	 * �ļ���С
	 * �����С 
	 * ��λ "MB"
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
	 * ��ȡĳ�������ļ��д�С
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
	 * ��ȡƷ�Ƶ�ĳ�������ļ��д�С
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
	
	 // �ݹ�
    public static long getFolderSize(File f)//ȡ���ļ��д�С
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
     *  ���������ļ�������
     *  @param  oldPath  String  ԭ�ļ�·��  �磺c:/fqf
     *  @param  newPath  String  ���ƺ�·��  �磺f:/fqf/ff
     *  @return  boolean
     */
    public static void copyFolder(String oldPath, String newPath) {
        try {
            (new File(newPath)).mkdirs(); //����ļ��в�����  �������ļ��� 

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

                if (temp.isDirectory()) { //��������ļ��� 
                    copyFolder(oldPath + "/" + file[i], newPath + "/" + file[i]);
                }
            }
        } catch (Exception e) {
            System.out.println("���������ļ������ݲ�������");
            e.printStackTrace();
        }
    }

    /**
     *  �ƶ��ļ���ָ��Ŀ¼
     *  @param  oldPath  String  �磺c:/fqf.txt
     *  @param  newPath  String  �磺d:/fqf.txt
     */
    public void moveFile(String oldPath, String newPath) {
        copyFile(oldPath, newPath);
        delFile(oldPath);
    }
    /**
     *  ���Ƶ����ļ�
     *  @param  oldPath  String  ԭ�ļ�·��  �磺c:/fqf.txt
     *  @param  newPath  String  ���ƺ�·��  �磺f:/fqf.txt
     *  @return  boolean
     */
    public static void copyFile(String oldPath, String newPath) {
        try {
            int bytesum = 0;
            int byteread = 0;
            File oldfile = new File(oldPath);

            if (oldfile.exists()) { //�ļ�����ʱ 

                InputStream inStream = new FileInputStream(oldPath); //����ԭ�ļ� 
                FileOutputStream fs = new FileOutputStream(newPath);
                byte[] buffer = new byte[1444];

                while ((byteread = inStream.read(buffer)) != -1) {
                    bytesum += byteread; //�ֽ���  �ļ���С 
                    System.out.println(bytesum);
                    fs.write(buffer, 0, byteread);
                }

                inStream.close();
            }
        } catch (Exception e) {
            System.out.println("���Ƶ����ļ���������");
            e.printStackTrace();
        }
    }
    
    /**
     *  ���Ƶ����ļ�,��ɾ��oldPath
     *  @param  oldPath  String  ԭ�ļ�·��  �磺c:/fqf.txt
     *  @param  newPath  String  ���ƺ�·��  �磺f:/fqf.txt
     *  @return  boolean
     */
    public static void copyFileAndDele(String oldPath, String newPath) {
        try {
            int bytesum = 0;
            int byteread = 0;
            File oldfile = new File(oldPath);
           
            if (oldfile.exists()) { //�ļ�����ʱ 

                InputStream inStream = new FileInputStream(oldPath); //����ԭ�ļ� 
                FileOutputStream fs = new FileOutputStream(newPath);
                byte[] buffer = new byte[1444];

                while ((byteread = inStream.read(buffer)) != -1) {
                    bytesum += byteread; //�ֽ���  �ļ���С 
                    System.out.println(bytesum);
                    fs.write(buffer, 0, byteread);
                }

                inStream.close();
                //ɾ���ļ�
                oldfile.delete();
            }
            
        } catch (Exception e) {
            System.out.println("���Ƶ����ļ���������");
            e.printStackTrace();
        }
    }
    /*
     * �滻
     * infoB :ȫ��
     * beforeStr����Ҫ�滻��λ��
     * afterStr��������ַ�
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
     * ��������ռ䣬����ʧȥ�������ļ���ȥ������֤�ռ�Ĺ���
     * hasFolader_l �� �й����� �ļ�����
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
			if (temp.isDirectory()) {  //���ļ���
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
		con = con.substring(2, con.length());  //ȥ��ͷ����ʼ������
		try {
			if (file.exists() == false) {
				file.mkdirs();
			}
			file = new File(filePath + "\\" + filename);
			FileOutputStream fos=new FileOutputStream(file); 
			OutputStreamWriter osw=new OutputStreamWriter(fos,"utf-8");   //һ��Ҫת��
			BufferedWriter bw=new BufferedWriter(osw); 
			bw.write(con); 
			bw.close(); 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/*
	 * ����ҵ������JS
	 * title_name01��ҵ��ͼ����
	 * title_name02��ҵ��ͼ������
	 * x_Axis��x���ߣ���ö��YeJiXuanZhe���ж�������
	 * ���磺['03/04', '03/05', '03/06', '03/07', '03/08', '03/09','03/10']
	 * yAxis_title_name��y�����
	 * yAxis_unit���ڵ���ʾ��λ
	 * series_contest����ͬ�������Ƽ����ڵ���Y��Ĵ�С
	 * ���磺
	 * 		{
                name: '��������',
                data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2]
            }, {
                name: '�����ܶ�',
                data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8]
            }, {
                name: '���۲��',
                data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6]
            }, {
                name: '��������',
                data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0]
       		}
	 * 
	 */
	public static boolean makeYeJi_JSString(String brandgrid_id,String title_name01,String title_name02,YeJIXuanZhe yjxz,String yAxis_title_name,String yAxis_unit,  TreeMap<String,List<BrandgridGradenote>> series_map,String ownerStatus,Integer nStatu){
		StringBuilder content = FileUtil.readFile(FileUtil.getYeMoDoPsth());
		//����ı����λ�õ���Ϣ
		//��Ҫ�ı�Ĺؼ���
		String want_change[] = {
				"[title_name01]",
				"[title_name02]",
				"[x_Axis] ",
				"[yAxis_title_name]",
				"[yAxis_unit]",
				"[series_contest]",
		};
		//�滻title_name01
		FileUtil.changeInfo(content, want_change[0], "Ʒ��["+title_name01+"]����ҵ������");
		//�滻title_name02
		FileUtil.changeInfo(content, want_change[1], title_name02);
		//�滻x_Axis
		FileUtil.changeInfo(content, want_change[2], yjxz.getValue());
		//�滻yAxis_title_name
		FileUtil.changeInfo(content, want_change[3], yAxis_title_name);
		//�滻yAxis_unit
		FileUtil.changeInfo(content, want_change[4], yAxis_unit);
		//�滻series_contest
		FileUtil.changeInfo(content, want_change[5], FileUtil.makeSeries_contest(series_map));
		//����JS
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
	
	
	//תΪ---��JS���ֵ��ַ���
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
	
	//��ȡ���Html�ļ����ַ���
	public static String showToUpdata_aa(){
		String str = "";
		str =  FileUtil.readFile(FileUtil.getGuangGao_file()).toString();
		return str;
	}
}
