package com.cqkj.service;

import java.util.List;

import com.cqkj.bean.Student;
import com.cqkj.dao.StudentDao;
import com.cqkj.dao.factory.DaoFactory;

/**
 * ҵ���߼���
 * 
 * @author xxx
 *
 */
public class StudentService
{
    StudentDao studentDao = DaoFactory.<StudentDao>createDao("StudentDaoImpl");

    /**
     * ����һ�����ݵ����ݿ�
     * 
     * @param st
     * @return
     * @throws Exception
     */
    public boolean AddStudent(Student st) throws Exception
    {
        studentDao.insert(st);

        return true;
    }

    public List<Student> SelectAll()
    {
        try
        {
            return studentDao.selectAll(Student.class);
        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }

    }

    public int insert(Student st)
    {
        try
        {
            return studentDao.insert(st);
        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return 0;
        }
    }

}
