package com.hospital.hms.service;

import com.hospital.hms.model.Medicine;
import java.util.List;

public interface MedicineService {
    void saveMedicine(Medicine medicine);
    void updateMedicine(Medicine medicine);
    void deleteMedicine(Long medicineId);
    Medicine getMedicineById(Long medicineId);
    List<Medicine> getAllMedicines();
    List<Medicine> searchMedicines(String keyword);
    List<Medicine> getLowStockMedicines();
    long getTotalMedicines();
    String generateMedicineCode();
}
