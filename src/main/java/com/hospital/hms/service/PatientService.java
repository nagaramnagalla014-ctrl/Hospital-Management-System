package com.hospital.hms.service;

import com.hospital.hms.model.Patient;
import java.util.List;

public interface PatientService {
    void registerPatient(Patient patient);
    void updatePatient(Patient patient);
    void deletePatient(Long patientId);
    Patient getPatientById(Long patientId);
    Patient getPatientByCode(String patientCode);
    List<Patient> getAllPatients();
    List<Patient> searchPatients(String keyword);
    long getTotalPatients();
    String generatePatientCode();
}
