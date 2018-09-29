package cn.itsoha.controller;

import cn.hutool.json.JSONArray;
import cn.itsoha.entity.Order;
import cn.itsoha.service.IOrderService;
import cn.itsoha.utils.WeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class OrderListController {
    @Resource(name = "orderService")
    private IOrderService orderService;

    //页面初始化，显示未完成的订单
    @RequestMapping("orderList")
    public String orderList(HttpServletRequest request, HttpServletResponse response) throws IOException {


        List<Order> orderList = orderService.findByTag(0);

        request.setAttribute("UnOrderList", orderList);

        return "orderList";
    }

    /**
     * 设置待完成
     */
    @RequestMapping("setToOderList")
    public String setToOderList(@RequestParam(value = "oid", required = true) String oid, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;chartSet=utf-8");
        PrintWriter writer = response.getWriter();

        Order orderOld = orderService.selectByPrimaryKey(oid);
        //设置接单时间
        orderOld.setoReceoderTime(WeUtils.getDate());
        //设置待完成
        orderOld.setoTag(1);
        int i = orderService.updateByPrimaryKeySelective(orderOld);
        if (i > 0) {
            writer.print("{\"result\":\"success\"}");
        } else {
            writer.print("{\"result\":\"error\"}");
        }
        writer.flush();
        writer.close();

        return "orderList";
    }

    /**
     * 设置已完成
     */
    @RequestMapping("setThreeOderList")
    public String setThreeOderList(@RequestParam(value = "oid", required = true) String oid, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;chartSet=utf-8");
        PrintWriter writer = response.getWriter();

        Order orderOld = orderService.selectByPrimaryKey(oid);
        //设置已完成时间
        orderOld.setoOkoderTime(WeUtils.getDate());

        //设置已完成
        orderOld.setoTag(2);
        int i = orderService.updateByPrimaryKeySelective(orderOld);
        if (i > 0) {
            writer.print("{\"result\":\"success\"}");
        } else {
            writer.print("{\"result\":\"error\"}");
        }
        writer.flush();
        writer.close();

        return "orderList";
    }

    //页面初始化，显示未完成的订单
    @RequestMapping("toOrderList")
    public String toOrderList(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("application/json;chartSet=utf-8");
        PrintWriter writer = response.getWriter();


        List<Order> orderList = orderService.findByTag(1);
        JSONArray jsonArray = new JSONArray();
        jsonArray.addAll(orderList);

        writer.print(jsonArray.toString());

        writer.flush();
        writer.close();

        return "orderList";
    }

    @RequestMapping("threeOrderList")
    public String threeOrderList(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("application/json;chartSet=utf-8");
        PrintWriter writer = response.getWriter();

        List<Order> orderList = orderService.findByTag(2);
        JSONArray jsonArray = new JSONArray();
        jsonArray.addAll(orderList);

        writer.print(jsonArray.toString());

        writer.flush();
        writer.close();

        return "orderList";
    }
}
