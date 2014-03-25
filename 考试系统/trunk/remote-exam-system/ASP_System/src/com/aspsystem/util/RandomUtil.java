package com.aspsystem.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class RandomUtil {
	public static List<String> randomOrderBy(){
		List<String> field_l=new ArrayList<String>();
		String[] field={"q.ques_id","q.topic","q.analysis","q.answer","q.options"};	
		Random r = new Random();
		for(int i=0;i<3;i++){
			field_l.add(field[r.nextInt(5)]);
		}
		return field_l;
	}
	public static int randomOne(int count,int number){
		int i;
		Random r = new Random();
		if(count>number){
			i=r.nextInt(count-number);
		}else{
			i=0;
		}
		return i;
	}
}
