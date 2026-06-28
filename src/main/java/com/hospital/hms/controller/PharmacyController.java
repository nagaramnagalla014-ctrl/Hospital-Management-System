package com.hospital.hms.controller;

import com.hospital.hms.model.Medicine;
import com.hospital.hms.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/pharmacy")
public class PharmacyController {

    @Autowired
    private MedicineService medicineService;

    @GetMapping
    public String listMedicines(@RequestParam(required = false) String search, Model model) {
        List<Medicine> medicines;
        if (search != null && !search.trim().isEmpty()) {
            medicines = medicineService.searchMedicines(search.trim());
            model.addAttribute("search", search);
        } else {
            medicines = medicineService.getAllMedicines();
        }
        model.addAttribute("medicines", medicines);
        model.addAttribute("totalMedicines", medicineService.getTotalMedicines());
        model.addAttribute("lowStockMedicines", medicineService.getLowStockMedicines());
        return "pharmacy/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("medicine", new Medicine());
        return "pharmacy/form";
    }

    @PostMapping("/add")
    public String addMedicine(@ModelAttribute Medicine medicine,
                              @RequestParam(required = false) String expiryDateStr,
                              RedirectAttributes attrs) {
        try {
            if (expiryDateStr != null && !expiryDateStr.isEmpty()) {
                medicine.setExpiryDate(new SimpleDateFormat("yyyy-MM-dd").parse(expiryDateStr));
            }
            medicineService.saveMedicine(medicine);
            attrs.addFlashAttribute("success", "Medicine added. Code: " + medicine.getMedicineCode());
        } catch (Exception e) {
            attrs.addFlashAttribute("error", "Error adding medicine.");
        }
        return "redirect:/pharmacy";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("medicine", medicineService.getMedicineById(id));
        return "pharmacy/form";
    }

    @PostMapping("/update")
    public String updateMedicine(@ModelAttribute Medicine medicine,
                                 @RequestParam(required = false) String expiryDateStr,
                                 RedirectAttributes attrs) {
        try {
            if (expiryDateStr != null && !expiryDateStr.isEmpty()) {
                medicine.setExpiryDate(new SimpleDateFormat("yyyy-MM-dd").parse(expiryDateStr));
            }
            medicineService.updateMedicine(medicine);
            attrs.addFlashAttribute("success", "Medicine updated.");
        } catch (Exception e) {
            attrs.addFlashAttribute("error", "Error updating medicine.");
        }
        return "redirect:/pharmacy";
    }

    @GetMapping("/delete/{id}")
    public String deleteMedicine(@PathVariable Long id, RedirectAttributes attrs) {
        medicineService.deleteMedicine(id);
        attrs.addFlashAttribute("success", "Medicine removed.");
        return "redirect:/pharmacy";
    }
}
