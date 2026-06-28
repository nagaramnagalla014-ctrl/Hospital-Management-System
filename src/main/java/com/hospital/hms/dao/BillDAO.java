package com.hospital.hms.dao;

import com.hospital.hms.model.Bill;
import java.util.List;

public interface BillDAO {
    void save(Bill bill);
    void update(Bill bill);
    Bill findById(Long billId);
    Bill findByBillNo(String billNo);
    List<Bill> findAll();
    List<Bill> findByPatient(Long patientId);
    List<Bill> findByStatus(String status);
    long count();
    Double totalRevenue();
}
