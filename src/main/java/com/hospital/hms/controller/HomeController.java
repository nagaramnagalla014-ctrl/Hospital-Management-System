package com.hospital.hms.controller;

import com.hospital.hms.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @Autowired private PatientService patientService;
    @Autowired private DoctorService doctorService;
    @Autowired private AppointmentService appointmentService;
    @Autowired private LabReportService labReportService;
    @Autowired private MedicineService medicineService;
    @Autowired private BillService billService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("totalPatients", patientService.getTotalPatients());
        model.addAttribute("totalDoctors", doctorService.getTotalDoctors());
        model.addAttribute("totalAppointments", appointmentService.getTotalAppointments());
        model.addAttribute("scheduledAppointments", appointmentService.getScheduledCount());
        model.addAttribute("totalLabReports", labReportService.getTotalReports());
        model.addAttribute("totalMedicines", medicineService.getTotalMedicines());
        model.addAttribute("totalBills", billService.getTotalBills());
        model.addAttribute("totalRevenue", billService.getTotalRevenue());
        model.addAttribute("recentAppointments", appointmentService.getAppointmentsByStatus("SCHEDULED"));
        model.addAttribute("lowStockMedicines", medicineService.getLowStockMedicines());
        return "home";
    }
}
