package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import entity.Appointment;
import entity.ResponseResult;
import service.AppointmentService;
import utils.FormatDate;

import javax.servlet.http.HttpSession;
import java.util.List;



@Controller()
@RequestMapping("/app")
public class AppointmentController extends BaseController {

    @Autowired
    private AppointmentService appService;

    @RequestMapping("/mkApp")
    @ResponseBody
    public ResponseResult<Void> makeAppoint(
            HttpSession session,
            @RequestParam("app_type") String appType,
            @RequestParam("app_address_province") String appAddressProvince,
            @RequestParam("app_address_city") String appAddressCity,
            @RequestParam("app_address_area") String appAddressArea,
            @RequestParam("app_address_detail") String appAddressDetail,
            @RequestParam("app_phone") String appPhone,
            @RequestParam("app_time") String appTime
    ) {
        ResponseResult<Void> response = new ResponseResult<Void>();
        String username = new String();
        String key = "username";
        if (session.getAttribute(key) == null) {
            response.setState(406);
            response.setMessage("用户未登录");
        } else {
            username = session.getAttribute(key).toString();
        }
        String appAddress = appAddressProvince + "-" + appAddressCity + "-" + appAddressArea + "-" + appAddressDetail;
        Appointment appointment = new Appointment();
        appointment.setAppAddress(appAddress);
        appointment.setAppType(appType);
        appointment.setAppPhone(appPhone);
        appointment.setAppBeginTime(FormatDate.StrToDate(appTime));

        System.out.println("appAddress:" + appAddress + "appType:" + appType + "appPhone:" + appPhone);

        if(appService.insertAppointment(appointment, username)){
            return new ResponseResult<>();
        }
        return response;
    }

    @RequestMapping("/getVaildApp")
    @ResponseBody
    public ResponseResult<List<Appointment>> getVaildApp (
            HttpSession session
    ) {
        ResponseResult<List<Appointment>> result = new ResponseResult<>();
        List<Appointment> list = appService.getStatusApp(session, 1);
        result.setData(list);
        return result;
    }

    @RequestMapping("/getAllApp")
    @ResponseBody
    public ResponseResult<List<Appointment>> getAllApp (
            HttpSession session
    ) {
        ResponseResult<List<Appointment>> result = new ResponseResult<>();
        List<Appointment> list = appService.getAllApp(session);
        result.setData(list);
        return result;
    }

    @RequestMapping("/getAppCustomer")
    @ResponseBody
    public ResponseResult<List<Appointment>> getAppCustomer (
            HttpSession session
    ) {
        ResponseResult<List<Appointment>> result = new ResponseResult<>();
        List<Appointment> list = appService.getAllAppCustomer(session);
        result.setData(list);
        return result;
    }

    @RequestMapping("/apply")
    @ResponseBody
    public ResponseResult<Void> apply (
            HttpSession session,
            Integer id
    ) {
        appService.insertApplyList(session, id);
        return new ResponseResult<Void>();
    }

    @RequestMapping("/getSingleApp")
    @ResponseBody
    public ResponseResult<Appointment> getSingleApp (
            @RequestParam("id") Integer id
    ) {
        ResponseResult<Appointment> result = new ResponseResult<>();
        Appointment app = appService.selectAppointByID(id);
        result.setData(app);
        return result;
    }

    @RequestMapping("/updateAppStatus")
    @ResponseBody
    public ResponseResult<Void> updateAppStatus (
            @RequestParam("id") Integer id
    ) {
        appService.updateAppointStatus(0, id);
        return new ResponseResult<Void>();
    }

    @RequestMapping("/deleteApp")
    @ResponseBody
    public ResponseResult<Void> deleteAppointByID (
            @RequestParam("id") Integer id
    ) {
        appService.deleteAppointByID(id);
        return new ResponseResult<Void>();
    }

    @RequestMapping("/confirmHK")
    @ResponseBody
    public ResponseResult<Void> confirmHK (
            HttpSession session,
            @RequestParam("id") Integer id,
            @RequestParam("hkID") Integer hkID
    ) {
        String username = session.getAttribute("username").toString();
        appService.insertConfirmHKID(username, id, hkID);
        return new ResponseResult<>();
    }
}
