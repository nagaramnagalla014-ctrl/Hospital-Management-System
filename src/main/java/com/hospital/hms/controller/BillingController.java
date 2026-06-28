package com.hospital.hms.controller;

import com.hospital.hms.model.Appointment;
import com.hospital.hms.model.Bill;
import com.hospital.hms.model.Patient;
import com.hospital.hms.service.AppointmentService;
import com.hospital.hms.service.BillService;
import com.hospital.hms.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/billing")
public class BillingController {

    @Autowired private BillService billService;
    @Autowired private PatientService patientService;
    @Autowired private AppointmentService appointmentService;

    @GetMapping
    public String listBills(Model model) {
        model.addAttribute("bills", billService.getAllBills());
        model.addAttribute("totalBills", billService.getTotalBills());
        model.addAttribute("totalRevenue", billService.getTotalRevenue());
        model.addAttribute("pendingBills", billService.getPendingBills().size());
        return "billing/list";
    }

    @GetMapping("/generate")
    public String showGenerateForm(Model model) {
        model.addAttribute("bill", new Bill());
        model.addAttribute("patients", patientService.getAllPatients());
        model.addAttribute("appointments", appointmentService.getAppointmentsByStatus("COMPLETED"));
        return "billing/generate";
    }

    @PostMapping("/generate")
    public String generateBill(@RequestParam Long patientId,
                               @RequestParam(required = false) Long appointmentId,
                               @RequestParam(defaultValue = "0") Double consultationFee,
                               @RequestParam(defaultValue = "0") Double labCharges,
                               @RequestParam(defaultValue = "0") Double medicineCharges,
                               @RequestParam(defaultValue = "0") Double otherCharges,
                               @RequestParam(defaultValue = "0") Double discount,
                               RedirectAttributes attrs) {
        Patient patient = patientService.getPatientById(patientId);
        Appointment appointment = appointmentId != null
                ? appointmentService.getAppointmentById(appointmentId) : null;

        Bill bill = new Bill();
        bill.setPatient(patient);
        bill.setAppointment(appointment);
        bill.setConsultationFee(consultationFee);
        bill.setLabCharges(labCharges);
        bill.setMedicineCharges(medicineCharges);
        bill.setOtherCharges(otherCharges);
        bill.setDiscount(discount);

        billService.generateBill(bill);
        attrs.addFlashAttribute("success", "Bill generated. No: " + bill.getBillNo()
                + " | Total: ₹" + String.format("%.2f", bill.getTotalAmount()));
        return "redirect:/billing";
    }

    @GetMapping("/view/{id}")
    public String viewBill(@PathVariable Long id, Model model) {
        model.addAttribute("bill", billService.getBillById(id));
        return "billing/view";
    }

    @GetMapping("/pay/{id}")
    public String markAsPaid(@PathVariable Long id, RedirectAttributes attrs) {
        billService.markAsPaid(id);
        attrs.addFlashAttribute("success", "Payment recorded. Bill marked as PAID.");
        return "redirect:/billing";
    }
}
