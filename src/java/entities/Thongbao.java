package entities;
// Generated Nov 7, 2017 7:36:03 PM by Hibernate Tools 4.3.1



/**
 * Thongbao generated by hbm2java
 */
public class Thongbao  implements java.io.Serializable {


     private Integer thongbaoMa;
     private String thongbaoNoidung;
     private String thongbaoThoigian;

    public Thongbao() {
    }

    public Thongbao(String thongbaoNoidung, String thongbaoThoigian) {
       this.thongbaoNoidung = thongbaoNoidung;
       this.thongbaoThoigian = thongbaoThoigian;
    }
   
    public Integer getThongbaoMa() {
        return this.thongbaoMa;
    }
    
    public void setThongbaoMa(Integer thongbaoMa) {
        this.thongbaoMa = thongbaoMa;
    }
    public String getThongbaoNoidung() {
        return this.thongbaoNoidung;
    }
    
    public void setThongbaoNoidung(String thongbaoNoidung) {
        this.thongbaoNoidung = thongbaoNoidung;
    }
    public String getThongbaoThoigian() {
        return this.thongbaoThoigian;
    }
    
    public void setThongbaoThoigian(String thongbaoThoigian) {
        this.thongbaoThoigian = thongbaoThoigian;
    }




}


