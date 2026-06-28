package com.hospital.hms.service;

import com.hospital.hms.model.Bill;
import java.util.List;

public interface BillService {
    void generateBill(Bill bill);
    void updateBill(Bill bill);
    void markAsPaid(Long billId);
    Bill getBillById(Long billId);
    Bill getBillByNo(String billNo);
    List<Bill> getAllBills();
    List<Bill> getBillsByPatient(Long patientId);
    List<Bill> getPendingBills();
    long getTotalBills();
    Double getTotalRevenue();
    String generateBillNo();
}
