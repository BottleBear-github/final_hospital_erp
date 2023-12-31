package com.hospital.erp.reservation;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;


@Getter
@Setter
@Slf4j
@ToString
public class ReservationVO {

	private Integer resCd;
	private Integer patCd;
	private Integer memCd; //작성자(간호사)
	private Integer resMemCd; //의사
	private Integer depCd;
	private String resReason;
	private String resVdate;
	private String resMHistory;
	private String resDrug;
	private Integer resClinic;
	private Timestamp resRdate;
	
	private String depName; // department JOIN 결과
	private String memName; // memberJOin 
	private String resMemName; // meberJoin 의사이름
	
}
