package com.gy.Bean;

/**
 * 类名：Admin
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/4 0:27
 * 版本：V1.0
 */
public class Admin {
    private  int aid;
    private  String aname;
    private  String apass;

    public Admin() {
    }

    public Admin(int aid, String aname, String apass) {
        this.aid = aid;
        this.aname = aname;
        this.apass = apass;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getApass() {
        return apass;
    }

    public void setApass(String apass) {
        this.apass = apass;
    }

}
