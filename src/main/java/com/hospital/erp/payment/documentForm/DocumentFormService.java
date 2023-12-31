package com.hospital.erp.payment.documentForm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DocumentFormService {

	@Autowired
	private DocumentFormDAO documentFormDAO;
	
	public List<DocumentFormVO> documentFormList()throws Exception{
		
		return documentFormDAO.documentFormList();
	}
	
	public DocumentFormVO documentFormData(DocumentFormVO documentFormVO)throws Exception{
		
		return documentFormDAO.documentFormData(documentFormVO);
	}
	
	public int documentFormInsert(DocumentFormVO documentFormVO)throws Exception{
		
		return documentFormDAO.documentFormInsert(documentFormVO);
	}
	
	
}
