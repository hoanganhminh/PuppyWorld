package model;

public class AllOrder {
    private int orderID;
    private int uID;
    private int pID;
    private int amount;

    public AllOrder() {
    }

    public AllOrder(int orderID, int uID, int pID, int amount) {
        this.orderID = orderID;
        this.uID = uID;
        this.pID = pID;
        this.amount = amount;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
}
