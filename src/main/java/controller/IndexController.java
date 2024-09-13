package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import entity.HouseKeeper;
import entity.ResponseResult;
import entity.Type;
import service.IndexService;
import utils.StringUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/index")
public class IndexController extends BaseController {

    @Autowired
    private IndexService indexService;

    @RequestMapping("/getAllType")
    @ResponseBody
    public ResponseResult<List<Type>> getAllType () {
        ResponseResult<List<Type>> result = new ResponseResult<>();
        List<Type> list = indexService.getAllType();
        result.setData(list);
        return result;
    }

    @RequestMapping("/getAllSmallType")
    @ResponseBody
    public ResponseResult<List<Type>> getAllSmallType (
            @RequestParam("type_id") Integer type_id
    ) {
        ResponseResult<List<Type>> result = new ResponseResult<>();
        List<Type> list = indexService.getAllSmallType(type_id);
        result.setData(list);
        return result;
    }

    @RequestMapping("/getAllTypeDetail")
    @ResponseBody
    public ResponseResult<List<Type>> getAllTypeDetail(){
        ResponseResult<List<Type>> result = new ResponseResult<>();
        List<Type> list = indexService.getAllTypeDetail();
        result.setData(list);
        return result;
    }

    @RequestMapping("/getTopHousekeeper")
    @ResponseBody
    public ResponseResult<List<HouseKeeper>> getTopHouseKeeper () {
        ResponseResult<List<HouseKeeper>> result = new ResponseResult<>();
        List<HouseKeeper> list = indexService.getTopHousekeeper(5);
        result.setData(list);
        return result;
    }

    @RequestMapping("/getTopRepair")
    @ResponseBody
    public ResponseResult<List<HouseKeeper>> getTopRepair () {
        ResponseResult<List<HouseKeeper>> result = new ResponseResult<>();
        List<HouseKeeper> list = indexService.getTopHousekeeper(9);
        result.setData(list);
        return result;
    }

    @RequestMapping("/getTopMove")
    @ResponseBody
    public ResponseResult<List<HouseKeeper>> getTopMove () {
        ResponseResult<List<HouseKeeper>> result = new ResponseResult<>();
        List<HouseKeeper> list = indexService.getTopHousekeeper(13);
        result.setData(list);
        return result;
    }

    @RequestMapping("/getRecommend")
    @ResponseBody
    public ResponseResult<List<HouseKeeper>> getRecommend (
        HttpSession session
    ) {
        ResponseResult<List<HouseKeeper>> result = new ResponseResult<>();
        List<HouseKeeper> list = indexService.getRecommend(session);
        result.setData(list);
        return result;
    }

    //推荐好评最多的三个HK
    @RequestMapping("/getHighScoreHK")
    @ResponseBody
    public ResponseResult<List<HouseKeeper>> getHighScoreHK () {
        ResponseResult<List<HouseKeeper>> result = new ResponseResult<>();
        List<HouseKeeper> list = indexService.getHighScoreHK();
        result.setData(list);
        return result;
    }

    @RequestMapping("/getTypeID")
    @ResponseBody
    public ResponseResult<Integer> getTypeID (
            @RequestParam("param") String param
    ){
        ResponseResult<Integer> result = new ResponseResult<>();
        Type type = new Type();
        type.setName(param);
        //int id = indexService.getTypeID(StringUtil.encodeStr(param));
        int id = indexService.getType(type).getId();
        System.out.println("---------"+id+"---------");
        result.setData(id);
        return result;
    }

}
