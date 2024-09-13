package dao;

import entity.Reply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {
    /**
     * 根据留言的 id 来获得该条留言下的所有回复内容
     * @param id 收件人的 id
     * @return 消息列表
     */
    List<Reply> getReplyByMessageID (@Param("messageID") int id);

    /**
     * 插入回复数据
     * @param reply 回复数据
     * @return 受影响的行数
     */
    Integer insertReply (Reply reply);


    /**
     * 按回复id删除一条回复数据
     * @param id 回复id
     * @return 受影响的行数
     */
    int deleteReplyByID(int id);
}
