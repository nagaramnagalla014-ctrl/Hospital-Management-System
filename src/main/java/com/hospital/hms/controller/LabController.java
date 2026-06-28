package com.hospital.hms.controller;

import com.hospital.hms.model.Doctor;
import com.hospital.hms.model.LabReport;
import com.hospital.hms.model.Patient;
import com.hospital.hms.service.DoctorService;
import com.hospital.hms.service.LabReportService;
import com.hospital.hms.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/lab")
public class LabController {

    @Autowired private LabReportService labReportService;
    @Autowired private PatientService patientService;
    @Autowired private DoctorService doctorService;

    @GetMapping
    public String listReports(Model model) {
        model.addAttribute("reports", labReportService.getAllReports());
        model.addAttribute("pendingReports", labReportService.getPendingReports());
        model.addAttribute("totalReports", labReportService.getTotalReports());
        return "lab/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("labReport", new LabReport());
        model.addAttribute("patients", patientService.getAllPatients());
        model.addAttribute("doctors", doctorService.getActiveDoctors());
        return "lab/form";
    }

    @PostMapping("/add")
    public String addReport(@RequestParam Long patientId,
                            @RequestParam Long doctorId,
                            @RequestParam String testName,
                            @RequestParam(required = false) String testCategory,
                            @RequestParam String testDate,
                            @RequestParam(required = false) String normalRange,
                            @RequestParam(required = false) String unit,
                            @RequestParam(required = false) Double charges,
                            @RequestParam(required = false) String remarks,
                            RedirectAttributes attrs) {
        try {
            Patient patient = patientService.getPatientById(patientId);
            Doctor doctor = doctorService.getDoctorById(doctorId);
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(testDate);

            LabReport labReport = new LabReport();
            labReport.setPatient(patient);
            labReport.setDoctor(doctor);
            labReport.setTestName(testName);
            labReport.setTestCategory(testCategory);
            labReport.setTestDate(date);
            labReport.setNormalRange(normalRange);
            labReport.setUnit(unit);
            labReport.setCharges(charges != null ? charges : 0.0);
            labReport.setRemarks(remarks);

            labReportService.saveReport(labReport);
            attrs.addFlashAttribute("success", "Lab report created. No: " + labReport.getReportNo());
        } catch (Exception e) {
            attrs.addFlashAttribute("error", "Error creating lab report.");
        }
        return "redirect:/lab";
    }

    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        model.addAttribute("labReport", labReportService.getReportById(id));
        return "lab/update";
    }

    @PostMapping("/update")
    public String updateReport(@ModelAttribute LabReport labReport, RedirectAttributes attrs) {
        labReportService.updateReport(labReport);
        attrs.addFlashAttribute("success", "Lab report updated.");
        return "redirect:/lab";
    }
}
