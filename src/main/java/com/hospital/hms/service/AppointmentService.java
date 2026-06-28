package com.hospital.hms.service;

import com.hospital.hms.model.Appointment;
import java.util.List;

public interface AppointmentService {
    void bookAppointment(Appointment appointment);
    void updateAppointment(Appointment appointment);
    void updateStatus(Long appointmentId, String status);
    Appointment getAppointmentById(Long appointmentId);
    List<Appointment> getAllAppointments();
    List<Appointment> getAppointmentsByPatient(Long patientId);
    List<Appointment> getAppointmentsByDoctor(Long doctorId);
    List<Appointment> getAppointmentsByStatus(String status);
    long getTotalAppointments();
    long getScheduledCount();
    String generateAppointmentNo();
}
