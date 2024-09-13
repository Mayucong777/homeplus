package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import entity.HouseKeeper;
import entity.ResponseResult;
import service.HKPersonService;

import java.util.List;


@Controller
@RequestMapping("/result")
public class ResultController extends BaseController {

    @Autowired
    private HKPersonService hkPersonService;

    @RequestMapping("/loadSearchResult")
    @ResponseBody
    public ResponseResult<List<HouseKeeper>> loadSearchResult (
            @RequestParam("param") Integer param
    ) {
        ResponseResult<List<HouseKeeper>> result = new ResponseResult<>();
        List<HouseKeeper> list = hkPersonService.getHKListFuzzySelect(param);
        result.setData(list);
        return result;
    }


}
