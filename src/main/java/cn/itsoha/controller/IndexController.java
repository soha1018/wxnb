package cn.itsoha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {

    @RequestMapping("index")

    public String index() {
        return "index";
    }

    @RequestMapping("order")
    public String order() {
        return "orderfrom";
    }

    @RequestMapping("orderQuery")
    public String orderQuery() {
        return "orderQuery";
    }

    @RequestMapping("wxnb")
    public String wxnb() {
        return "wxnb";
    }


}