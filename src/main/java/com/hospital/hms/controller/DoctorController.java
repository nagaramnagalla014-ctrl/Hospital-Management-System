package com.hospital.hms.controller;

import com.hospital.hms.model.Department;
import com.hospital.hms.model.Doctor;
import com.hospital.hms.service.DoctorService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/doctors")
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private SessionFactory sessionFactory;

    @GetMapping
    @Transactional(readOnly = true)
    public String listDoctors(Model model) {
        model.addAttribute("doctors", doctorService.getAllDoctors());
        model.addAttribute("totalDoctors", doctorService.getTotalDoctors());
        return "doctor/list";
    }

    @GetMapping("/add")
    @Transactional(readOnly = true)
    public String showAddForm(Model model) {
        model.addAttribute("doctor", new Doctor());
        model.addAttribute("departments", getDepartments());
        return "doctor/form";
    }

    @PostMapping("/add")
    @Transactional
    public String addDoctor(@ModelAttribute Doctor doctor,
                            @RequestParam Long deptId,
                            RedirectAttributes attrs) {
        Session session = sessionFactory.getCurrentSession();
        Department dept = session.get(Department.class, deptId);
        doctor.setDepartment(dept);
        doctorService.saveDoctor(doctor);
        attrs.addFlashAttribute("success", "Doctor added. Code: " + doctor.getDoctorCode());
        return "redirect:/doctors";
    }

    @GetMapping("/edit/{id}")
    @Transactional(readOnly = true)
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("doctor", doctorService.getDoctorById(id));
        model.addAttribute("departments", getDepartments());
        return "doctor/form";
    }

    @PostMapping("/update")
    @Transactional
    public String updateDoctor(@ModelAttribute Doctor doctor,
                               @RequestParam Long deptId,
                               RedirectAttributes attrs) {
        Session session = sessionFactory.getCurrentSession();
        Department dept = session.get(Department.class, deptId);
        doctor.setDepartment(dept);
        doctorService.updateDoctor(doctor);
        attrs.addFlashAttribute("success", "Doctor details updated.");
        return "redirect:/doctors";
    }

    @GetMapping("/delete/{id}")
    public String deleteDoctor(@PathVariable Long id, RedirectAttributes attrs) {
        doctorService.deleteDoctor(id);
        attrs.addFlashAttribute("success", "Doctor deactivated.");
        return "redirect:/doctors";
    }

    @SuppressWarnings("unchecked")
    private List<Department> getDepartments() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Department d ORDER BY d.deptName")
                .list();
    }
}
