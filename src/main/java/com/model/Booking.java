package com.model;

public class Booking {
	private String vehicleNumber;
    private String ownerName;
    private String bookingStatus;

    public Booking(String vehicleNumber, String ownerName, String bookingStatus) {
        this.vehicleNumber = vehicleNumber;
        this.ownerName = ownerName;
        this.bookingStatus = bookingStatus;
    }

    public String getVehicleNumber() { return vehicleNumber; }
    public String getOwnerName() { return ownerName; }
    public String getBookingStatus() { return bookingStatus; }
}
