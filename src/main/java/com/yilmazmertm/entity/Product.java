package com.yilmazmertm.entity;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private int id;

    @Column(name = "product_name")
    private String productName;

    @Column(name = "manufacturer")
    private String manufacturer;

    @Column(name = "owner")
    private String owner;

    @Column(name = "created_by")
    private String createdBy;

    @Column(name = "updated_by")
    private String updatedBy;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time", nullable = false)
    private Date create_time;

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "update_time", nullable = false)
    private Date update_time;

    @Column(name = "old_product_name")
    private String oldProductName;

    @Column(name = "model")
    private String model;

    @Column(name = "serial_no")
    private String serialNo;

    @Column(name = "memory_GB")
    private int memoryGb;

    @Column(name = "operating_system")
    private String operatingSystem;

    @Column(name = "domain_name")
    private String domainName;

    @Column(name = "setup_date")
    @DateTimeFormat(pattern = "MM-dd-yyyy")
    private Date setupDate;

    @Column(name = "lan_address")
    private String lanAddress;

    @Column(name = "wlan_address")
    private String wlanAddress;

    @Column(name = "antivirus")
    private String antivirus;

    @Column(name = "license_number")
    private String licenseNumber;

    @Column(name = "office_app")
    private String officeApp;

    @Column(name = "purchase_date")
    @DateTimeFormat(pattern = "MM-dd-yyyy")
    private Date purchaseDate;

    @Column(name = "seller")
    private String seller;

    @Column(name = "product_number")
    private int productNumber;

    @Column(name = "setup_date_for_windows")
    @DateTimeFormat(pattern = "MM-dd-yyyy")
    private Date setupDateForWindows;

    @Column(name = "notes")
    private String notes;

    public String getOldProductName() {
        return oldProductName;
    }

    public void setOldProductName(String oldProductName) {
        this.oldProductName = oldProductName;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getSerialNo() {
        return serialNo;
    }

    public void setSerialNo(String serialNo) {
        this.serialNo = serialNo;
    }

    public int getMemoryGb() {
        return memoryGb;
    }

    public void setMemoryGb(int memoryGb) {
        this.memoryGb = memoryGb;
    }

    public String getOperatingSystem() {
        return operatingSystem;
    }

    public void setOperatingSystem(String operatingSystem) {
        this.operatingSystem = operatingSystem;
    }

    public String getDomainName() {
        return domainName;
    }

    public void setDomainName(String domainName) {
        this.domainName = domainName;
    }

    public Date getSetupDate() {
        return setupDate;
    }

    public void setSetupDate(Date setupDate) {
        this.setupDate = setupDate;
    }

    public String getLanAddress() {
        return lanAddress;
    }

    public void setLanAddress(String lanAddress) {
        this.lanAddress = lanAddress;
    }

    public String getWlanAddress() {
        return wlanAddress;
    }

    public void setWlanAddress(String wlanAddress) {
        this.wlanAddress = wlanAddress;
    }

    public String getAntivirus() {
        return antivirus;
    }

    public void setAntivirus(String antivirus) {
        this.antivirus = antivirus;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public String getOfficeApp() {
        return officeApp;
    }

    public void setOfficeApp(String officeApp) {
        this.officeApp = officeApp;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    public int getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(int productNumber) {
        this.productNumber = productNumber;
    }

    public Date getSetupDateForWindows() {
        return setupDateForWindows;
    }

    public void setSetupDateForWindows(Date setupDateForWindows) {
        this.setupDateForWindows = setupDateForWindows;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {

        this.createdBy = createdBy;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }


}
