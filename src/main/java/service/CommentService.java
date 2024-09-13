package service;

import entity.Comment;

import java.util.List;


public interface CommentService {

    /**
     * 通过家政人员的编号来获得对应的评价
     * @param id 家政人员的编号
     * @return 评价列表
     */
    List<Comment> getCommentListByID(int id);

    /**
     * 发布评价
     * @param comment 评价信息
     * @return 受影响的行数
     */
    Integer insertComment (Comment comment);

    Comment getCommentByOrderID(int orderID);
}
