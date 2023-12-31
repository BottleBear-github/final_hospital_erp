package com.hospital.erp.patient;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hospital.erp.reservation.ReservationVO;

/*
 * From 서동휘
 * Patient Service
 */
@Service
public class PatientService {

	@Autowired
	private PatientDAO patientDAO;
	
	//환자 리스트 메서드
	public List<PatientVO> patientList() throws Exception {
		return patientDAO.patientList();
	}
	
	//환자 등록 메서드
	public int patinetInsert(PatientVO patientVO) throws Exception {
		char gender =patientVO.getPatRnum().charAt(7);
		if(gender == '1' || gender == '3'){
			patientVO.setCodeCd(1);
		}else {
			patientVO.setCodeCd(2);
		}
		
		return patientDAO.patientInsert(patientVO);
	}
	
	// 환자 디테일 메서드
	public PatientVO patientData(PatientVO patientVO) throws Exception {
		return patientDAO.patientData(patientVO);
	}
	
	public int patientUpdate(PatientVO patientVO) throws Exception {
		return patientDAO.patientUpdate(patientVO);
	}
	
}
