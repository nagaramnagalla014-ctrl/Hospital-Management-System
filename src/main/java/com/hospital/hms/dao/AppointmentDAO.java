package com.hospital.hms.dao;

import com.hospital.hms.model.Appointment;
import java.util.List;

public interface AppointmentDAO {
    void save(Appointment appointment);
    void update(Appointment appointment);
    Appointment findById(Long appointmentId);
    List<Appointment> findAll();
    List<Appointment> findByPatient(Long patientId);
    List<Appointment> findByDoctor(Long doctorId);
    List<Appointment> findByStatus(String status);
    long count();
    long countByStatus(String status);
}
