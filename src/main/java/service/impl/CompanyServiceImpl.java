package service.impl;

import dao.CompanyMapper;
import dao.HKPersonMapper;
import dao.IndexMapper;
import entity.HouseKeeper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import entity.Company;
import service.CompanyService;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyMapper companyMapper;

    @Autowired
    private HKPersonMapper hkPersonMapper;

    @Autowired
    private IndexMapper indexMapper;

    @Override
    public List<Company> getCompanyByStatus(int status) {
        return companyMapper.getCompanyByStatus(status);
    }

    @Override
    public Integer certifyCompany(Company company) {
        return companyMapper.certifyCompany(company);
    }

    @Override
    public Company getCompanyByHKID(Integer id) {
        HouseKeeper hk = hkPersonMapper.getHousekeeperByID(id);
        return companyMapper.getCompanyByID(hk.getCompanyID());
    }

    @Override
    public Company getCompanyByID(int companyID) {
        return companyMapper.getCompanyByID(companyID);
    }
}
