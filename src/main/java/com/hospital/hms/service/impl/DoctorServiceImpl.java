package com.hospital.hms.service.impl;

import com.hospital.hms.dao.DoctorDAO;
import com.hospital.hms.model.Doctor;
import com.hospital.hms.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorDAO doctorDAO;

    @Override
    public void saveDoctor(Doctor doctor) {
        doctor.setDoctorCode(generateDoctorCode());
        doctor.setCreatedOn(new Date());
        doctor.setIsActive(1);
        doctorDAO.save(doctor);
    }

    @Override
    public void updateDoctor(Doctor doctor) {
        doctorDAO.update(doctor);
    }

    @Override
    public void deleteDoctor(Long doctorId) {
        doctorDAO.delete(doctorId);
    }

    @Override
    @Transactional(readOnly = true)
    public Doctor getDoctorById(Long doctorId) {
        return doctorDAO.findById(doctorId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Doctor> getAllDoctors() {
        return doctorDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Doctor> getActiveDoctors() {
        return doctorDAO.findActive();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Doctor> getDoctorsByDepartment(Long deptId) {
        return doctorDAO.findByDepartment(deptId);
    }

    @Override
    @Transactional(readOnly = true)
    public long getTotalDoctors() {
        return doctorDAO.count();
    }

    @Override
    @Transactional(readOnly = true)
    public String generateDoctorCode() {
        long count = doctorDAO.count() + 1;
        return String.format("DR-%03d", count);
    }
}
