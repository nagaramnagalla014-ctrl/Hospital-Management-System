package com.hospital.hms.dao;

import com.hospital.hms.model.Doctor;
import java.util.List;

public interface DoctorDAO {
    void save(Doctor doctor);
    void update(Doctor doctor);
    void delete(Long doctorId);
    Doctor findById(Long doctorId);
    List<Doctor> findAll();
    List<Doctor> findByDepartment(Long deptId);
    List<Doctor> findActive();
    long count();
}
