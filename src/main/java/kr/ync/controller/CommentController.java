package kr.ync.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.ync.domain.CommentPageDTO;
import kr.ync.domain.CommentVO;
import kr.ync.domain.Criteria;
import kr.ync.service.CommentService;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	// consumes은 호출하는쪽에서 application/json 요청만 받아들인다. 요청 컨텐트 타입 제한
	// produces은 조건에 지정한 미디어 타입과 관련된 응답을 생성. 응답 컨텐트 타입 제한
	// 명시적으로 consumes와 produces 조건을 각각 사용하는 것을 권장한다
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody CommentVO vo) {

		log.info("CommentVO: " + vo);

		int insertCount = service.register(vo);

		log.info("Comment INSERT COUNT: " + insertCount);

		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>("Fail!! 댓글 등록 중 오류 발생",HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	// 교재와 다른 부분 내용 추가!
	// spring 5.2에서 MediaType.APPLICATION_JSON_UTF8_VALUE 는 제거됨
	// 해당 값 없어도 현재 브라우저는 UTF-8을 제대로 처리함.
	// spring 5.2 부터 MediaType.APPLICATION_JSON_UTF8 로 수정하면됨
	@GetMapping(value = "/{comment_idx}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<CommentVO> get(@PathVariable("comment_idx") Long comment_idx) {

		log.info("get: " + comment_idx);

		return new ResponseEntity<>(service.get(comment_idx), HttpStatus.OK);
	}
	
	// PUT, PATCH method를 모두 적용시켜야 되기에 @RequestMapping을 사용
	// 둘중 하나만 적용할려면 @PutMapping, @PatchMapping 을 사용하면 된다.
	@PreAuthorize("principal.username == #vo.userid")
	@RequestMapping(value = "/{comment_idx}", method = { RequestMethod.PUT, RequestMethod.PATCH },
					consumes = "application/json", produces = {	MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody CommentVO vo, @PathVariable("comment_idx") Long comment_idx) {
		
		// @RequestBody 처리되는 data는 일반파라미터나 @PathVariable로 처리할 수 없다.
		vo.setComment_idx(comment_idx);

		log.info("comment_idx: " + comment_idx);
		log.info("modify: " + vo);

		return service.modify(vo) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>("Fail!! 댓글 수정 중 오류 발생", HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@PreAuthorize("principal.username == #vo.userid")
	@DeleteMapping(value = "/{comment_idx}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@RequestBody CommentVO vo, @PathVariable("comment_idx") Long comment_idx) {

		log.info("remove: " + comment_idx);
		log.info("userid: " + vo.getUserid());

		return service.remove(comment_idx) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>("Fail!! 댓글 삭제 중 오류 발생",HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	// spring 5.2에서 MediaType.APPLICATION_JSON_UTF8_VALUE 는 제거됨
	// 해당 값 없어도 현재 브라우저는 UTF-8을 제대로 처리함.
	// spring 5.2 부터 MediaType.APPLICATION_JSON_UTF8 로 수정하면됨
	// 페이징 처리된 댓글 목록을 가져오는 method
	@GetMapping(value = "/pages/{board_idx}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
															MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<CommentPageDTO> getList(@PathVariable("page") int page, @PathVariable("board_idx") Long board_idx) {

		Criteria cri = new Criteria(page, 10);
		
		log.info("get Comment List board_idx: " + board_idx);

		log.info("cri:" + cri);

		return new ResponseEntity<>(service.getListWithPaging(cri, board_idx), HttpStatus.OK);
	}

}

