package com.hospital.hms.dao.impl;

import com.hospital.hms.dao.BillDAO;
import com.hospital.hms.model.Bill;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BillDAOImpl implements BillDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(Bill bill) {
        getSession().save(bill);
    }

    @Override
    public void update(Bill bill) {
        getSession().update(bill);
    }

    @Override
    public Bill findById(Long billId) {
        return getSession().get(Bill.class, billId);
    }

    @Override
    public Bill findByBillNo(String billNo) {
        return (Bill) getSession()
                .createQuery("FROM Bill b WHERE b.billNo = :billNo")
                .setParameter("billNo", billNo)
                .uniqueResult();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Bill> findAll() {
        return getSession()
                .createQuery("FROM Bill b ORDER BY b.billDate DESC")
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Bill> findByPatient(Long patientId) {
        return getSession()
                .createQuery("FROM Bill b WHERE b.patient.patientId = :pid ORDER BY b.billDate DESC")
                .setParameter("pid", patientId)
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Bill> findByStatus(String status) {
        return getSession()
                .createQuery("FROM Bill b WHERE b.status = :status ORDER BY b.billDate DESC")
                .setParameter("status", status)
                .list();
    }

    @Override
    public long count() {
        return (Long) getSession()
                .createQuery("SELECT COUNT(b) FROM Bill b")
                .uniqueResult();
    }

    @Override
    public Double totalRevenue() {
        Object result = getSession()
                .createQuery("SELECT SUM(b.totalAmount) FROM Bill b WHERE b.status = 'PAID'")
                .uniqueResult();
        return result != null ? (Double) result : 0.0;
    }
}
