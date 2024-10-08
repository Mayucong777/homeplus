package entity;

import java.util.Date;
import java.util.List;

public class Appointment {

    private int id;
    private int cmID;
    private String appType;
    private String appAddress;
    private String appPhone;
    private String applyJson;
    private List<Integer> applyList;
    private int appStatus;
    private Date appBeginTime;
    private int hkID;
    private String hkNickname;
    private List<String> applyNameList;

    public List<String> getApplyNameList() {
        return applyNameList;
    }

    public void setApplyNameList(List<String> applyNameList) {
        this.applyNameList = applyNameList;
    }

    public String getHkNickname() {
        return hkNickname;
    }

    public void setHkNickname(String hkNickname) {
        this.hkNickname = hkNickname;
    }

    public String getApplyJson() {
        return applyJson;
    }

    public void setApplyJson(String applyJson) {
        this.applyJson = applyJson;
    }

    public int getHkID() {
        return hkID;
    }

    public void setHkID(int hkID) {
        this.hkID = hkID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Integer> getApplyList() {
        return applyList;
    }

    public void setApplyList(List<Integer> applyList) {
        this.applyList = applyList;
    }


    public Date getAppBeginTime() {
        return appBeginTime;
    }

    public void setAppBeginTime(Date appBeginTime) {
        this.appBeginTime = appBeginTime;
    }

    public int getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(int appStatus) {
        this.appStatus = appStatus;
    }

    public int getCmID() {
        return cmID;
    }

    public void setCmID(int cmID) {
        this.cmID = cmID;
    }

    public String getAppType() {
        return appType;
    }

    public void setAppType(String appType) {
        this.appType = appType;
    }

    public String getAppAddress() {
        return appAddress;
    }

    public void setAppAddress(String appAddress) {
        this.appAddress = appAddress;
    }

    public String getAppPhone() {
        return appPhone;
    }

    public void setAppPhone(String appPhone) {
        this.appPhone = appPhone;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "cmID=" + cmID +
                ", appType='" + appType + '\'' +
                ", appAddress='" + appAddress + '\'' +
                ", appPhone='" + appPhone + '\'' +
                '}';
    }
}
