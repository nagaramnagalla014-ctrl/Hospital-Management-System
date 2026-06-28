package com.hospital.hms.controller;

import com.hospital.hms.model.Appointment;
import com.hospital.hms.model.Doctor;
import com.hospital.hms.model.Patient;
import com.hospital.hms.service.AppointmentService;
import com.hospital.hms.service.DoctorService;
import com.hospital.hms.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/appointments")
public class AppointmentController {

    @Autowired private AppointmentService appointmentService;
    @Autowired private PatientService patientService;
    @Autowired private DoctorService doctorService;

    @GetMapping
    public String listAppointments(@RequestParam(required = false) String status, Model model) {
        if (status != null && !status.isEmpty()) {
            model.addAttribute("appointments", appointmentService.getAppointmentsByStatus(status));
            model.addAttribute("filterStatus", status);
        } else {
            model.addAttribute("appointments", appointmentService.getAllAppointments());
        }
        model.addAttribute("totalAppointments", appointmentService.getTotalAppointments());
        model.addAttribute("scheduledCount", appointmentService.getScheduledCount());
        return "appointment/list";
    }

    @GetMapping("/book")
    public String showBookForm(Model model) {
        model.addAttribute("appointment", new Appointment());
        model.addAttribute("patients", patientService.getAllPatients());
        model.addAttribute("doctors", doctorService.getActiveDoctors());
        return "appointment/form";
    }

    @PostMapping("/book")
    public String bookAppointment(@RequestParam Long patientId,
                                  @RequestParam Long doctorId,
                                  @RequestParam String appointmentDate,
                                  @RequestParam String appointmentTime,
                                  @RequestParam(required = false) String symptoms,
                                  RedirectAttributes attrs) {
        try {
            Patient patient = patientService.getPatientById(patientId);
            Doctor doctor = doctorService.getDoctorById(doctorId);
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(appointmentDate);

            Appointment appointment = new Appointment();
            appointment.setPatient(patient);
            appointment.setDoctor(doctor);
            appointment.setAppointmentDate(date);
            appointment.setAppointmentTime(appointmentTime);
            appointment.setSymptoms(symptoms);

            appointmentService.bookAppointment(appointment);
            attrs.addFlashAttribute("success", "Appointment booked. No: " + appointment.getAppointmentNo());
        } catch (ParseException e) {
            attrs.addFlashAttribute("error", "Invalid date format.");
        }
        return "redirect:/appointments";
    }

    @GetMapping("/view/{id}")
    public String viewAppointment(@PathVariable Long id, Model model) {
        model.addAttribute("appointment", appointmentService.getAppointmentById(id));
        return "appointment/view";
    }

    @GetMapping("/complete/{id}")
    public String markCompleted(@PathVariable Long id, RedirectAttributes attrs) {
        appointmentService.updateStatus(id, "COMPLETED");
        attrs.addFlashAttribute("success", "Appointment marked as completed.");
        return "redirect:/appointments";
    }

    @GetMapping("/cancel/{id}")
    public String cancelAppointment(@PathVariable Long id, RedirectAttributes attrs) {
        appointmentService.updateStatus(id, "CANCELLED");
        attrs.addFlashAttribute("success", "Appointment cancelled.");
        return "redirect:/appointments";
    }
}
