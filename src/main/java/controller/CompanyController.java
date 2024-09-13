package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import entity.Company;
import entity.ResponseResult;
import service.CompanyService;

import java.util.List;


@Controller
@RequestMapping("/company")
public class CompanyController extends BaseController {

    @Autowired
    private CompanyService companyService;

    @RequestMapping("/getAllCertifyCompany")
    @ResponseBody
    public ResponseResult<List<Company>> getAllCertifyCompany () {
        ResponseResult<List<Company>> result = new ResponseResult<>();
        List<Company> list = companyService.getCompanyByStatus(1);
        result.setData(list);
        return result;
    }
}
