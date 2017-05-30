package com.n8ify.mgs.stffp.dealer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.mgs.stffp.intface.StaffManagementInterface;
import com.n8ify.mgs.stffp.model.Administrator;
import com.n8ify.mgs.stffp.model.Manager;
import com.n8ify.mgs.stffp.model.Staff;

public class StaffManager implements StaffManagementInterface {

	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public boolean insertStaff(Staff staff) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean editStaff(Staff staff) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteStaffById(int staffId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Staff getStaffById(int staffId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Staff> getStaffByNameLike(String nameLike) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Staff> getStaffByHostManagerId(int staffId) {
		// TODO Auto-generated method stub
		return null;
	}

	class StaffMapper implements RowMapper<Staff> {

		@Override
		public Staff mapRow(ResultSet rs, int i) throws SQLException {
			Staff staff = new Staff();
			staff.setStaffId(rs.getString("staffId"));
			staff.setName(rs.getString("name"));
			staff.setEmail(rs.getString("email"));
			staff.setTel(rs.getString("tel"));
			staff.setDivision(rs.getString("division"));
			staff.setProtraitPath(rs.getString("protraitPath"));
			staff.setHostManagerId(rs.getString("hostManagerId"));
			return staff;
		}
	}

	class ManagerMapper implements RowMapper<Manager> {

		@Override
		public Manager mapRow(ResultSet rs, int i) throws SQLException {
			// TODO Auto-generated method stub
			return null;
		}
	}
	
	class AdministratorMapper implements RowMapper<Administrator> {

		@Override
		public Administrator mapRow(ResultSet rs, int i) throws SQLException {
			// TODO Auto-generated method stub
			return null;
		}
	}
	
}
