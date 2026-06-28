package com.hospital.hms.service;

import com.hospital.hms.model.Doctor;
import java.util.List;

public interface DoctorService {
    void saveDoctor(Doctor doctor);
    void updateDoctor(Doctor doctor);
    void deleteDoctor(Long doctorId);
    Doctor getDoctorById(Long doctorId);
    List<Doctor> getAllDoctors();
    List<Doctor> getActiveDoctors();
    List<Doctor> getDoctorsByDepartment(Long deptId);
    long getTotalDoctors();
    String generateDoctorCode();
}
