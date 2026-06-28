package com.hospital.hms.controller;

import com.hospital.hms.model.Patient;
import com.hospital.hms.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/patients")
public class PatientController {

    @Autowired
    private PatientService patientService;

    @GetMapping
    public String listPatients(@RequestParam(required = false) String search, Model model) {
        List<Patient> patients;
        if (search != null && !search.trim().isEmpty()) {
            patients = patientService.searchPatients(search.trim());
            model.addAttribute("search", search);
        } else {
            patients = patientService.getAllPatients();
        }
        model.addAttribute("patients", patients);
        model.addAttribute("totalPatients", patientService.getTotalPatients());
        return "patient/list";
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("patient", new Patient());
        return "patient/form";
    }

    @PostMapping("/register")
    public String registerPatient(@ModelAttribute Patient patient, RedirectAttributes attrs) {
        patientService.registerPatient(patient);
        attrs.addFlashAttribute("success", "Patient registered successfully. Code: " + patient.getPatientCode());
        return "redirect:/patients";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Patient patient = patientService.getPatientById(id);
        model.addAttribute("patient", patient);
        return "patient/form";
    }

    @PostMapping("/update")
    public String updatePatient(@ModelAttribute Patient patient, RedirectAttributes attrs) {
        patientService.updatePatient(patient);
        attrs.addFlashAttribute("success", "Patient details updated successfully.");
        return "redirect:/patients";
    }

    @GetMapping("/view/{id}")
    public String viewPatient(@PathVariable Long id, Model model) {
        model.addAttribute("patient", patientService.getPatientById(id));
        return "patient/view";
    }

    @GetMapping("/delete/{id}")
    public String deletePatient(@PathVariable Long id, RedirectAttributes attrs) {
        patientService.deletePatient(id);
        attrs.addFlashAttribute("success", "Patient record deleted.");
        return "redirect:/patients";
    }
}
