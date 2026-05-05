package com.model;

public class TimeSlot {
    private String time;
    private String carName;
    private String vehicleNumber;

    public TimeSlot(String time, String carName, String vehicleNumber) {
        this.time = time;
        this.carName = carName;
        this.vehicleNumber = vehicleNumber;
    }

    public String getTime() { return time; }
    public String getCarName() { return carName; }
    public String getVehicleNumber() { return vehicleNumber; }
}
