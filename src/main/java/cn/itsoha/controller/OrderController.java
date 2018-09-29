package cn.itsoha.controller;


import cn.hutool.json.JSONObject;
import cn.itsoha.entity.Order;
import cn.itsoha.service.IOrderService;
import cn.itsoha.utils.WeUtils;
import com.mysql.cj.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("order")
public class OrderController {
    @Resource(name = "orderService")
    private IOrderService orderService;

    /**
     * 下单
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@RequestParam(value = "o_name", required = true) String shop_name, @RequestParam(value = "o_address", required = true) String address,
                       @RequestParam(value = "o_time", required = true) String time, @RequestParam(value = "o_desc", required = false) String desc,
                       @RequestParam(value = "o_linkman", required = true) String linkman, @RequestParam(value = "o_phone", required = true) String phone,
                       HttpServletResponse response) throws IOException {

        response.setContentType("application/json;chartSet=utf-8");
        PrintWriter writer = response.getWriter();

        JSONObject jsonObject = new JSONObject();

        if (!StringUtils.isNullOrEmpty(shop_name) && !StringUtils.isNullOrEmpty(address) && !StringUtils.isNullOrEmpty(time)
                && !StringUtils.isNullOrEmpty(linkman) && !StringUtils.isNullOrEmpty(phone)) {
            Order order = new Order();
            String uuid = WeUtils.getUUID();
            order.setOid(uuid);
            order.setoName(shop_name);
            order.setoAddress(address);
            order.setoTime(time);
            order.setoDesc(desc);
            order.setoUser(linkman);
            order.setoPhone(phone);
            order.setoTag(0);
            order.setoDownorderTime(WeUtils.getDate());
            int save = orderService.save(order);
            if (save > 0) {
                jsonObject.put("result", "success");
                jsonObject.put("orderid", uuid);
            } else {
                jsonObject.put("result", "failed");
            }

        } else {
            jsonObject.put("result", "empty");
        }
        System.out.println("添加了：" + jsonObject.toString());

        writer.print(jsonObject.toString());
        writer.flush();
        writer.close();

        return "orderfrom";
    }


    @RequestMapping(value = "queryOrder", method = RequestMethod.POST)
    public String save(@RequestParam(value = "oid", required = true) String oid, HttpServletResponse response) throws IOException {

        response.setContentType("application/json;chartSet=utf-8");
        PrintWriter writer = response.getWriter();

        Order order = orderService.selectByPrimaryKey(oid);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("oid", oid);

        if (order != null) {
            Integer tag = order.getoTag();
            jsonObject.put("result", "success");

            jsonObject.put("order", order);
            if (tag == 0) {
                jsonObject.put("status", "未接单");
            } else if (tag == 1) {
                jsonObject.put("status", "已接单");
            } else if (tag == 2) {
                jsonObject.put("status", "已完成");
            }
        } else {
            jsonObject.put("result", "empty");
        }

        writer.print(jsonObject.toString());
        writer.flush();
        writer.close();
        return "orderQuery";
    }
}
