package dao;

import org.apache.ibatis.annotations.Param;
import entity.Comment;


public interface CommentMapper {

    /**
     * 通过订单号来获得评论信息
     * @param orderID 订单号
     * @return 评论信息
     */
    Comment getCommentByOrderID (@Param("orderID") int orderID);

    /**
     * 插入评价内容
     * @param comment 评价信息
     * @return 受影响的行数
     */
    Integer insertComment (Comment comment);
}
