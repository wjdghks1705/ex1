package logic;

import java.io.FileOutputStream;import java.io.IOError;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDao;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao dao;
	
	@Override
	public int boardCount(String column, String find) {
		return dao.countAll(column,find);
	}
	@Override
	public List<Board> list(Integer pageNum, int limit, String column, String find) {
		return dao.list(pageNum,limit,column,find);
	}
	@Override
	public void readCntAdd(Integer num) {
		dao.readCntAdd(num);
		
	}
	@Override
	public Board detail(Integer num) {
		return dao.detail(num);
	}
	@Override
	public void write(Board board, HttpServletRequest request) {
		if(board.getFile1() != null && !board.getFile1().isEmpty()){
			updateFileCreate(board.getFile1(),request);
		}
		board.setFileUrl(board.getFile1().getOriginalFilename());
		int num = dao.getMaxNum();
		board.setNum(++num);
		board.setRef(num);
		board.setRefLevel(0);
		board.setRefStep(0);
		dao.insert(board);
	}
	private void updateFileCreate(MultipartFile file1, HttpServletRequest request) {
		String uploadPath = request.getServletContext().getRealPath("/") + "/fileupload/";
		FileOutputStream fos = null;
		try{
			System.out.println("1");
			fos = new FileOutputStream(uploadPath + file1.getOriginalFilename());
			InputStream in = file1.getInputStream();
			int len;
			byte[] buf = new byte[4096];
			while((len = in.read(buf)) != -1){
				fos.write(buf,0,len);
			}
			System.out.println("2");
		}catch (IOException e) {
			e.printStackTrace();
		}finally{
			try{
				if(fos != null){
					fos.flush(); fos.close();
				}
			}catch (IOException e) {}
		}
		
	}
	@Override
	public void reply(Board board) {
		//1. board 테이블의 num 최대값 구하기
		int num = dao.getMaxNum();
		//2. refstep을 변경 목록 출력시 순서 설정
		dao.refStepAdd(board);
		//3. board 테이블에 insert 하기
		board.setNum(++num);
		board.setRefLevel(board.getRefLevel() + 1);
		board.setRefStep(board.getRefStep() + 1);
		board.setFileUrl("");
		dao.insert(board);
	}
	@Override
	public void update(Board board, HttpServletRequest request) {
		if(!board.getFile1().isEmpty()) {
			updateFileCreate
			    (board.getFile1(), request);
		}
		dao.update(board);
	}
	@Override
	public void delete(int num) {
		dao.delete(num);
	}
}
