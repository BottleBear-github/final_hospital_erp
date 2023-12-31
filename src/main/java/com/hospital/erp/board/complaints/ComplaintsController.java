package com.hospital.erp.board.complaints;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.board.notice.NoticeController;
import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.board.notice.NoticeService;
import com.hospital.erp.board.notice.NoticeVO;
import com.hospital.erp.file.FileVO;
import com.hospital.erp.member.MemberVO;

import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("board/complaints/*")
@Slf4j
@ToString
public class ComplaintsController {

    @Autowired
    private ComplaintsService complaintsService;
    
    @ModelAttribute("board")
	public String getBoard() {
		return "complaints";
	}

    // 민원게시판 목록 화면
    @GetMapping("list")
    public String complaintsList(@AuthenticationPrincipal MemberVO memberVO,ComplaintsVO complaintsVO, Model model) throws Exception {
        
    	// 세션에서 각 정보들을 가져와 각각의 이름으로 jsp로 전달
    	model.addAttribute("memCd",memberVO.getMemCd());
    	model.addAttribute("memName",memberVO.getMemName());
        model.addAttribute("depCd",memberVO.getDepCd());
    	
        // 민원게시판의 글들을 리스트에 담아 data라는 이름으로 전달
    	List<ComplaintsVO> data = complaintsService.complaintsList(complaintsVO);
       
    	// DataTables에 데이터 전달
        model.addAttribute("data", data);

        return "board/complaints/list";
    }

    // 민원게시판 등록 화면
    @GetMapping("insert")
    public String complaintsInsert(@AuthenticationPrincipal MemberVO memberVO,Model model) {
    	
    	// 세션에서 가져온 정보들을 각각의 이름으로 jsp로 전달
    	model.addAttribute("memCd", memberVO.getMemCd());
    	model.addAttribute("memName", memberVO.getMemName());
    	model.addAttribute("depCd", memberVO.getDepCd());
    	model.addAttribute("depName", memberVO.getDepName());
    	
    	
        return "board/complaints/insert";
    }

    // 민원게시판 등록 처리
    @PostMapping("insert")
    public String complaintsInsert(@AuthenticationPrincipal MemberVO memberVO,ComplaintsVO complaintsVO, MultipartFile[] files1, HttpSession session, Model model) throws Exception {
       
    	// 세션에서 가져온 정보들을 complaintsVO set 하고 인서트
    	complaintsVO.setMemName(memberVO.getMemName());
    	complaintsVO.setDepCd(memberVO.getDepCd());
    	complaintsVO.setDepName(memberVO.getDepName());
    	
    	int result = complaintsService.complaintsInsert(complaintsVO, files1);

        String message = "등록 실패";

        if (result > 0) {
            message = "등록 성공";
        }
        model.addAttribute("message", message);
        model.addAttribute("url", "list");
        
        return "commons/result";
    }

    // 민원게시판 상세 화면
    @GetMapping("data/{compCd}")
    public String complaintsData(@AuthenticationPrincipal MemberVO memberVO,@PathVariable int compCd, Model model) throws Exception {
    	
    	// 세션에서 가져온 정보들을 각각의 이름으로 jsp로 전달
    	model.addAttribute("memCd",memberVO.getMemCd());
    	model.addAttribute("memName",memberVO.getMemName());
        model.addAttribute("depCd",memberVO.getDepCd());
        model.addAttribute("depName", memberVO.getDepName());
    	
    	// 민원게시판 상세 정보를 가져옵니다.
        ComplaintsVO complaintsVO = complaintsService.complaintsData(compCd);

        if (complaintsVO != null) {
            // 민원게시판에 속하는 파일 리스트를 가져옵니다.
            List<ComplaintsFileVO> fileList = complaintsService.fileData(compCd);
            complaintsVO.setList(fileList);

            // Model에 공지사항 정보를 담아서 View로 전달합니다.
            model.addAttribute("data", complaintsVO);

            return "board/complaints/data";
        
        } else {
            
        	// 민원게시판이 존재하지 않을 때 예외 처리 (View에서 메시지 표시 등)
            return "redirect:/board/complaints/list"; 
        }
    }

    // 민원게시판 수정 화면
    @GetMapping("update/{compCd}")
    public String complaintsUpdate(@PathVariable int compCd, Model model) throws Exception {
        
    	ComplaintsVO complaintsVO = complaintsService.complaintsData(compCd);
        
    	// 민원게시판의 속하는 파일리스트를 가져온다
        List<ComplaintsFileVO> fileList = complaintsService.fileData(compCd);
        complaintsVO.setList(fileList);

        model.addAttribute("data", fileList);
        model.addAttribute("board", complaintsVO);

        return "board/complaints/update";
    }

    // 민원게시판 수정 처리
    @PostMapping("update")
    public String complaintsUpdate(ComplaintsVO complaintsVO, MultipartFile[] files1, HttpSession session, Model model) throws Exception {
        
    	int result = complaintsService.complaintsUpdate(complaintsVO, files1);

        String message = "등록 실패";

        if (result > 0) {
            message = "등록 성공";
        }
        model.addAttribute("message", message);
        model.addAttribute("url", "list");
        return "commons/result";
    }

    @GetMapping("fileDown")
public ResponseEntity<byte[]> fileDown(@RequestParam int bfCd,FileVO fileVO, Model model) throws Exception {
		
		fileVO.setBfCd(bfCd);
		
		return complaintsService.fileDown(fileVO);

	}
	
	
	// FileDelete
	@GetMapping("fileDelete")
	public String fileDelete(int bfCd,Model model,HttpSession session) throws Exception{
		
		int result = complaintsService.fileDelete(bfCd);
		
		model.addAttribute("result",result);
		
		return "commons/ajaxResult";
	}
	
    
    @GetMapping("/actionUpdate/{compCd}")
    public String updateAction(@PathVariable int compCd, @RequestParam int codeCdAction) throws Exception {
    	
    	// 빈 complaintsVO 객체 생성
    	ComplaintsVO complaintsVO = new ComplaintsVO();
        
    	// ajax로 받은 데이터를 해당 객체에 set
    	complaintsVO.setCompCd(compCd);
        complaintsVO.setCodeCdAction(codeCdAction);
        
        int result = complaintsService.actionUpdate(complaintsVO);

    
        return "redirect:/board/complaints/list";
    }
    
    @GetMapping("delete/{compCd}")
    public String deleteComplaint(@PathVariable int compCd, Model model) throws Exception {
        
    	
            int result = complaintsService.complaintsDelete(compCd);
            
            String message = "삭제 실패";

            if (result > 0) {
                message = "삭제 성공";
            }
            model.addAttribute("message", message);
            model.addAttribute("url", "../list");
            return "commons/result";
        
    }
    
    
 }
