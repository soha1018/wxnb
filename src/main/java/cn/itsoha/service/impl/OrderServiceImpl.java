package cn.itsoha.service.impl;

import cn.itsoha.entity.Order;
import cn.itsoha.mapper.OrderMapper;
import cn.itsoha.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Override
    public int save(Order order) {
        return orderMapper.insert(order);
    }

    @Override
    public List<Order> findByTag(Integer integer) {
        return orderMapper.findByTag(integer);
    }

    @Override
    public int updateByPrimaryKeySelective(Order order) {
        return orderMapper.updateByPrimaryKeySelective(order);
    }

    @Override
    public Order selectByPrimaryKey(String oid) {
        return orderMapper.selectByPrimaryKey(oid);
    }
}
