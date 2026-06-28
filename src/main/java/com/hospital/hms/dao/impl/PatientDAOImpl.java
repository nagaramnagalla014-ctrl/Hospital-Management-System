package com.hospital.hms.dao.impl;

import com.hospital.hms.dao.PatientDAO;
import com.hospital.hms.model.Patient;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PatientDAOImpl implements PatientDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(Patient patient) {
        getSession().save(patient);
    }

    @Override
    public void update(Patient patient) {
        getSession().update(patient);
    }

    @Override
    public void delete(Long patientId) {
        Patient p = findById(patientId);
        if (p != null) getSession().delete(p);
    }

    @Override
    public Patient findById(Long patientId) {
        return getSession().get(Patient.class, patientId);
    }

    @Override
    public Patient findByCode(String patientCode) {
        return (Patient) getSession()
                .createQuery("FROM Patient p WHERE p.patientCode = :code")
                .setParameter("code", patientCode)
                .uniqueResult();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Patient> findAll() {
        return getSession()
                .createQuery("FROM Patient p ORDER BY p.createdOn DESC")
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Patient> search(String keyword) {
        String kw = "%" + keyword.toLowerCase() + "%";
        return getSession()
                .createQuery("FROM Patient p WHERE LOWER(p.firstName) LIKE :kw " +
                        "OR LOWER(p.lastName) LIKE :kw " +
                        "OR p.patientCode LIKE :kw " +
                        "OR p.phone LIKE :kw")
                .setParameter("kw", kw)
                .list();
    }

    @Override
    public long count() {
        return (Long) getSession()
                .createQuery("SELECT COUNT(p) FROM Patient p")
                .uniqueResult();
    }
}
