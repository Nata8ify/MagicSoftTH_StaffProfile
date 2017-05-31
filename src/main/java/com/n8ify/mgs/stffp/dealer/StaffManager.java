package com.n8ify.mgs.stffp.dealer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.mgs.stffp.intface.StaffManagementInterface;
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
				+ "(`staffId`, `gender`, `name`, `email`, `tel`, `division`, `position`, `protraitPath`, `hostManagerId`)"
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
		return jdbcTemplate.update(sql,
				new Object[] { staff.getStaffId(), staff.getGender(), staff.getName(), staff.getEmail(), staff.getTel(),
						staff.getDivision(), staff.getPosition(), staff.getProtraitPath(),
						staff.getHostManagerId() }) > 0;
	}

	@Override
	public boolean editStaff(Staff staff) {
		String sql = "UPDATE `Staff` SET `name`=?, `gender`=? ,`email`=?,`tel`=?,`division`=?, `position`=?,`protraitPath`=?"
				+ ",`hostManagerId`=? WHERE `staffId` = ?;";
		return jdbcTemplate.update(sql,
				new Object[] { staff.getName(), staff.getGender(), staff.getEmail(), staff.getTel(),
						staff.getDivision(), staff.getPosition(), staff.getProtraitPath(), staff.getHostManagerId(),
						staff.getStaffId() }) > 0;
	}

	@Override
	public boolean deleteStaffById(String staffId) {
		String sql = "DELETE FROM `Staff` WHERE `staffId` = ?;";
		return jdbcTemplate.update(sql, new Object[] { staffId }) > 0;
	}

	@Override
	public Staff getStaffById(String staffId) {
		String sql = "SELECT * FROM `Staff` WHERE `staffId` = ?;";
		return jdbcTemplate.queryForObject(sql, new Object[] { staffId }, new StaffMapper());
	}

	// SELECT s.*, ss.name FROM `Staff` s JOIN Staff sm on s.`hostManagerId` =
	// ss.staffId
	@Override
	public List<Staff> getEntireStaffs() {
		// String sql = "SELECT * FROM `Staff`;";

		String sql = "SELECT s.*, sm.name AS managerName FROM `Staff` s LEFT JOIN Staff sm on s.`hostManagerId` = sm.staffId;";
		return jdbcTemplate.query(sql, new StaffOnMoreDetailsMapper());
	}

	@Override
	public List<Staff> getStaffsByNameLike(String nameLike) {
		String sql = "SELECT * FROM `Staff` WHERE `name` like ?;";
		return jdbcTemplate.query(sql, new Object[] { "%" + nameLike + "%" }, new StaffMapper());
	}

	@Override
	public List<Staff> getStaffsByHostManagerId(String managerId) {
		String sql = "SELECT * FROM `Staff` WHERE `hostManagerId` = ?;";
		return jdbcTemplate.query(sql, new Object[] { managerId }, new StaffMapper());
	}

	class StaffMapper implements RowMapper<Staff> {

		@Override
		public Staff mapRow(ResultSet rs, int i) throws SQLException {
			Staff staff = new Staff();
			staff.setStaffId(rs.getString("staffId"));
			staff.setGender(rs.getString("gender"));
			staff.setName(rs.getString("name"));
			staff.setEmail(rs.getString("email"));
			staff.setTel(rs.getString("tel"));
			staff.setDivision(rs.getString("division"));
			staff.setPosition(rs.getString("position"));
			staff.setProtraitPath(rs.getString("protraitPath"));
			staff.setHostManagerId(rs.getString("hostManagerId"));
			return staff;
		}

	}

	class StaffOnMoreDetailsMapper implements RowMapper<Staff> {

		@Override
		public Staff mapRow(ResultSet rs, int i) throws SQLException {
			Staff staff = new Staff();
			staff.setStaffId(rs.getString("staffId"));
			staff.setGender(rs.getString("gender"));
			staff.setName(rs.getString("name"));
			staff.setEmail(rs.getString("email"));
			staff.setTel(rs.getString("tel"));
			staff.setDivision(rs.getString("division"));
			staff.setPosition(rs.getString("position"));
			staff.setProtraitPath(rs.getString("protraitPath"));
			staff.setHostManagerId(rs.getString("hostManagerId"));
			staff.setHostManagerName(rs.getString("managerName"));
			return staff;
		}

	}
}
