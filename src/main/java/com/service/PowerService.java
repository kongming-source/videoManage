package com.service;

import com.entity.Power;

public interface PowerService {

    public boolean add(Power p);

    public Power query(Integer uid);

    public boolean mod(Power p);
}
