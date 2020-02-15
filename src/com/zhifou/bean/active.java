package com.zhifou.bean;

public class active {
    private String dateday;
    private int num;

    @Override
    public String toString() {
        String ss = this.dateday+"----"+this.num;
        return ss;
    }


   

    public String getDateday() {
		return dateday;
	}




	public void setDateday(String dateday) {
		this.dateday = dateday;
	}




	public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}