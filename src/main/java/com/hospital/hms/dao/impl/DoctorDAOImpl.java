package com.hospital.hms.dao.impl;

import com.hospital.hms.dao.DoctorDAO;
import com.hospital.hms.model.Doctor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DoctorDAOImpl implements DoctorDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(Doctor doctor) {
        getSession().save(doctor);
    }

    @Override
    public void update(Doctor doctor) {
        getSession().update(doctor);
    }

    @Override
    public void delete(Long doctorId) {
        Doctor d = findById(doctorId);
        if (d != null) {
            d.setIsActive(0);
            getSession().update(d);
        }
    }

    @Override
    public Doctor findById(Long doctorId) {
        return getSession().get(Doctor.class, doctorId);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Doctor> findAll() {
        return getSession()
                .createQuery("FROM Doctor d ORDER BY d.firstName")
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Doctor> findByDepartment(Long deptId) {
        return getSession()
                .createQuery("FROM Doctor d WHERE d.department.deptId = :deptId AND d.isActive = 1")
                .setParameter("deptId", deptId)
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Doctor> findActive() {
        return getSession()
                .createQuery("FROM Doctor d WHERE d.isActive = 1 ORDER BY d.firstName")
                .list();
    }

    @Override
    public long count() {
        return (Long) getSession()
                .createQuery("SELECT COUNT(d) FROM Doctor d WHERE d.isActive = 1")
                .uniqueResult();
    }
}
