package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import entity.*;
import service.CommentService;
import service.CompanyService;
import service.HKPersonService;
import service.IndexService;
import service.exception.UserNoLoginException;
import utils.UploadFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping("/hk-person")
public class HKPersonController extends BaseController{

    @Autowired
    private HKPersonService hkPersonService;
    @Autowired
    private CompanyService companyService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private IndexService indexService;

    @RequestMapping("/getHKPerson")
    @ResponseBody
    public ResponseResult<HouseKeeper> getHKPerson (
            HttpSession session
    ) {
        ResponseResult<HouseKeeper> result = new ResponseResult<>();
        HouseKeeper hk = hkPersonService.selectHKByPhone(session);
        result.setData(hk);
        return result;
    }

    @RequestMapping("/getAllCertifyCompany")
    @ResponseBody
    public ResponseResult<List<Company>> getAllCertifyCompany () {
        ResponseResult<List<Company>> result = new ResponseResult<>();
        List<Company> list = companyService.getCompanyByStatus(1);
        result.setData(list);
        return result;
    }

    @RequestMapping("/getAllTypeDetail")
    @ResponseBody
    public ResponseResult<List<Type>> getAllTypeDetail(){
        ResponseResult<List<Type>> result = new ResponseResult<>();
        List<Type> list = indexService.getAllTypeDetail();
        result.setData(list);
        return result;
    }

    @RequestMapping("/updateHousekeeperInfo")
    @ResponseBody
    public ResponseResult<Void> updateHousekeeperInfo (
            HttpSession session,
            HttpServletRequest request,
            MultipartFile avatarFile,
            @RequestParam("nickname") String nickName,
            @RequestParam("phone") String phone,
            @RequestParam("password") String password,
            @RequestParam("email") String email
    ) throws IOException {
        //HouseKeeper houseKeeper = new HouseKeeper();
        HouseKeeper houseKeeper = hkPersonService.selectHKByPhone(session);
        houseKeeper.setHkNickname(nickName);
        houseKeeper.setHkPhone(phone);
        houseKeeper.setHkPassword(password);
        houseKeeper.setHkEmail(email);
        if (avatarFile.getSize() != 0) {
            String filePath = UploadFile.uploadFile(request, avatarFile);
            houseKeeper.setHkHeadphoto(filePath);
        } else {
            String originImg = hkPersonService.selectHKByPhone(session).getHkHeadphoto();
            houseKeeper.setHkHeadphoto(originImg);
        }
        hkPersonService.updateHousekeeperInfo(session, houseKeeper);

        return new ResponseResult<>();
    }

    @RequestMapping("/updateHKPerson")
    @ResponseBody
    public ResponseResult<Void> updateHKPerson (
            HttpSession session,
            @RequestParam("slogan") String slogan,
            @RequestParam("desc") String desc,
            @RequestParam("desc_detail") String desc_detail,
            @RequestParam("typelist") String typelist,
            @RequestParam("company") int companyID,
            @RequestParam("settle") int settle

    ) {
        String phone = (String)session.getAttribute("username");
        if (StringUtils.isEmpty(phone)) {
            throw new UserNoLoginException("用户未登录");
        } else {
            //HouseKeeper houseKeeper = new HouseKeeper();
            HouseKeeper houseKeeper = hkPersonService.selectHKByPhone(session);
            houseKeeper.setHkSlogan(slogan);
            houseKeeper.setHkDesc(desc);
            houseKeeper.setHkDescDetail(desc_detail);
            if(!typelist.equals("-1")){
                houseKeeper.setTypeList(typelist);
            }
            if(companyID != -1){
                houseKeeper.setCompanyID(companyID);
            }
            houseKeeper.setHkSettle(settle);
            houseKeeper.setHkPhone(phone);
            hkPersonService.updateHKPerson(houseKeeper);
            return new ResponseResult<>();
        }
    }

