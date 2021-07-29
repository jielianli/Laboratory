package com.gy.Bean;

/**
 * 类名：Page
 * 描述:行动是成功的阶梯,行动越多,登得越高。
 * 作者：劫恋李
 * 日期：2021/7/21 15:26
 */
public class Page {
    private  int pageNum=1;//当前页码，默认第一页
    private  int pageSize=5;//每页显示条数，5条
    private  int pageSum;//总页数，需要计算
    private  int pageTotal;//总条数,查数据库

    public Page() {
    }

    public Page(int pageNum, int pageSize, int pageSum, int pageTotal) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.pageSum = pageSum;
        this.pageTotal = pageTotal;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageSum() {
        //总条数取余，每页显示条数有余数商就多+1，没有余数就是商

        pageSum=pageTotal%pageSize==0 ? pageTotal/pageSize:(pageTotal/pageSize+1);
        return pageSum;
    }

    public void setPageSum(int pageSum) {
        this.pageSum = pageSum;
    }

    public int getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(int pageTotal) {
        this.pageTotal = pageTotal;
    }
}
