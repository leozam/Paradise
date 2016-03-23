package com.leo.paradise.service;

import com.leo.paradise.bean.User;

public interface UserService{

    public User add(String name, String password);

    public int fetch(String username, String password);

    public void updatePassword(int userId, String password);
}
