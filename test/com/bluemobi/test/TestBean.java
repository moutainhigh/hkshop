package com.bluemobi.test;

import com.appcore.model.AbstractObject;

public class TestBean extends AbstractObject{

    private Integer id;

    private String str;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStr() {
        return str;
    }

    public void setStr(String str) {
        this.str = str;
    }


}
