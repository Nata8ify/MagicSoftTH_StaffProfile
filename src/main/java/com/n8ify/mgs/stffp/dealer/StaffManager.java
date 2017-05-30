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
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public boolean insertStaff(Staff staff) {
		String sql = "INSERT INTO `Staff`"
				+ "(`staffId`, `name`, `email`, `tel`, `division`, `protraitPath`, `hostManagerId`)"
				+ " VALUES (?, ?, ?, ?, ?, ?, ?);";
		return jdbcTemplate.update(sql, new Object[] { staff.getStaffId(), staff.getName(), staff.getEmail(),
				staff.getTel(), staff.getDivision(), staff.getProtraitPath(), staff.getHostManagerId() }) > 0;
	}

	@Override
	public boolean editStaff(Staff staff) {
		String sql = "UPDATE `Staff` SET ``name`=?,`email`=?,`tel`=?,`division`=?,`protraitPath`=?"
				+ ",`hostManagerId`=? WHERE `staffId` = ?;";
		return jdbcTemplate.update(sql, new Object[] { staff.getName(), staff.getEmail(), staff.getTel(),
				staff.getDivision(), staff.getProtraitPath(), staff.getHostManagerId(), staff.getStaffId() }) > 0;
	}

	@Override
	public boolean deleteStaffById(int staffId) {
		String sql = "DELETE FROM `Staff` WHERE `staffId` = ?;";
		return jdbcTemplate.update(sql, new Object[] { staffId }) > 0;
	}

	@Override
	public Staff getStaffById(int staffId) {
		String sql = "SELECT * FROM `Staff` WHERE `staffId` = ?;";
		return jdbcTemplate.queryForObject(sql, new Object[] { staffId }, new StaffMapper());
	}

	@Override
	public List<Staff> getStaffsByNameLike(String nameLike) {
		String sql = "SELECT * FROM `Staff` WHERE `name` like ?;";
		return jdbcTemplate.query(sql, new Object[] { "%" + nameLike + "%" }, new StaffMapper());
	}

	@Override
	public List<Staff> getStaffsByHostManagerId(int managerId) {
		String sql = "SELECT * FROM `Staff` WHERE `hostManagerId` = ?;";
		return jdbcTemplate.query(sql, new Object[] { managerId }, new StaffMapper());
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
			Manager manager = new Manager();
			manager.setManagerId(rs.getString("managerId"));
			manager.setName(rs.getString("name"));
			manager.setEmail(rs.getString("email"));
			manager.setTel(rs.getString("tel"));
			manager.setDivision(rs.getString("division"));
			manager.setProtraitPath(rs.getString("protraitPath"));
			manager.setHostManagerId(rs.getString("hostManagerId"));
			return manager;
		}
	}

	class AdministratorMapper implements RowMapper<Administrator> {

		@Override
		public Administrator mapRow(ResultSet rs, int i) throws SQLException {
			Administrator admin = new Administrator();
			admin.setAdminId(rs.getString("adminId"));
			admin.setName(rs.getString("name"));
			admin.setEmail(rs.getString("email"));
			admin.setTel(rs.getString("tel"));
			admin.setDivision(rs.getString("division"));
			admin.setProtraitPath(rs.getString("protraitPath"));
			return admin;
		}
	}

}
