package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.PasswordFailException;
import logic.Board;
import logic.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("board/list")
	public ModelAndView list(Integer pageNum, String column, String find, HttpServletRequest request){
		if(pageNum == null || pageNum.toString().equals("")){
			pageNum = 1;
		}
		if(column==null || column.equals("")) column = null;	
		if(column==null || find.equals("")) find = null;
		if(column == null) find = null;
		if(find == null) column = null;
		if(find != null && request.getMethod().equalsIgnoreCase("GET")){
			try{
				find = new String(find.getBytes("8859_1"),"euc-kr");
			}catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		ModelAndView mav = new ModelAndView();
		int limit = 10;
		int listcount = boardService.boardCount(column,find);
		List<Board> boardlist = boardService.list(pageNum,limit,column,find);
		int maxpage = (int)((double)listcount/limit + 0.5);
		int startpage = (((int)(pageNum/10.0+0.9))-1)*10+1;
		int endpage = startpage + limit - 1;
		if(endpage > maxpage) endpage = maxpage;
		int boardnum = listcount - ((pageNum -1) * limit);
		SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdate.format(new Date());
		mav.addObject("today",today);
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("listcount",listcount);
		mav.addObject("boardlist",boardlist);
		mav.addObject("boardnum",boardnum);
		mav.addObject("find",find);
		return mav;
	}
	
	@RequestMapping("board/detail")
	public ModelAndView detail(Integer num){
		boardService.readCntAdd(num);
		Board board = boardService.detail(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("board",board);
		return mav;
	}
	
	@RequestMapping("board/add")
	public ModelAndView add(){
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Board()); //board��ü ����
		return mav;
	}
	
	@RequestMapping("board/write")
	public ModelAndView write(@Valid Board board,BindingResult bindingResult, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("board/add");
		if(bindingResult.hasErrors()){
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		boardService.write(board,request);
		mav.setViewName("redirect:list.shop");
		return mav;
	}
	
	@RequestMapping("board/filedown")
	public void filedown(String filename, HttpServletRequest request, HttpServletResponse response){
		String encodeName = null;
		try {
			//encodeName : filename ���� euc-kr �� ���ڵ� �� �� ����
			encodeName = new String(filename.getBytes("8859_1"),"euc-kr");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String filepath = request.getServletContext().getRealPath("/") + "/fileupload/" + encodeName;
		byte[] buf = new byte[4096];
		FileInputStream fis = null;
		OutputStream out = null;
		try{
			//fis : �ٿ�ε� ����� �Ǵ� ���� ����
			fis = new FileInputStream(filepath);
			out = response.getOutputStream();
			//���������� �ٿ�ε� ������� ���� 
			response.setContentType("application/actet-stream");
			//�ٿ�ε� ������ �̸� ����
			response.setHeader("Content-Disposition", "attachment; filename="+filename);
			int readcnt = 0;
			while((readcnt = fis.read(buf)) != -1){
				out.write(buf, 0, readcnt);
			}
		}catch (IOException e) {
			e.printStackTrace();
		}finally{
			try{
				if(fis != null) fis.close();
				if(out != null){
					out.flush(); out.close();
				}
			}catch (IOException e) {}
		}
		
	}
	//num �Ķ���Ϳ� �ش��ϴ� �Խù��� �о ��� �����ϱ�
	@RequestMapping("board/replyForm")
	public ModelAndView replyForm(int num){
		ModelAndView mav = new ModelAndView();
		Board board = boardService.detail(num);
		board.setContent("");
		board.setName("");
		board.setSubject("Re:"+board.getSubject());
		mav.addObject("board", board);
		return mav;
	}
	/*
	 * ��� ����ϱ�
	 * 1. ��ȿ�� ����
	 * 2. �Է³��� DB�� insert
	 * 		- refstep + 1 ����
	 * 		- refLevel++; refStep++ �Ͽ� insert�ϱ�(�ִ� num +1)
	 * 		- 
	 * 3. list.shop�� ���û�ϱ�.  
	 */
	@RequestMapping("board/reply")
	public ModelAndView reply(@Valid Board board, BindingResult bindingResult){
		ModelAndView mav = new ModelAndView("board/replyForm");
		if(bindingResult.hasErrors()){
			mav.getModel().putAll(bindingResult.getModel());
		}
		boardService.reply(board);
		mav.setViewName("redirect:list.shop");
		return mav;
	}
	/*
	 * num �Ķ���� ����
	 * num ���� �Խù��� db���� ��ȸ
	 * ��(board/updateForm.jsp)�� ����
	 */
	@RequestMapping("board/updateForm")
	public ModelAndView updateForm(int num){
		ModelAndView mav = new ModelAndView();
		Board board = boardService.detail(num);
		mav.addObject("board",board);
		return mav;
	}
	
	/*
	 * 1. ��ȿ�� ���� +��й�ȣ ������ detail.shop ���û
	 * 2. ���Ͼ��ε� + DB�Խù� �����ϱ�
	 * 3. list.shop ���û
	 */
	@RequestMapping("board/update")
	public ModelAndView update(@Valid Board board, BindingResult bindingResult, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("board/updateForm");
		if(bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			mav.addObject("board",boardService.detail(board.getNum()));
			return mav;
		}
		String pass = boardService.detail(board.getNum()).getPass();
		System.out.println(pass);
		if(!pass.equals(board.getPass())) {
			mav.setViewName("board/updateForm");
			bindingResult.rejectValue("pass","error.board.password");
			mav.getModel().putAll(bindingResult.getModel());
			mav.addObject("board",boardService.detail(board.getNum()));
			return mav;
		}
		//������ ���� ���ε�� ������ ����.
		if(board.getFile1().isEmpty()) {
			board.setFileUrl(request.getParameter("file2"));
		}else{ //���� ���ε带 �ٽ���.
			board.setFileUrl(board.getFile1().getOriginalFilename());
		}
		boardService.update(board,request);
		mav.addObject("board",board);
		mav.setViewName("redirect:list.shop");
		return mav;
	}
	
	@RequestMapping("board/deleteForm")
	public ModelAndView deleteForm(int num){
		ModelAndView mav = new ModelAndView();
		Board board = boardService.detail(num);
		mav.addObject("board",board);
		return mav;
	}
	
	@RequestMapping("board/delete")
	public ModelAndView delete(int num, String pass){
		ModelAndView mav = new ModelAndView("board/deleteForm");
		String dbpass = boardService.detail(num).getPass();
		if(!pass.equals(dbpass)){
			throw new PasswordFailException();
		}
		boardService.delete(num);
		mav.setViewName("redirect:list.shop");
		return mav;
	}
	
}
