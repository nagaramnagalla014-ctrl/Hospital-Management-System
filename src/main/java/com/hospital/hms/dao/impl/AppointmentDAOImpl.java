package com.hospital.hms.dao.impl;

import com.hospital.hms.dao.AppointmentDAO;
import com.hospital.hms.model.Appointment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AppointmentDAOImpl implements AppointmentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(Appointment appointment) {
        getSession().save(appointment);
    }

    @Override
    public void update(Appointment appointment) {
        getSession().update(appointment);
    }

    @Override
    public Appointment findById(Long appointmentId) {
        return getSession().get(Appointment.class, appointmentId);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Appointment> findAll() {
        return getSession()
                .createQuery("FROM Appointment a ORDER BY a.appointmentDate DESC, a.createdOn DESC")
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Appointment> findByPatient(Long patientId) {
        return getSession()
                .createQuery("FROM Appointment a WHERE a.patient.patientId = :pid ORDER BY a.appointmentDate DESC")
                .setParameter("pid", patientId)
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Appointment> findByDoctor(Long doctorId) {
        return getSession()
                .createQuery("FROM Appointment a WHERE a.doctor.doctorId = :did ORDER BY a.appointmentDate DESC")
                .setParameter("did", doctorId)
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Appointment> findByStatus(String status) {
        return getSession()
                .createQuery("FROM Appointment a WHERE a.status = :status ORDER BY a.appointmentDate ASC")
                .setParameter("status", status)
                .list();
    }

    @Override
    public long count() {
        return (Long) getSession()
                .createQuery("SELECT COUNT(a) FROM Appointment a")
                .uniqueResult();
    }

    @Override
    public long countByStatus(String status) {
        return (Long) getSession()
                .createQuery("SELECT COUNT(a) FROM Appointment a WHERE a.status = :status")
                .setParameter("status", status)
                .uniqueResult();
    }
}
