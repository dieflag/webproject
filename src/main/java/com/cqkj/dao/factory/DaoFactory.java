package com.cqkj.dao.factory;

import java.util.Properties;

public class DaoFactory
{
    static String dbType;
    static
    {
        try
        {
            Properties ps = new Properties();
            ps.load(DaoFactory.class.getResourceAsStream("dbType.properties"));
            dbType = ps.getProperty("dbType");
        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @SuppressWarnings("unchecked")
    public static <T> T createDao(String daoName)
    {
        T obj = null;

        // 获取完整的类的路径
        String classPath = dbType + "." + daoName;
        try
        {
            Class<?> c = Class.forName(classPath);
            obj = (T) c.newInstance();

        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return obj;
    }
}
