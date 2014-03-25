package com.aspsystem.util;

import java.io.FileOutputStream;
import java.util.List;

import com.aspsystem.entity.Exam;
import com.aspsystem.entity.Questions;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.rtf.RtfWriter2;
import com.lowagie.text.rtf.style.RtfParagraphStyle;

public class WordUtil {
	private Exam exam;
	private List<Questions> questions;
	private String separator;
	private String Path;
	private int i=0;
	private String type;

	
	public WordUtil(){}
	
	public WordUtil(Exam exam,List<Questions> questions,String separator,String Path){
		this.exam=exam;
		this.questions=questions;
		this.separator=separator;
		this.Path=Path;
	}
	
	public void WriteWord(){
		Document document ;
		try {
		document = new Document(PageSize.A2.rotate(),80,80,80,80);
		RtfWriter2.getInstance(document, new FileOutputStream(Path+exam.getExam_wordPath()+".doc"));		
		document.open();
		Font titleFont = new Font(Font.STRIKETHRU,14, Font.BOLD);
		/* 设置标题1格式 */
		RtfParagraphStyle rtfGsBt1 = RtfParagraphStyle.STYLE_NORMAL;
		rtfGsBt1.setAlignment(Element.ALIGN_CENTER);
		rtfGsBt1.setStyle(Font.BOLD);
		rtfGsBt1.setSize(12);
		/* 设置正文格式 */
		RtfParagraphStyle rtfGsBt2 = RtfParagraphStyle.STYLE_HEADING_2;
		rtfGsBt2.setAlignment(Element.ALIGN_LEFT);
		rtfGsBt2.setStyle(Font.NORMAL);
		rtfGsBt2.setSize(10);
		  
		  
		Paragraph title = new Paragraph(exam.getExam_name());
		title.setAlignment(Element.ALIGN_CENTER);
		title.setFont(titleFont);
		document.add(title);
		  //正文
		//setParagraph(document,rtfGsBt2,"编号："+exam.getExam_id());
		setParagraph(document,rtfGsBt2,"名称："+exam.getExam_name());  
		setParagraph(document,rtfGsBt2,"科目："+exam.getCourse().getCourse_name()); 
		//setParagraph(document,rtfGsBt2,"考试班级："+exam.getClass_id());   

				for(Questions question:questions){
					if(question.getType()==1){
						type="单选题";
					}else if(question.getType()==2){
						type="多选题";
					}else{
						type="不定选题";
					}
					  Paragraph Topic=new Paragraph(++i +"."+question.getTopic()+"("+type+")");
					  Topic.setFont(rtfGsBt2);					
					  document.add(Topic);					  				
					  List<String> list=StringUtil.getOption(question.getOptions(),separator);					  
					  for(String option:list){						
						  Paragraph Options=new Paragraph(option);
						  Options.setFont(rtfGsBt2);
						  document.add(Options); 
					  }	
					  list.clear();
					  Paragraph answer=new Paragraph("答案："+question.getAnswer());
					  answer.setFont(rtfGsBt2);
					  document.add(answer);
					  
					  Paragraph analysis=new Paragraph("问题解析："+question.getAnalysis());
					  analysis.setFont(rtfGsBt2);
					  document.add(analysis);
				}
//			}
			
//		}
		  document.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
		}
	}

	public void setParagraph(Document document,RtfParagraphStyle rtfGsBt,String message) throws DocumentException{
		Paragraph paragraph = new Paragraph(message);
		paragraph.setFont(rtfGsBt);
		document.add(paragraph);
	}
	
//	public List<String> getOption(String options,String separator){
//		int index=0;
//		String option;
//
//		while(index<options.lastIndexOf(separator)){			
//			option=options.substring(index, options.indexOf(separator,index)).trim();
//			list.add(option);
//			index= options.indexOf(separator,index)+1;
//			if((index-1)==options.lastIndexOf(separator)){
//				option=options.substring(index).trim();
//				list.add(option);
//			}				
//		}
//		return list;
//	}
}
