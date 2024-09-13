package controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import entity.Comment;
import entity.Order;
import entity.ResponseResult;
import service.CommentService;
import service.OrderService;
import service.exception.UserNoLoginException;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private CommentService commentService;

    @RequestMapping("/getAllOrder")
    @ResponseBody
    public ResponseResult<PageInfo<Order>> getAllOrder (
            HttpSession session,
            @RequestParam(required = false,defaultValue = "1",value = "pageNum")Integer currentPage
    ) {
        ResponseResult<PageInfo<Order>> result = new ResponseResult<>();
        if (session == null) {
            throw new UserNoLoginException("用户未登录");
        } else {
            PageInfo<Order> list = orderService.getAllOrder(session, currentPage);
            result.setData(list);
        }
        return result;
    }

    @RequestMapping("/getOrderByID")
    @ResponseBody
    public ResponseResult<Order> getOrderByID (
            @RequestParam("orderID") int id
    ) {
        ResponseResult<Order> result = new ResponseResult<>();
        Order order = orderService.getOrderByID(id);
        result.setData(order);
        return result;
    }

    @RequestMapping("/getOrderCommentByID")
    @ResponseBody
    public ResponseResult<Comment> getOrderCommentByID(
            @RequestParam("orderID") int orderID
    ){
        ResponseResult<Comment> result = new ResponseResult<>();
        Comment comment = commentService.getCommentByOrderID(orderID);
        if (comment != null){result.setData(comment);}
        else{
            result.setData(null);
        }
        return result;
    }

    @RequestMapping("/deleteOrderByID")
    @ResponseBody
    public ResponseResult<Void> deleteOrderByID (
            @RequestParam("orderID") int id
    ) {
        orderService.deleteOrderByID(id);
        return new ResponseResult<>();
    }

    @RequestMapping("/getOrderListByHKID")
    @ResponseBody
    public ResponseResult<List<Order>> getOrderListByHKID (
            HttpSession session
    ) {
       ResponseResult<List<Order>> result = new ResponseResult<>();
       List<Order> list = orderService.getOrderListByHKID(session);
       result.setData(list);
       return result;
    }

    @RequestMapping("/acceptOrder")
    @ResponseBody
    public ResponseResult<Void> acceptOrder (
            @RequestParam("id") int id
    ) {
        orderService.updateOrderStatusByID(id, 1);
        return new ResponseResult<>();
    }

    @RequestMapping("/finishOrder")
    @ResponseBody
    public ResponseResult<Void> finishOrder (
            @RequestParam("id") int id
    ) {
        orderService.updateOrderStatusByID(id, 0);
        return new ResponseResult<>();
    }

    @RequestMapping("/cancelOrder")
    @ResponseBody
    public ResponseResult<Void> cancelOrder (
            @RequestParam("id") int id
    ) {
        orderService.cancelOrder(id);
        return new ResponseResult<>();
    }

    @RequestMapping("/assessOrder")
    @ResponseBody
    public ResponseResult<Void> assessOrder (
            @RequestParam("orderID") int orderID,
            @RequestParam("commentStar") int commentStar,
            @RequestParam("commentContent") String commentContent
    ) {
        Comment comment = new Comment();
        comment.setOrderID(orderID);
        comment.setCommentStar(commentStar);
        comment.setCommentContent(commentContent);
        Date now = new Date();
        comment.setCommentTime(now);
        commentService.insertComment(comment);
        return new ResponseResult<>();
    }
}
