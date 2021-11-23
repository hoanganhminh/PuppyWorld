package model;

public class Cart {
    private int AccountID;
    private int ProductID;
    private int Amount;

    public Cart() {
    }

    public Cart(int AccountID, int ProductID, int Amount) {
        this.AccountID = AccountID;
        this.ProductID = ProductID;
        this.Amount = Amount;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getAmount() {
        return Amount;
    }

    public void setAmount(int Amount) {
        this.Amount = Amount;
    }
    
}
