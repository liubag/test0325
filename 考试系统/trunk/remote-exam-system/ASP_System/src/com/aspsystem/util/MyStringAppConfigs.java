package com.aspsystem.util;
/*
 * 创建时间：2011-12—29
 * 创建人：王秋贵
 * 详情：字符串枚举
 * 
 */
public enum MyStringAppConfigs {
	add_myclass_fail("添加班级出错."),
	add_myclass_success("成功添加班级."),
	update_myclass_fail("修改班级失败"),
	update_myclass_success("修改班级成功"),
	dele_myclass_fail("删除班级失败."),
	dele_myclass_success("成功删除班级."),
	add_course_fail("添加科目出错."),
	add_course_success("成功添加科目."),
	update_course_fail("修改科目失败"),
	update_course_success("修改科目成功"),
	dele_course_fail("删除科目失败."),
	dele_course_success("成功删除科目."),
	add_student_fail("添加学生出错."),
	add_student_success("成功添加学生."),
	update_student_fail("修改学生失败"),
	update_student_success("修改学生成功"),
	dele_student_fail("删除学生失败."),
	dele_student_success("成功删除学生."),
	add_teacher_fail("添加老师出错."),
	add_teacher_success("成功添加老师."),
	update_teacher_fail("修改老师失败"),
	update_teacher_success("修改老师成功"),
	dele_teacher_fail("删除老师失败."),
	dele_teacher_success("成功删除试卷."),	
	add_exam_fail("添加试卷出错."),
	add_exam_success("成功添加试卷."),
	update_exam_fail("修改试卷失败"),
	update_exam_success("修改试卷成功"),
	dele_exam_fail("删除试卷失败."),
	dele_exam_success("成功删除试卷."),
	find_course_fail("不存在任何班级"),
	find_course_success("存在班级"),
	add_questions_fail("添加题目出错."),
	add_questions_success("成功添加题目."),
	update_questions_fail("修改题目失败"),
	update_questions_success("修改题目成功"),
	dele_questions_fail("删除题目失败."),
	dele_questions_success("成功删除题目."),
	change_password_fail("修改登录密码失败！请重新输入！"),
	change_password_success("修改登录密码成功，请重新登录！"),
	show_examInfo_fail("参加考试出错！"),
	save_answernote_fail("保存答卷出错！"),
	commit_exam_success("交卷成功！"),
	commit_exam_fail("交卷失败！"),
	create_classrank_success("生成班级排名成功！"),
	create_classrank_fail("生成班级排名失败！"),
	show_questions_fail("显示考题出错！");
	
	
	private String value;
	MyStringAppConfigs(String value){
		this.value = value;
	}
	public String getValue() {
		return value;
	}
	
}
