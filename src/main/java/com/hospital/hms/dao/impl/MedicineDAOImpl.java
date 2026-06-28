package com.hospital.hms.dao.impl;

import com.hospital.hms.dao.MedicineDAO;
import com.hospital.hms.model.Medicine;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MedicineDAOImpl implements MedicineDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(Medicine medicine) {
        getSession().save(medicine);
    }

    @Override
    public void update(Medicine medicine) {
        getSession().update(medicine);
    }

    @Override
    public void delete(Long medicineId) {
        Medicine m = findById(medicineId);
        if (m != null) getSession().delete(m);
    }

    @Override
    public Medicine findById(Long medicineId) {
        return getSession().get(Medicine.class, medicineId);
    }

    @Override
    public Medicine findByCode(String medicineCode) {
        return (Medicine) getSession()
                .createQuery("FROM Medicine m WHERE m.medicineCode = :code")
                .setParameter("code", medicineCode)
                .uniqueResult();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Medicine> findAll() {
        return getSession()
                .createQuery("FROM Medicine m ORDER BY m.medicineName")
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Medicine> search(String keyword) {
        String kw = "%" + keyword.toLowerCase() + "%";
        return getSession()
                .createQuery("FROM Medicine m WHERE LOWER(m.medicineName) LIKE :kw " +
                        "OR LOWER(m.genericName) LIKE :kw OR m.medicineCode LIKE :kw")
                .setParameter("kw", kw)
                .list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Medicine> findLowStock(int threshold) {
        return getSession()
                .createQuery("FROM Medicine m WHERE m.quantityInStock <= :threshold ORDER BY m.quantityInStock ASC")
                .setParameter("threshold", threshold)
                .list();
    }

    @Override
    public long count() {
        return (Long) getSession()
                .createQuery("SELECT COUNT(m) FROM Medicine m")
                .uniqueResult();
    }
}
