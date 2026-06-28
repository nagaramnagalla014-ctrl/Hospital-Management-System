package com.hospital.hms.dao.impl;

import com.hospital.hms.dao.LabReportDAO;
import com.hospital.hms.model.LabReport;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LabReportDAOImpl implements LabReportDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(LabReport labReport) {
        getSession().save(labReport);
    }

    @Override
    public void update(LabReport labReport) {
        getSession().update(labReport);
    }

    @Override
    public LabReport findById(Long reportId) {
        return getSession().get(LabReport.class, reportId);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<LabReport> findAll() {
        return getSession()
                .createQuery("FROM LabReport r ORDER BY r.testDate DESC")
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<LabReport> findByPatient(Long patientId) {
        return getSession()
                .createQuery("FROM LabReport r WHERE r.patient.patientId = :pid ORDER BY r.testDate DESC")
                .setParameter("pid", patientId)
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<LabReport> findByStatus(String status) {
        return getSession()
                .createQuery("FROM LabReport r WHERE r.status = :status ORDER BY r.testDate ASC")
                .setParameter("status", status)
                .list();
    }

    @Override
    public long count() {
        return (Long) getSession()
                .createQuery("SELECT COUNT(r) FROM LabReport r")
                .uniqueResult();
    }
}
