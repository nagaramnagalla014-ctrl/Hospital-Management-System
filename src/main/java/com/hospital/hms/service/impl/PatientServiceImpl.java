package com.hospital.hms.service.impl;

import com.hospital.hms.dao.PatientDAO;
import com.hospital.hms.model.Patient;
import com.hospital.hms.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class PatientServiceImpl implements PatientService {

    @Autowired
    private PatientDAO patientDAO;

    @Override
    public void registerPatient(Patient patient) {
        patient.setPatientCode(generatePatientCode());
        patient.setCreatedOn(new Date());
        patientDAO.save(patient);
    }

    @Override
    public void updatePatient(Patient patient) {
        patientDAO.update(patient);
    }

    @Override
    public void deletePatient(Long patientId) {
        patientDAO.delete(patientId);
    }

    @Override
    @Transactional(readOnly = true)
    public Patient getPatientById(Long patientId) {
        return patientDAO.findById(patientId);
    }

    @Override
    @Transactional(readOnly = true)
    public Patient getPatientByCode(String patientCode) {
        return patientDAO.findByCode(patientCode);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Patient> getAllPatients() {
        return patientDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Patient> searchPatients(String keyword) {
        return patientDAO.search(keyword);
    }

    @Override
    @Transactional(readOnly = true)
    public long getTotalPatients() {
        return patientDAO.count();
    }

    @Override
    @Transactional(readOnly = true)
    public String generatePatientCode() {
        long count = patientDAO.count() + 1;
        return String.format("P-%05d", count);
    }
}
