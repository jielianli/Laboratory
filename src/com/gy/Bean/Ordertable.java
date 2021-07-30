package com.gy.Bean;

/**
 * 类名：ordertable
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/4 14:53
 * 版本：V1.0
 */
public class Ordertable {
    private int oid;
    private  int tid;
    private  String lbuilding;
    private  String  lclassroom;
    private String orderDate;
    private  String  starttime;
    private  String  endtime;
    private  String  cuweek;
    private  String  cusection;
    private  String cuname;
    private  String cuproject;
    private  String cuclass;
    private  int  cunumber;
    private  String  cudescribe;
    private  String  state;


    public Ordertable() {
    }

    public Ordertable(int oid, int tid, String lbuilding, String lclassroom, String orderDate, String starttime, String endtime, String cuweek, String cusection, String cuname, String cuproject, String cuclass, int cunumber, String cudescribe, String state) {
        this.oid = oid;
        this.tid = tid;
        this.lbuilding = lbuilding;
        this.lclassroom = lclassroom;
        this.orderDate = orderDate;
        this.starttime = starttime;
        this.endtime = endtime;
        this.cuweek = cuweek;
        this.cusection = cusection;
        this.cuname = cuname;
        this.cuproject = cuproject;
        this.cuclass = cuclass;
        this.cunumber = cunumber;
        this.cudescribe = cudescribe;
        this.state = state;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getCuproject() {
        return cuproject;
    }

    public void setCuproject(String cuproject) {
        this.cuproject = cuproject;
    }

    public String getCuclass() {
        return cuclass;
    }

    public void setCuclass(String cuclass) {
        this.cuclass = cuclass;
    }

    public int getCunumber() {
        return cunumber;
    }

    public void setCunumber(int cunumber) {
        this.cunumber = cunumber;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getState() {
        return state;
    }

    public String getLbuilding() {
        return lbuilding;
    }

    public void setLbuilding(String lbuilding) {
        this.lbuilding = lbuilding;
    }

    public String getCudescribe() {
        return cudescribe;
    }

    public void setCudescribe(String cudescribe) {
        this.cudescribe = cudescribe;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getLclassroom() {
        return lclassroom;
    }

    public void setLclassroom(String lclassroom) {
        this.lclassroom = lclassroom;
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

    public String getCuname() {
        return cuname;
    }

    public void setCuname(String cuname) {
        this.cuname = cuname;
    }

    public String getDescribe() {
        return cudescribe;
    }

    public void setDescribe(String describe) {
        this.cudescribe = cudescribe;
    }
}
