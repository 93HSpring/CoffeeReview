package com.hspring.coffeereview.biz.board;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


// Value Object
@Entity // JPA
@Table(name = "CAFES")
public class BoardVO {
   
   @Id
   @GeneratedValue
   private String id;
   private String cname;
   private int kcal;
   private int sugars;
   private int sodium;
   private int caffeine;
   private int star;
   private BigDecimal savg;
   @Transient // JPA
   private String searchCondition;
   @Transient // JPA
   private String searchKeyword;
   @Transient // JPA
   private MultipartFile uploadFile;
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getCname() {
      return cname;
   }
   public void setCname(String cname) {
      this.cname = cname;
   }
   public int getKcal() {
      return kcal;
   }
   public void setKcal(int kcal) {
      this.kcal = kcal;
   }
   public int getSugars() {
      return sugars;
   }
   public void setSugars(int sugars) {
      this.sugars = sugars;
   }
   public int getSodium() {
      return sodium;
   }
   public void setSodium(int sodium) {
      this.sodium = sodium;
   }
   public int getCaffeine() {
      return caffeine;
   }
   public void setCaffeine(int caffeine) {
      this.caffeine = caffeine;
   }
   public int getStar() {
      return star;
   }
   public void setStar(int star) {
      this.star = star;
   }
   public BigDecimal getSavg() {
      return savg;
   }
   public void setSavg(BigDecimal savg) {
      this.savg = savg;
   }
   public String getSearchCondition() {
      return searchCondition;
   }
   public void setSearchCondition(String searchCondition) {
      this.searchCondition = searchCondition;
   }
   public String getSearchKeyword() {
      return searchKeyword;
   }
   public void setSearchKeyword(String searchKeyword) {
      this.searchKeyword = searchKeyword;
   }
   public MultipartFile getUploadFile() {
      return uploadFile;
   }
   public void setUploadFile(MultipartFile uploadFile) {
      this.uploadFile = uploadFile;
   }
   @Override
   public String toString() {
      return "BoardVO [id=" + id + ", kcal=" + kcal + ", sugars=" + sugars + ", sodium=" + sodium + ", caffeine="
            + caffeine + ", star=" + star + ", savg=" + savg + ", uploadFile=" + uploadFile + "]";
   }
   
   
}