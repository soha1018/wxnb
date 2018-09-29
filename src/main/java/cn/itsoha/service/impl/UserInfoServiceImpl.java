package cn.itsoha.service.impl;



import cn.itsoha.entity.User;
import cn.itsoha.mapper.UserMapper;
import cn.itsoha.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserInfoServiceImpl implements IUserInfoService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public int save(User user) {
        return userMapper.insert(user);
    }

    @Override
    public User selectByPrimaryKey(String uid) {
        return userMapper.selectByPrimaryKey(uid);
    }
}
