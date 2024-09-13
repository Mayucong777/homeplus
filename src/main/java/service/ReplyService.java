package service;

import entity.Reply;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ReplyService {

    List<Reply> getReplyByMessageID(HttpSession session,int messageID);

    Integer insertReply (String replyContent,HttpSession session,int messageID);

    int deleteSingleReply(int id);
}
