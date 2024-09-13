package controller;

import entity.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import entity.Message;
import entity.ResponseResult;
import service.MessageService;
import service.PersonService;
import service.ReplyService;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/message")
public class MessageController extends BaseController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private ReplyService replyService;

    /*@RequestMapping("/getMessageByToID")
    @ResponseBody
    public ResponseResult<List<Message>> getMessageByID (
            HttpSession session
    ) {
        ResponseResult<List<Message>> result = new ResponseResult<>();
        List<Message> list = messageService.getMessageByToID(session);
        result.setData(list);
        return result;
    }

    @RequestMapping("/getMessageByFromID")
    @ResponseBody
    public ResponseResult<List<Message>> getMessageByFromID (
            HttpSession session
    ) {
        ResponseResult<List<Message>> result = new ResponseResult<>();
        List<Message> list = messageService.getMessageByFromID(session);
        result.setData(list);
        return result;
    }*/

    //获得家政人员发出的所有留言及回复
    @RequestMapping("/getMessageByToID")
    @ResponseBody
    public ResponseResult<List<Message>> getMessageByID (
            HttpSession session
    ) {
        ResponseResult<List<Message>> result = new ResponseResult<>();
        List<Message> list = messageService.getMessageByToID(session);
        result.setData(list);
        return result;
    }

    //获得消费者发出的所有留言及回复
    @RequestMapping("/getMessageByFromID")
    @ResponseBody
    public ResponseResult<List<Message>> getMessageByFromID (
            HttpSession session
    ) {
        ResponseResult<List<Message>> result = new ResponseResult<>();
        List<Message> list = messageService.getMessageByFromID(session);
        result.setData(list);
        return result;
    }

    @RequestMapping("/insertMessage")
    @ResponseBody
    public ResponseResult<Void> insertMessage (
            HttpSession session,
            @RequestParam("id") int toID,
            @RequestParam("msgContent") String msgContent
    ) {
        messageService.insertMessage(msgContent, session, toID);
        return new ResponseResult<>();
    }

    @RequestMapping("/getSingleMessage")
    @ResponseBody
    public ResponseResult<Message> getSingleMessage (
            HttpSession session,
            @RequestParam("id") Integer id
    ) {
        ResponseResult<Message> result = new ResponseResult<>();
        List<Reply> replyList = replyService.getReplyByMessageID(session,id);
        Message message = messageService.getSingleMessage(session,id);
        message.setReplyList(replyList);
        result.setData(message);
        return result;
    }

    @RequestMapping("/insertReply")
    @ResponseBody
    public ResponseResult<Void> insertReply (
            HttpSession session,
            @RequestParam("messageID") int messageID,
            @RequestParam("replyContent") String replyContent
    ) {
        //按留言的双方进行插入回复，根据当前登录用户角色判断发送者和接收者的位置
        ResponseResult<Void> result = new ResponseResult<>();
        if(replyService.insertReply(replyContent,session,messageID) != 0){
            result.setState(200);
        }else{
            result.setState(406);
        }
        return result;
    }

    @RequestMapping("/deleteSingleReply")
    @ResponseBody
    public ResponseResult<Void> deleteSingleReply (
            @RequestParam("id") int id
    ) {
        ResponseResult<Void> result = new ResponseResult<>();
        if(replyService.deleteSingleReply(id) != 0){
            result.setState(200);
        }else{
            result.setState(406);
        }
        return result;
    }


}
