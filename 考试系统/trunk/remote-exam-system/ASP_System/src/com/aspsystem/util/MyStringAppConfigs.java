package com.aspsystem.util;
/*
 * ����ʱ�䣺2011-12��29
 * �����ˣ������
 * ���飺�ַ���ö��
 * 
 */
public enum MyStringAppConfigs {
	add_myclass_fail("��Ӱ༶����."),
	add_myclass_success("�ɹ���Ӱ༶."),
	update_myclass_fail("�޸İ༶ʧ��"),
	update_myclass_success("�޸İ༶�ɹ�"),
	dele_myclass_fail("ɾ���༶ʧ��."),
	dele_myclass_success("�ɹ�ɾ���༶."),
	add_course_fail("��ӿ�Ŀ����."),
	add_course_success("�ɹ���ӿ�Ŀ."),
	update_course_fail("�޸Ŀ�Ŀʧ��"),
	update_course_success("�޸Ŀ�Ŀ�ɹ�"),
	dele_course_fail("ɾ����Ŀʧ��."),
	dele_course_success("�ɹ�ɾ����Ŀ."),
	add_student_fail("���ѧ������."),
	add_student_success("�ɹ����ѧ��."),
	update_student_fail("�޸�ѧ��ʧ��"),
	update_student_success("�޸�ѧ���ɹ�"),
	dele_student_fail("ɾ��ѧ��ʧ��."),
	dele_student_success("�ɹ�ɾ��ѧ��."),
	add_teacher_fail("�����ʦ����."),
	add_teacher_success("�ɹ������ʦ."),
	update_teacher_fail("�޸���ʦʧ��"),
	update_teacher_success("�޸���ʦ�ɹ�"),
	dele_teacher_fail("ɾ����ʦʧ��."),
	dele_teacher_success("�ɹ�ɾ���Ծ�."),	
	add_exam_fail("����Ծ����."),
	add_exam_success("�ɹ�����Ծ�."),
	update_exam_fail("�޸��Ծ�ʧ��"),
	update_exam_success("�޸��Ծ�ɹ�"),
	dele_exam_fail("ɾ���Ծ�ʧ��."),
	dele_exam_success("�ɹ�ɾ���Ծ�."),
	find_course_fail("�������κΰ༶"),
	find_course_success("���ڰ༶"),
	add_questions_fail("�����Ŀ����."),
	add_questions_success("�ɹ������Ŀ."),
	update_questions_fail("�޸���Ŀʧ��"),
	update_questions_success("�޸���Ŀ�ɹ�"),
	dele_questions_fail("ɾ����Ŀʧ��."),
	dele_questions_success("�ɹ�ɾ����Ŀ."),
	change_password_fail("�޸ĵ�¼����ʧ�ܣ����������룡"),
	change_password_success("�޸ĵ�¼����ɹ��������µ�¼��"),
	show_examInfo_fail("�μӿ��Գ���"),
	save_answernote_fail("���������"),
	commit_exam_success("����ɹ���"),
	commit_exam_fail("����ʧ�ܣ�"),
	create_classrank_success("���ɰ༶�����ɹ���"),
	create_classrank_fail("���ɰ༶����ʧ�ܣ�"),
	show_questions_fail("��ʾ�������");
	
	
	private String value;
	MyStringAppConfigs(String value){
		this.value = value;
	}
	public String getValue() {
		return value;
	}
	
}
