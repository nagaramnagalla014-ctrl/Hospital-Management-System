package com.hospital.hms.dao;

import com.hospital.hms.model.Patient;
import java.util.List;

public interface PatientDAO {
    void save(Patient patient);
    void update(Patient patient);
    void delete(Long patientId);
    Patient findById(Long patientId);
    Patient findByCode(String patientCode);
    List<Patient> findAll();
    List<Patient> search(String keyword);
    long count();
}
