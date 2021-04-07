package web_gradle_erp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import web_gradle_erp.dao.TitleDao;
import web_gradle_erp.dto.Title;

public class TitleDaoImpl implements TitleDao {

	private static final TitleDaoImpl instance = new TitleDaoImpl();
	
	private Connection con;	

	public TitleDaoImpl() {}

	public static TitleDaoImpl getInstance() {
		return instance;
	}
	
	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public List<Title> selectTitleByAll() {
		String sql = "select titleNo, titleName from title";
		try(PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			List<Title> list = new ArrayList<Title>();
			do {
				list.add(getTitle(rs));
			}while(rs.next());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	

	private Title getTitle(ResultSet rs) throws SQLException {
		int titleNo = rs.getInt("titleNo");
		String titleName = rs.getString("titleName");
		return new Title(titleNo, titleName);
	}

	@Override
	public Title selectTitleByNO(Title title) {
		return null;
	}

	@Override
	public int insertTitle(Title title) {
		return 0;
	}

	@Override
	public int updateTitle(Title title) {
		return 0;
	}

	@Override
	public int deleteTitle(Title title) {
		// TODO Auto-generated method stub
		return 0;
	}



}
