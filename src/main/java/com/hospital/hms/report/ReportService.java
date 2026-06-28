package com.hospital.hms.report;

import com.hospital.hms.model.Bill;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Service
public class ReportService {

    /**
     * Generates a PDF bill report using Jasper Reports and writes it to the HTTP response.
     * The .jrxml template is loaded from the classpath/WEB-INF/reports/ folder.
     */
    public void generateBillReport(Bill bill, HttpServletResponse response) throws JRException {
        try {
            InputStream reportStream = getClass().getResourceAsStream("/reports/bill_report.jrxml");

            // Compile the JRXML template at runtime
            JasperReport jasperReport = JasperCompileManager.compileReport(reportStream);

            // Set report parameters
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("BILL_NO", bill.getBillNo());
            params.put("PATIENT_NAME", bill.getPatient().getFullName());
            params.put("PATIENT_CODE", bill.getPatient().getPatientCode());
            params.put("TOTAL_AMOUNT", bill.getTotalAmount());
            params.put("BILL_STATUS", bill.getStatus());
            params.put("CONSULTATION_FEE", bill.getConsultationFee());
            params.put("LAB_CHARGES", bill.getLabCharges());
            params.put("MEDICINE_CHARGES", bill.getMedicineCharges());
            params.put("OTHER_CHARGES", bill.getOtherCharges());
            params.put("DISCOUNT", bill.getDiscount());

            // Use empty data source (data comes from parameters)
            JRDataSource dataSource = new JREmptyDataSource();
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);

            // Export to PDF
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition",
                    "inline; filename=Bill_" + bill.getBillNo() + ".pdf");
            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

        } catch (Exception e) {
            throw new JRException("Error generating bill report: " + e.getMessage(), e);
        }
    }

    /**
     * Generates a patient history report listing all lab reports and appointments.
     */
    public void generatePatientReport(Long patientId, String patientName,
                                      HttpServletResponse response) throws JRException {
        try {
            InputStream reportStream = getClass().getResourceAsStream("/reports/patient_report.jrxml");

            JasperReport jasperReport = JasperCompileManager.compileReport(reportStream);

            Map<String, Object> params = new HashMap<String, Object>();
            params.put("PATIENT_ID", patientId);
            params.put("PATIENT_NAME", patientName);

            JasperPrint jasperPrint = JasperFillManager.fillReport(
                    jasperReport, params, new JREmptyDataSource());

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition",
                    "inline; filename=Patient_Report_" + patientId + ".pdf");
            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

        } catch (Exception e) {
            throw new JRException("Error generating patient report: " + e.getMessage(), e);
        }
    }
}
