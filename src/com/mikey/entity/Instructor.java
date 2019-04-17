package com.mikey.entity;

public class Instructor {
    private String instId;

    private String instName;

    private String depId;

    private String instTelephone;

    public String getInstId() {
        return instId;
    }

    public void setInstId(String instId) {
        this.instId = instId == null ? null : instId.trim();
    }

    public String getInstName() {
        return instName;
    }

    public void setInstName(String instName) {
        this.instName = instName == null ? null : instName.trim();
    }

    public String getDepId() {
        return depId;
    }

    public void setDepId(String depId) {
        this.depId = depId == null ? null : depId.trim();
    }

    public String getInstTelephone() {
        return instTelephone;
    }

    public void setInstTelephone(String instTelephone) {
        this.instTelephone = instTelephone == null ? null : instTelephone.trim();
    }
}