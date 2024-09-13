package service.impl;

import dao.MessageMapper;
import dao.ReplyMapper;
import dao.UserMapper;
import entity.Message;
import entity.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ReplyService;
import utils.FormatDate;

import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    private ReplyMapper replyMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private MessageMapper messageMapper;

    @Override
    public List<Reply> getReplyByMessageID(HttpSession session,int messageID) {
        List<Reply> replys = replyMapper.getReplyByMessageID(messageID);
        List<Reply> replyList = new LinkedList<>();
        for(Reply reply : replys){
            //状态为0，fromID是消费者，toID是家政人员
            if (reply.getReplyStatus() == 0){
                reply.setFromNickname(userMapper.selectCmNicknameByCmID(reply.getFromID()));
                reply.setToNickname(userMapper.selectHKNicknameByHkID(reply.getToID()));
            }
            //状态为1，toID是消费者，fromID是家政人员
            else{
                reply.setFromNickname(userMapper.selectHKNicknameByHkID(reply.getFromID()));
                reply.setToNickname(userMapper.selectCmNicknameByCmID(reply.getToID()));
            }
            replyList.add(reply);
        }
        return replyList;
    }

    @Override
    public Integer insertReply(String replyContent, HttpSession session,int messageID) {
        Message message = messageMapper.getMessageByID(messageID);
        int role = (int) session.getAttribute("role");
        Reply reply = new Reply();
        int fromID = 0;//默认
        int toID = 0;//默认
        int status = -1;//默认
        //角色为0，代表是消费者回复家政人员，fromID为消费者的id
        if(role == 0){
            fromID = message.getFromID();
            toID = message.getToID();
            status = 0;
        }
        //角色为1，代表是家政人员回复消费者，fromID为家政人员的id
        else{
            fromID = message.getToID();
            toID = message.getFromID();
            status = 1;
        }
        String replyTime = FormatDate.getCurrentTime();
        reply.setReplyContent(replyContent);
        reply.setReplyTime(replyTime);
        reply.setReplyStatus(status);
        reply.setFromID(fromID);
        reply.setToID(toID);
        reply.setReplyID(messageID);
        return replyMapper.insertReply(reply);
    }

    @Override
    public int deleteSingleReply(int id) {
        return replyMapper.deleteReplyByID(id);
    }
}
