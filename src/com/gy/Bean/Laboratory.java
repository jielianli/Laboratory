package com.gy.Bean;

/**
 * 类名：Laboratory
 * 描述：人生苦短，及时行乐
 * 作者：王金星
 * 日期：2021/5/4 14:26
 * 版本：V1.0
 */
public class Laboratory {
    private int lid;
    private  String lbuilding;
    private  String lclassroom;
    private int laccommodate;
    private  String lfree;
    private  String lremarks;
    private  String  roomstate;

    public Laboratory() {
    }

    public Laboratory(int lid, String lbuilding, String lclassroom, int laccommodate, String lfree, String lremarks, String roomstate) {
        this.lid = lid;
        this.lbuilding = lbuilding;
        this.lclassroom = lclassroom;
        this.laccommodate = laccommodate;
        this.lfree = lfree;
        this.lremarks = lremarks;
        this.roomstate = roomstate;
    }

    public int getLid() {
        return lid;
    }

    public String getRoomstate() {
        return roomstate;
    }

    public void setRoomstate(String roomstate) {
        this.roomstate = roomstate;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public String getLbuilding() {
        return lbuilding;
    }

    public void setLbuilding(String lbuilding) {
        this.lbuilding = lbuilding;
    }

    public String getLclassroom() {
        return lclassroom;
    }

    public void setLclassroom(String lclassroom) {
        this.lclassroom = lclassroom;
    }

    public int getLaccommodate() {
        return laccommodate;
    }

    public void setLaccommodate(int laccommodate) {
        this.laccommodate = laccommodate;
    }

    public String getLfree() {
        return lfree;
    }

    public void setLfree(String lfree) {
        this.lfree = lfree;
    }

    public String getLremarks() {
        return lremarks;
    }

    public void setLremarks(String lremarks) {
        this.lremarks = lremarks;
    }
}
