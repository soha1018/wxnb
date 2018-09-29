package cn.itsoha.service;

import cn.itsoha.entity.Order;

import java.util.List;

public interface IOrderService {
    int save(Order order);

    List<Order> findByTag(Integer integer);

    int updateByPrimaryKeySelective(Order order);

    Order selectByPrimaryKey(String oid);
}
