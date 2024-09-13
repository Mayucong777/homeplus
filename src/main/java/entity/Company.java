package entity;


public class Company {

    private int id;
    private String name;
    private String phone;
    private String address;
    private String busRegNum;
    private String busLicPhoto;
    private int companyStatus;
    private String companyService;

    public String getCompanyService() {
        return companyService;
    }

    public void setCompanyService(String companyService) {
        this.companyService = companyService;
    }

    public int getCompanyStatus() {
        return companyStatus;
    }

    public void setCompanyStatus(int companyStatus) {
        this.companyStatus = companyStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBusRegNum() {
        return busRegNum;
    }

    public void setBusRegNum(String busRegNum) {
        this.busRegNum = busRegNum;
    }

    public String getBusLicPhoto() {
        return busLicPhoto;
    }

    public void setBusLicPhoto(String busLicPhoto) {
        this.busLicPhoto = busLicPhoto;
    }
}
