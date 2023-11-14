package com.hospital.erp.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.erp.member.MemberService;
import com.hospital.erp.member.MemberVO;
import com.hospital.erp.patient.PatientService;
import com.hospital.erp.patient.PatientVO;

import lombok.extern.slf4j.Slf4j;

/*
 * From 서동휘
 * 진료 예약 controller
 */
@Controller
@RequestMapping("/reservation/*")
@Slf4j
public class ReservationController {
	
	@Autowired
	private PatientService patientService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReservationService reservationService;
	
	//진료 내역 리스트 요청 메서드
	@GetMapping("list")
	public String reservationList(Model model) throws Exception {
		List<ReservationVO> reservationAr = reservationService.reservationList();
		model.addAttribute("reservationAr", reservationAr);
		return "reservation/list";
	}
	
	//진료 예약 추가 폼 요청 메서드
	@GetMapping("insert")
	public String reservationInsert(PatientVO patientVO,Model model) throws Exception {
		patientVO = patientService.patientData(patientVO);
		model.addAttribute("patientVO", patientVO);
		return "reservation/insert";
	}
	
	//진료 예약 추가 요청 메서드
	@PostMapping("insert")
	public String reservationInsert(ReservationVO reservationVO) throws Exception {
		int result = reservationService.reservationInsert(reservationVO);
		return "redirect:/patient/data?patCd="+reservationVO.getPatCd();
	}
	
	//진료 예약 수정 폼 요청 메서드
	@GetMapping("update")
	public String reservatioinUpdate(ReservationVO reservationVO,Model model) throws Exception {
		log.info("update get reservationVO {}",reservationVO);
		reservationVO = reservationService.reservationData(reservationVO);
		model.addAttribute("reservationVO", reservationVO);
		PatientVO patientVO = new PatientVO();
		patientVO.setPatCd(reservationVO.getPatCd());
		patientVO = patientService.patientData(patientVO);
		log.info("===========patientVO {}",patientVO);
		model.addAttribute("patientVO", patientVO);
		return "reservation/update";
	}
	
	@PostMapping("update")
	public String reservationUpdate(ReservationVO reservationVO) throws Exception {
		int result = reservationService.reservationUpdate(reservationVO);
		return "reservation/list";
	}
	
	// 해당시간 가능한 의사 조회해오기
	@PostMapping("search")
	@ResponseBody
	public List<MemberVO> memberDoctorList(ReservationVO reservationVO) throws Exception {
		log.info("==========ReservationVO Search {} ========",reservationVO);
		List<MemberVO> memberAr =  memberService.memberDoctorList(reservationVO);
		return memberAr;
	}
	
	
}
