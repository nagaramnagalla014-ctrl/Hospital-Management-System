package com.hospital.hms.service.impl;

import com.hospital.hms.dao.MedicineDAO;
import com.hospital.hms.model.Medicine;
import com.hospital.hms.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class MedicineServiceImpl implements MedicineService {

    @Autowired
    private MedicineDAO medicineDAO;

    @Override
    public void saveMedicine(Medicine medicine) {
        medicine.setMedicineCode(generateMedicineCode());
        medicine.setCreatedOn(new Date());
        medicineDAO.save(medicine);
    }

    @Override
    public void updateMedicine(Medicine medicine) {
        medicineDAO.update(medicine);
    }

    @Override
    public void deleteMedicine(Long medicineId) {
        medicineDAO.delete(medicineId);
    }

    @Override
    @Transactional(readOnly = true)
    public Medicine getMedicineById(Long medicineId) {
        return medicineDAO.findById(medicineId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Medicine> getAllMedicines() {
        return medicineDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Medicine> searchMedicines(String keyword) {
        return medicineDAO.search(keyword);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Medicine> getLowStockMedicines() {
        return medicineDAO.findLowStock(20);
    }

    @Override
    @Transactional(readOnly = true)
    public long getTotalMedicines() {
        return medicineDAO.count();
    }

    @Override
    @Transactional(readOnly = true)
    public String generateMedicineCode() {
        long count = medicineDAO.count() + 1;
        return String.format("MED-%04d", count);
    }
}
