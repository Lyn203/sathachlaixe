package entities;
// Generated Nov 7, 2017 7:36:03 PM by Hibernate Tools 4.3.1



/**
 * Thuchanh generated by hbm2java
 */
public class Thuchanh  implements java.io.Serializable {


     private Integer thuchanhMa;
     private String thuchanhNgay;
     private String thuchanhDiadiem;
     private String thuchanhTinhtp;

    public Thuchanh() {
    }

    public Thuchanh(String thuchanhNgay, String thuchanhDiadiem, String thuchanhTinhtp) {
       this.thuchanhNgay = thuchanhNgay;
       this.thuchanhDiadiem = thuchanhDiadiem;
       this.thuchanhTinhtp = thuchanhTinhtp;
    }
   
    public Integer getThuchanhMa() {
        return this.thuchanhMa;
    }
    
    public void setThuchanhMa(Integer thuchanhMa) {
        this.thuchanhMa = thuchanhMa;
    }
    public String getThuchanhNgay() {
        return this.thuchanhNgay;
    }
    
    public void setThuchanhNgay(String thuchanhNgay) {
        this.thuchanhNgay = thuchanhNgay;
    }
    public String getThuchanhDiadiem() {
        return this.thuchanhDiadiem;
    }
    
    public void setThuchanhDiadiem(String thuchanhDiadiem) {
        this.thuchanhDiadiem = thuchanhDiadiem;
    }
    public String getThuchanhTinhtp() {
        return this.thuchanhTinhtp;
    }
    
    public void setThuchanhTinhtp(String thuchanhTinhtp) {
        this.thuchanhTinhtp = thuchanhTinhtp;
    }




}


