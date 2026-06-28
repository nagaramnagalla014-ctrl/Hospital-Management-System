package com.hospital.hms.service.impl;

import com.hospital.hms.dao.AppointmentDAO;
import com.hospital.hms.model.Appointment;
import com.hospital.hms.service.AppointmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class AppointmentServiceImpl implements AppointmentService {

    @Autowired
    private AppointmentDAO appointmentDAO;

    @Override
    public void bookAppointment(Appointment appointment) {
        appointment.setAppointmentNo(generateAppointmentNo());
        appointment.setStatus("SCHEDULED");
        appointment.setCreatedOn(new Date());
        appointmentDAO.save(appointment);
    }

    @Override
    public void updateAppointment(Appointment appointment) {
        appointmentDAO.update(appointment);
    }

    @Override
    public void updateStatus(Long appointmentId, String status) {
        Appointment appointment = appointmentDAO.findById(appointmentId);
        if (appointment != null) {
            appointment.setStatus(status);
            appointmentDAO.update(appointment);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public Appointment getAppointmentById(Long appointmentId) {
        return appointmentDAO.findById(appointmentId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Appointment> getAllAppointments() {
        return appointmentDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Appointment> getAppointmentsByPatient(Long patientId) {
        return appointmentDAO.findByPatient(patientId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Appointment> getAppointmentsByDoctor(Long doctorId) {
        return appointmentDAO.findByDoctor(doctorId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Appointment> getAppointmentsByStatus(String status) {
        return appointmentDAO.findByStatus(status);
    }

    @Override
    @Transactional(readOnly = true)
    public long getTotalAppointments() {
        return appointmentDAO.count();
    }

    @Override
    @Transactional(readOnly = true)
    public long getScheduledCount() {
        return appointmentDAO.countByStatus("SCHEDULED");
    }

    @Override
    @Transactional(readOnly = true)
    public String generateAppointmentNo() {
        long count = appointmentDAO.count() + 1;
        return String.format("APT-%06d", count);
    }
}
