package com.hospital.hms.dao;

import com.hospital.hms.model.Medicine;
import java.util.List;

public interface MedicineDAO {
    void save(Medicine medicine);
    void update(Medicine medicine);
    void delete(Long medicineId);
    Medicine findById(Long medicineId);
    Medicine findByCode(String medicineCode);
    List<Medicine> findAll();
    List<Medicine> search(String keyword);
    List<Medicine> findLowStock(int threshold);
    long count();
}
