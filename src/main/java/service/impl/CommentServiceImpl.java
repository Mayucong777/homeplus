package service.impl;

import dao.CommentMapper;
import dao.OrderMapper;
import dao.PersonMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import entity.Comment;
import entity.Customer;
import entity.Order;
import service.CommentService;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private PersonMapper personMapper;

    @Override
    public List<Comment> getCommentListByID(int id) {
        List<Order> orderList = orderMapper.getOrderListByHKID(id);
        List<Comment> commentList = new ArrayList<>();
        for (Order order : orderList) {
            int orderID = order.getId();
            int cmID = order.getCmID();
            Customer customer = personMapper.selectCustomerByID(cmID);
            if (commentMapper.getCommentByOrderID(orderID) == null) {
                continue;
            } else {
                Comment comment = commentMapper.getCommentByOrderID(orderID);
                comment.setCommentPublicer(customer.getCmNickname());
                commentList.add(comment);
            }
        }
        return commentList;
    }

    @Override
    public Integer insertComment(Comment comment) {
        return commentMapper.insertComment(comment);
    }

    @Override
    public Comment getCommentByOrderID(int orderID) {
        return commentMapper.getCommentByOrderID(orderID);
    }
}
