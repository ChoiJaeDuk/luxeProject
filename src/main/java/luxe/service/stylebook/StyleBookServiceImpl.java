package luxe.service.stylebook;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import luxe.dao.stylebook.StyleBookDAO;
import luxe.dao.stylebook.StyleBookDAOImpl;
import luxe.dto.StyleBookDTO;

public class StyleBookServiceImpl implements StyleBookService {
	private StyleBookDAO styleBookDao = new StyleBookDAOImpl();

	@Override
	public List<StyleBookDTO> selectAllStyleBook(String brand, int goodsNo, String sortCondition) throws SQLException {
		String sqlFilter = "";
		if (goodsNo != 0) {
			sqlFilter = "having g.brand like '%" + brand;
		} else {
			sqlFilter = "having s.goods_no=" + goodsNo + "' and g.brand like '%" + brand;
		}
		String sqlSort = "";

		if (sortCondition != null) {
			sqlSort = " order by " + sortCondition + " desc";
		}

		List<StyleBookDTO> list = styleBookDao.selectAllStyleBook(sqlFilter, sqlSort);

		if (list == null)
			throw new SQLException("선택하신 검색 조건의 스타일북이 존재하지 않습니다.");

		return list;
	}

	@Override
	public StyleBookDTO selectStyleBookByBoardRegNo(int boardRegNo, boolean flag) throws SQLException {
		if (flag) {
			if (styleBookDao.increaseStyleBookReadNo(boardRegNo) == 0)
				throw new SQLException("조회수 증가 오류 입니다.");
		}

		StyleBookDTO stylebook = styleBookDao.selectStyleBookByBoardRegNo(boardRegNo);
		if (stylebook == null)
			throw new SQLException("스타일북 상세보기에 오류가 발생했습니다.");

		return stylebook;
	}

	@Override
	public void increaseStyleBookLikeNo(int boardRegNo) throws SQLException {
		int result = styleBookDao.increaseStyleBookLikeNo(boardRegNo);
		if (result == 0)
			throw new SQLException("스타일북 'like'오류가 발생했습니다.");
	}

	@Override
	public void insertStyleBook(StyleBookDTO styleBook) throws SQLException {
		int result = styleBookDao.insertStyleBook(styleBook);
		if (result == 0)
			throw new SQLException("스타일북 등록에 오류가 발생했습니다.");
	}

	@Override
	public void deleteStyleBook(int boardRegNo, String saveDir) throws SQLException {
		StyleBookDTO dbStyleBook = styleBookDao.selectStyleBookByBoardRegNo(boardRegNo);
		if (dbStyleBook == null)
			throw new SQLException("선택하신 글번호에 해당하는 게시물이 없습니다.");
		int result = styleBookDao.deleteStyleBook(boardRegNo);
		if (result == 0)
			throw new SQLException("스타일북 삭제에 오류가 발생했습니다.");

		// 첨푸 파일이 있는 경우, stylebook 폴더에서 파일도 삭제
		if (dbStyleBook.getfName() != null) {
			String fileName = saveDir + "/" + dbStyleBook.getfName();
			new File(fileName).delete();
		}

	}

	@Override
	public void updateStyleBook(StyleBookDTO styleBook) throws SQLException {
		int result = styleBookDao.updateStyleBook(styleBook);
		if (result == 0)
			throw new SQLException("스타일북 수정에 오류가 발생했습니다.");

	}

}