    @RequestMapping("/certifyHKPerson")
    @ResponseBody
    public ResponseResult<Void> certifyCustomer (
            HttpServletRequest request,
            HttpSession session,
            MultipartFile cardPhoto,
            MultipartFile certifyPhoto,
            @RequestParam("name") String name,
            @RequestParam("cardID") String cardID
    ) throws IOException {
        String phone = (String)session.getAttribute("username");
        if (StringUtils.isEmpty(phone)) {
            throw new UserNoLoginException("用户未登录");
        } else {
            HouseKeeper houseKeeper = new HouseKeeper();
            houseKeeper.setHkPhone(phone);
            houseKeeper.setHkName(name);
            houseKeeper.setHkStatus(2);
            houseKeeper.setHkCardID(cardID);
            String filePath = new String();
            String certifyFilePath = new String();
            if (cardPhoto.getSize() != 0) {
                filePath = UploadFile.uploadFile(request, cardPhoto);
                System.out.println(filePath);
            } else {
                filePath = "/upload/list-head.png";
            }

            if (certifyPhoto.getSize() != 0) {
                certifyFilePath = UploadFile.uploadFile(request, certifyPhoto);
                System.out.println(certifyFilePath);
            } else {
                certifyFilePath = "/upload/list-head.png";
            }

            houseKeeper.setHkCertifyPhoto(certifyFilePath);
            houseKeeper.setHkCardPhoto(filePath);
            hkPersonService.certifyHK(houseKeeper);
            return new ResponseResult<Void>();
        }
    }

    @RequestMapping("/getCertifyStatus")
    @ResponseBody
    public ResponseResult<Integer> getCertifyStatus (
        HttpSession session
    ) {
        ResponseResult<Integer> result = new ResponseResult<>();
        String phone = (String)session.getAttribute("username");
        if (StringUtils.isEmpty(phone)) {
            throw new UserNoLoginException("用户未登录");
        } else {
            Integer status = hkPersonService.getCertifyStatus(phone);
            result.setData(status);
        }
        return result;
    }

    @RequestMapping("/certifyCompany")
    @ResponseBody
    public ResponseResult<Void> certifyCompany (
            HttpServletRequest request,
            MultipartFile regPhoto,
            @RequestParam("name") String name ,
            @RequestParam("phone") String phone,
            @RequestParam("address") String address,
            @RequestParam("regID") String regID
    ) throws IOException {
        Company company = new Company();
        company.setName(name);
        company.setPhone(phone);
        company.setAddress(address);
        company.setBusRegNum(regID);
        company.setCompanyStatus(2);
        String filePath = new String();
        if (regPhoto.getSize() != 0) {
            filePath = UploadFile.uploadFile(request, regPhoto);
            System.out.println(filePath);
        } else {
            filePath = "/upload/list-head.png";
        }
        company.setBusLicPhoto(filePath);
        companyService.certifyCompany(company);
        return new ResponseResult<>();
    }


    @RequestMapping("/loadContent")
    @ResponseBody
    public ResponseResult<HouseKeeper> loadContent (
            @RequestParam("param") Integer param
    ) {
        ResponseResult<HouseKeeper> result = new ResponseResult<>();
        HouseKeeper hk = hkPersonService.getHousekeeperByID(param);
        result.setData(hk);
        return result;
    }

    @RequestMapping("/loadCompanyInfo")
    @ResponseBody
    public ResponseResult<Company> loadCompanyInfo (
            @RequestParam("param") Integer param
    ) {
        ResponseResult<Company> result = new ResponseResult<>();
        Company company = companyService.getCompanyByHKID(param);
        result.setData(company);
        return result;
    }

    @RequestMapping("/loadCompanyCertifyInfo")
    @ResponseBody
    public ResponseResult<Company> loadCompanyCertifyInfo (
            HttpSession session
    ) {
        ResponseResult<Company> result = new ResponseResult<>();
        HouseKeeper hk = hkPersonService.selectHKByPhone(session);
        Company company = companyService.getCompanyByID(hk.getCompanyID());
        if(company != null){
            result.setData(company);
        }else{
            result.setState(406);
        }
        return result;
    }

    @RequestMapping("/loadComment")
    @ResponseBody
    public ResponseResult<List<Comment>> loadComment (
            @RequestParam("param") Integer param
    ) {
        ResponseResult<List<Comment>> result = new ResponseResult<>();
        List<Comment> list = commentService.getCommentListByID(param);
        result.setData(list);
        return result;
    }
}
