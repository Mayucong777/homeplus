package service.impl;

import dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import entity.HouseKeeper;
import service.HKPersonService;
import service.exception.UserNoLoginException;

import javax.servlet.http.HttpSession;
import java.util.List;


@Service
public class HKPersonServiceImpl implements HKPersonService{

    @Autowired
    private HKPersonMapper hkPersonMapper;
    @Autowired
    private IndexMapper indexMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private CompanyMapper companyMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public HouseKeeper selectHKByPhone(HttpSession session) {
        String phone = (String)session.getAttribute("username");
        if (StringUtils.isEmpty(phone)) {
            throw new UserNoLoginException("用户未登录");
        } else {
            HouseKeeper houseKeeper = hkPersonMapper.selectHKByPhone(phone);
            String typeList = "";
            String companyName = "";
            if (houseKeeper.getTypeList() != null){
                String typeIDList[] = houseKeeper.getTypeList().split(",");
                for(int i=0;i<typeIDList.length;i++){
                    if(i == typeIDList.length - 1){
                        typeList = typeList + typeMapper.getTypeNameByID(Integer.parseInt(typeIDList[i]));
                    }else{
                        typeList = typeList + typeMapper.getTypeNameByID(Integer.parseInt(typeIDList[i])) + ",";
                    }
                }
            }
            if (companyMapper.getCompanyByID(houseKeeper.getCompanyID()) != null){
                companyName = companyMapper.getCompanyByID(houseKeeper.getCompanyID()).getName();
            }
            houseKeeper.setCompanyName(companyName);
            houseKeeper.setTypeNameList(typeList);
            return houseKeeper;
        }
    }

    @Override
    public Integer updateHKPerson(HouseKeeper houseKeeper) {
        return hkPersonMapper.updateHK(houseKeeper);
    }

    @Override
    public Integer certifyHK(HouseKeeper houseKeeper) {
        return hkPersonMapper.certifyHK(houseKeeper);
    }

    @Override
    public Integer getCertifyStatus(String phone) {
        return hkPersonMapper.selectHKStatusByPhone(phone);
    }

    @Override
    public List<HouseKeeper> getHKListFuzzySelect(Integer typeid) {
        String typeIDStr = typeid.toString();
        List<HouseKeeper> list = hkPersonMapper.getHKListFuzzySelect(typeIDStr);
        for (HouseKeeper hk : list) {
            if (StringUtils.isEmpty(hk.getCompanyID())) {
                hk.setCompanyName("个人");
            } else {
                hk.setCompanyName(indexMapper.getCompanyNameByID(hk.getCompanyID()));
            }
        }
        return list;
    }

    @Override
    public HouseKeeper getHousekeeperByID(Integer id) {
        HouseKeeper hk = hkPersonMapper.getHousekeeperByID(id);
        hk.setCompanyName(indexMapper.getCompanyNameByID(hk.getCompanyID()));
        return hk;
    }

    @Override
    public void updateHousekeeperInfo(HttpSession session, HouseKeeper houseKeeper) {
        String phone = (String)session.getAttribute("username");
        if (StringUtils.isEmpty(phone)) {
            throw new UserNoLoginException("用户未登录");
        } else {
            houseKeeper.setHkPhone(phone);
            userMapper.updatePassword(houseKeeper.getHkPhone(), houseKeeper.getHkPassword());
            hkPersonMapper.updateHousekeeperInfo(houseKeeper);
        }
    }
}
