package service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.AppointmentMapper;
import dao.OrderMapper;
import dao.TypeMapper;
import dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import entity.Appointment;
import entity.Order;
import service.OrderService;
import service.exception.UserNoLoginException;
import utils.CalcDate;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    private static int PAGESIZE = 10;

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private AppointmentMapper appointmentMapper;

    @Override
    public PageInfo<Order> getAllOrder(HttpSession session, int currentPage) {
        String username = session.getAttribute("username").toString();
        if (StringUtils.isEmpty(username)) {
            throw new UserNoLoginException("用户未登录...");
        } else {
            int cmID = userMapper.selectCmIDByPhone(username);
            if (currentPage <= 0) {
                currentPage = 1;
            }
            PageHelper.startPage(currentPage, PAGESIZE);
            List<Order> list = orderMapper.getAllOrder(cmID);
            PageInfo<Order> pageInfo = new PageInfo<>(list);
            for (Order order : list) {
                String hkName = userMapper.selectHKNameByHkID(order.getHkID());
                order.setHkName(hkName);
                String DatePoor = CalcDate.getDatePoor(order.getOrderBeginTime(), order.getOrderEndTime());
                order.setOrderDur(DatePoor);
            }
            return pageInfo;
        }
    }

    @Override
    public Order getOrderByID(int id) {
        Order order = orderMapper.getOrderByID(id);
        String hkName = userMapper.selectHKNameByHkID(order.getHkID());
        order.setHkName(hkName);
        System.out.println(order.getOrderBeginTime());
        return order;
    }

    @Override
    public Integer deleteOrderByID(int id) {
        return orderMapper.deleteOrderByID(id);
    }

    @Override
    public List<Order> getOrderListByHKID(HttpSession session) throws UserNoLoginException {
        String username = new String();
        if (session == null) {
            throw new UserNoLoginException("用户未登录");
        } else {
            username = session.getAttribute("username").toString();
        }
        int hkID = userMapper.selectHKIDByPhone(username);
        List<Order> list = orderMapper.getOrderListByHKID(hkID);
        return list;
    }

    @Override
    public Integer updateOrderStatusByID(int id, int status) {
        Date endTime = new Date();
        return orderMapper.updateOrderStatusByID(id, status, endTime);
    }

    @Override
    public void cancelOrder(int id) {
        Order order = orderMapper.getOrderByID(id);
        Appointment appointment = new Appointment();
        appointment.setCmID(order.getCmID());
        appointment.setAppBeginTime(order.getOrderBeginTime());
        appointment.setAppPhone(order.getOrderPhone());
        appointment.setAppAddress(order.getOrderAddress());
        appointment.setAppType(typeMapper.getTypeNameByID(order.getTypeID()));
        appointment.setAppStatus(1);
        appointment.setApplyList(new ArrayList<Integer>());
        appointmentMapper.insertAppointment(appointment);
        orderMapper.deleteOrderByID(id);
    }

}
