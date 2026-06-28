package com.hospital.hms.service.impl;

import com.hospital.hms.dao.BillDAO;
import com.hospital.hms.model.Bill;
import com.hospital.hms.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class BillServiceImpl implements BillService {

    @Autowired
    private BillDAO billDAO;

    @Override
    public void generateBill(Bill bill) {
        bill.setBillNo(generateBillNo());
        bill.setTotalAmount(bill.calculateTotal());
        bill.setStatus("PENDING");
        bill.setBillDate(new Date());
        bill.setCreatedOn(new Date());
        billDAO.save(bill);
    }

    @Override
    public void updateBill(Bill bill) {
        bill.setTotalAmount(bill.calculateTotal());
        billDAO.update(bill);
    }

    @Override
    public void markAsPaid(Long billId) {
        Bill bill = billDAO.findById(billId);
        if (bill != null) {
            bill.setStatus("PAID");
            billDAO.update(bill);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public Bill getBillById(Long billId) {
        return billDAO.findById(billId);
    }

    @Override
    @Transactional(readOnly = true)
    public Bill getBillByNo(String billNo) {
        return billDAO.findByBillNo(billNo);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Bill> getAllBills() {
        return billDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Bill> getBillsByPatient(Long patientId) {
        return billDAO.findByPatient(patientId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Bill> getPendingBills() {
        return billDAO.findByStatus("PENDING");
    }

    @Override
    @Transactional(readOnly = true)
    public long getTotalBills() {
        return billDAO.count();
    }

    @Override
    @Transactional(readOnly = true)
    public Double getTotalRevenue() {
        return billDAO.totalRevenue();
    }

    @Override
    @Transactional(readOnly = true)
    public String generateBillNo() {
        long count = billDAO.count() + 1;
        return String.format("BILL-%06d", count);
    }
}
