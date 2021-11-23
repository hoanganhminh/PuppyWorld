package dao;

import context.DBContext;
import model.Category;
import model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.AllOrder;
import model.Cart;
import model.TotalPrice;

public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), //id
                        rs.getString(2), //name
                        rs.getString(3), //image
                        rs.getDouble(4), //price
                        rs.getString(5), //title
                        rs.getString(6))); //description
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductBySearch(String name) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where [name] like ?";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), //id
                        rs.getString(2), //name
                        rs.getString(3), //image
                        rs.getDouble(4), //price
                        rs.getString(5), //title
                        rs.getString(6))); //description
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) { //hàm get sản phẩm
        String query = "select * from product\n"
                + "where id = ?"; //LẤY ID SẢN PHẨM
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProductBySellID(int id) { //hàm get sản phẩm
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where sell_ID = ?";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account login(String user, String pass) {
        String query = "select * from Account where [user] = ? and pass = ?";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccExist(String user) {
        String query = "select * from account where [user] = ?";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signUp(String user, String pass) {
        String query = "insert into Account values(?,?,0,0)";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> getProductByCID(String cid) { //lấy danh sách từng loại chó
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where cateID = ?";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategory() { ////hàm lấy dữ liệu các loại chó từ database
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);//chạy câu lệnh lấy danh sách chó
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), //cid
                        rs.getString(2))); //cname
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getLastDog() { //hàm lấy con chó được thêm vào mới nhất
        String query = "select top 1 * from product\n" //chọn 1 con duy nhất trên cùng
                + "order by id desc"; //sắp xếp từ trên xuống để tìm con mới nhất xét theo id
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteDog(String pid) {
        String query = "delete from product where id = ?";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addDog(String name, String image, String price, String title, String description, String category, int sid) {
        String query = "insert [dbo].[product] ([name],[image],[price],[title],[description],[cateID],[sell_ID]) values(?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setInt(7, sid);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public void editDog(String name, String image, String price, String title, String description, String category, String pid) {
        String query = "update product set [name] = ?, [image] = ?, price = ?, title = ?, [description] = ?, cateID = ? where id = ?";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, pid);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public List<Product> getAllDogTangDan() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" //chọn 1 con duy nhất trên cùng
                + "order by price asc";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), //id
                        rs.getString(2), //name
                        rs.getString(3), //image
                        rs.getDouble(4), //price
                        rs.getString(5), //title
                        rs.getString(6))); //description
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAllDogGiamDan() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" //chọn 1 con duy nhất trên cùng
                + "order by price desc";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), //id
                        rs.getString(2), //name
                        rs.getString(3), //image
                        rs.getDouble(4), //price
                        rs.getString(5), //title
                        rs.getString(6))); //description
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAllDogMoiNhat() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" //chọn 1 con duy nhất trên cùng
                + "order by id desc";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), //id
                        rs.getString(2), //name
                        rs.getString(3), //image
                        rs.getDouble(4), //price
                        rs.getString(5), //title
                        rs.getString(6))); //description
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAllDogCuNhat() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" //chọn 1 con duy nhất trên cùng
                + "order by id asc";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), //id
                        rs.getString(2), //name
                        rs.getString(3), //image
                        rs.getDouble(4), //price
                        rs.getString(5), //title
                        rs.getString(6))); //description
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAllDogTheoTungLoai() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" //chọn 1 con duy nhất trên cùng
                + "order by cateID asc";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), //id
                        rs.getString(2), //name
                        rs.getString(3), //image
                        rs.getDouble(4), //price
                        rs.getString(5), //title
                        rs.getString(6))); //description
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1), //id
                        rs.getString(2), //name
                        rs.getString(3), //image
                        rs.getInt(4), //price
                        rs.getInt(5))); //description
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getCartByUserId(int id) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT id, name, image, (price*Amount) as price, title, description, Amount from \n"
                + "(select AccountID, ProductID, count(Amount) as Amount\n"
                + "from Cart\n"
                + "group by AccountID, ProductID\n"
                + ")\n"
                + "As a\n"
                + "inner join product on a.ProductID = id\n"
                + "where AccountID = ?";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), //id
                        rs.getString(2), //name
                        rs.getString(3), //image
                        rs.getDouble(4), //price
                        rs.getString(5), //title
                        rs.getString(6),
                        rs.getInt(7))); //description
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addCart(int uid, String pid) {
        String query = "insert [dbo].[Cart] ([AccountID],[ProductID],[Amount]) values(?,?,1)";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.setString(2, pid);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public void deleteDogCart(int uid, String pid) {
        String query = "delete from Cart where AccountID = ? and ProductID = ? ";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.setString(2, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void minusDogCart(int uid, String pid) {
        String query = "delete top(1) from Cart where AccountID = ? and ProductID = ? ";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.setString(2, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public TotalPrice totalPrice(int id) {
        String query = "SELECT SUM(price*Amount) as price\n"
                + "from \n"
                + "(select AccountID, ProductID, count(Amount) as Amount\n"
                + "from Cart\n"
                + "group by AccountID, ProductID)\n"
                + "As a\n"
                + "inner join product on a.ProductID = id\n"
                + "where AccountID = ?\n"
                + "group by AccountID";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new TotalPrice(rs.getDouble(1)); //description
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void orderSuccess(int uID, String price, String phone, String address) {
        String query = "insert into OrderBill values(?,?,?,?)";
        try {
            conn = new DBContext().doConnect();
            ps = conn.prepareStatement(query);
            ps.setInt(1, uID);
            ps.setString(2, price);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void orderedThenDeleteCart() {
        String query = "with a as (select AccountID, ProductID, count(Amount) as Amount from Cart group by AccountID, ProductID)\n"
                + "INSERT INTO Ordered(uID,pID,amount)\n"
                + "SELECT AccountID , ProductID , Amount FROM a; delete from Cart";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateOrderIDOfOder() {
        String query = "UPDATE Ordered\n"
                + "SET orderID = (select top(1) orderID from OrderBill order by orderID desc)\n"
                + "WHERE orderID is null";
        try {
            conn = new DBContext().doConnect();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public List<AllOrder> getAllOrder() {
        List<AllOrder> list = new ArrayList<>();
        String query = "select * from Ordered";
        try {
            conn = new DBContext().doConnect();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new AllOrder(rs.getInt(1), //id
                        rs.getInt(2), //name
                        rs.getInt(3), //image
                        rs.getInt(4))); //description
            }
        } catch (Exception e) {
        }
        return list;
    }
}
