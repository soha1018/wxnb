package cn.itsoha.service;


import cn.itsoha.entity.User;

public interface IUserInfoService {
    int save(User user);
    User selectByPrimaryKey(String uid);
}
