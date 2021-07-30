package com.gy.Bean;

/**
 * 类名：curriculum
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/4 13:23
 * 版本：V1.0
 */
public class Curriculum {
    private int cuid;
    private int tid;
    private String cuname;
    private String cuclassroom;
    private String cuclass;
    private String trueName;
    private String starttime;
    private String endtime;
    private String cuweek;
    private  String cusection;

    public Curriculum() {
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public Curriculum(int cuid, int tid, String cuname, String cuclassroom, String cuclass, String trueName, String starttime, String endtime, String cuweek, String cusection) {
        this.cuid = cuid;
        this.tid = tid;
        this.cuname = cuname;
        this.cuclassroom = cuclassroom;
        this.cuclass = cuclass;
        this.trueName = trueName;
        this.starttime = starttime;
        this.endtime = endtime;
        this.cuweek = cuweek;
        this.cusection = cusection;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getCuid() {
        return cuid;
    }

    public void setCuid(int cuid) {
        this.cuid = cuid;
    }

    public String getCuname() {
        return cuname;
    }

    public void setCuname(String cuname) {
        this.cuname = cuname;
    }

    public String getCuclassroom() {
        return cuclassroom;
    }

    public void setCuclassroom(String cuclassroom) {
        this.cuclassroom = cuclassroom;
    }

    public String getCuclass() {
        return cuclass;
    }

    public void setCuclass(String cuclass) {
        this.cuclass = cuclass;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getCuweek() {
        return cuweek;
    }

    public void setCuweek(String cuweek) {
        this.cuweek = cuweek;
    }

    public String getCusection() {
        return cusection;
    }

    public void setCusection(String cusection) {
        this.cusection = cusection;
    }
}
