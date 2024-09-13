package service.impl;

import dao.HKPersonMapper;
import dao.MessageMapper;
import dao.ReplyMapper;
import dao.UserMapper;
import entity.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import entity.Message;
import service.MessageService;
import service.exception.NoMessagePermission;
import service.exception.UserNoLoginException;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageMapper messageMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private HKPersonMapper hkPersonMapper;

    /**
     * unreadStatus 表示未读状态
     */
    private final int unreadStatus = 0;
    /**
     * readStatus 表示已读
     */
    private final int readStatus = 1;

    @Override
    public List<Message> getMessageByToID(HttpSession session) {
        String phone = (String)session.getAttribute("username");
        if (StringUtils.isEmpty(phone)) {
            throw new UserNoLoginException("用户未登录!");
        } else {
            int id = userMapper.selectHKIDByPhone(phone);
            return messageMapper.getMessageByToID(id);
        }
    }

    @Override
    public Integer insertMessage(String msgContent, HttpSession session, int toID) throws UserNoLoginException, NoMessagePermission {
        String phone = (String)session.getAttribute("username");
        String toPhone = hkPersonMapper.getHousekeeperByID(toID).getHkPhone();
        if (StringUtils.isEmpty(phone)) {
            throw new UserNoLoginException("用户未登录！");
        } else if (phone.equals(toPhone) ) {
            throw new NoMessagePermission("不能给自己留言！");
        } else {
            Message message = new Message();
            int fromID = userMapper.selectCmIDByPhone(phone);
            Date now = new Date();
            message.setContent(msgContent);
            message.setCreatedTime(now);
            message.setFromID(fromID);
            message.setToID(toID);
            //只能用户给家政人员留言，家政人员只能回复
            message.setMessageStatus(0);
            return  messageMapper.insertMessage(message);
        }
    }

    @Override
    public List<Message> getMessageByFromID(HttpSession session) {
        String phone = (String)session.getAttribute("username");
        if (StringUtils.isEmpty(phone)) {
            throw new UserNoLoginException("用户未登录!");
        } else {
            int id = userMapper.selectCmIDByPhone(phone);
            return messageMapper.getMessageByFromID(id);
        }
    }

    @Override
    public Message getSingleMessage(HttpSession session, Integer id) {
        Message message = messageMapper.getMessageByID(id);
        String fromNickname = "";
        String toNickname = "";
        //状态为0，代表是消费者回复家政人员，fromID为消费者的id
        if(message.getMessageStatus() == 0){
            fromNickname = userMapper.selectCmNicknameByCmID(message.getFromID());
            toNickname = userMapper.selectHKNicknameByHkID(message.getToID());
        }
        //状态为1，代表是家政人员回复消费者，fromID为家政人员的id
        else{
            fromNickname = userMapper.selectHKNicknameByHkID(message.getFromID());
            toNickname = userMapper.selectCmNicknameByCmID(message.getToID());
        }
        message.setFromName(fromNickname);
        message.setToName(toNickname);
        return message;
    }
}
