package com.n8ify.mgs.stffp.dealer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.mgs.stffp.intface.StaffManagementInterface;
import com.n8ify.mgs.stffp.model.Staff;

public class StaffManager implements StaffManagementInterface {
	private static final Logger logger = LoggerFactory.getLogger(StaffManager.class);
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

	/** If two operation was success, return true */
	@Override
	public boolean insertStaff(Staff staff, String password) {
		String sql = "INSERT INTO `Staff`"
				+ "(`staffId`, `gender`, `name`, `email`, `tel`, `division`, `position`, `protraitPath`, `hostManagerId`, `staffType`)"
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		boolean is1stSuccess = jdbcTemplate.update(sql,
				new Object[] { staff.getStaffId(), staff.getGender(), staff.getName(), staff.getEmail(), staff.getTel(),
						staff.getDivision(), staff.getPosition(), staff.getProtraitPath(), staff.getHostManagerId(),
						staff.getStaffType() }) > 0;
		sql = " INSERT INTO `StaffAccess`(`staffId`, `password`) VALUES (?,?);";
		return jdbcTemplate.update(sql, new Object[] { staff.getStaffId(), password }) > 0 & is1stSuccess;
	}

	@Override
	public boolean editStaff(Staff staff, String newPassword) {
		String sql = "UPDATE `Staff` s SET s.`name`=?, s.`gender`=? ,s.`email`=?,s.`tel`=?,s.`division`=?, s.`position`=?,s.`protraitPath`=?"
				+ ",s.`hostManagerId`=?, s.staffType = ? WHERE s.`staffId` = ?;";
		boolean is1stSuccess = jdbcTemplate.update(sql,
				new Object[] { staff.getName(), staff.getGender(), staff.getEmail(), staff.getTel(),
						staff.getDivision(), staff.getPosition(), staff.getProtraitPath(), staff.getHostManagerId(),
						staff.getStaffType(), staff.getStaffId() }) > 0;
		if (newPassword == null) {// <-- No Password? then Skip Access Update.
			return is1stSuccess;
		}
		String updateAccessSql = "UPDATE `StaffAccess` SET `password`= ? WHERE `staffId`= ?;";
		return jdbcTemplate.update(updateAccessSql, new Object[] { newPassword, staff.getStaffId() }) > 0
				& is1stSuccess;
	}

	@Override
	public boolean editStaffForNoImage(Staff staff, String newPassword) {
		String sql = "UPDATE `Staff` s SET s.`name`=?, s.`gender`=? ,s.`email`=?,s.`tel`=?,s.`division`=?, s.`position`=?"
				+ ",s.`hostManagerId`=?, s.staffType = ? WHERE s.`staffId` = ?;";
		boolean is1stSuccess = jdbcTemplate.update(sql,
				new Object[] { staff.getName(), staff.getGender(), staff.getEmail(), staff.getTel(),
						staff.getDivision(), staff.getPosition(), staff.getHostManagerId(), staff.getStaffType(),
						staff.getStaffId() }) > 0;
		if (newPassword == null) {// <-- No Password? then Skip Access Update.
			return is1stSuccess;
		}
		String updateAccessSql = "UPDATE `StaffAccess` SET `password`= ? WHERE `staffId`= ?;";
		return jdbcTemplate.update(updateAccessSql, new Object[] { newPassword, staff.getStaffId() }) > 0
				& is1stSuccess;
	}

	@Override
	public boolean editSelfStaff(Staff staff, String newPassword) {
		String sql = "UPDATE `Staff` s JOIN `StaffAccess` sa on s.`staffId` = sa.`staffId` SET  s.`name`= ?, s.`email`= ?, s.`tel`= ?, s.`protraitPath`= ?, sa.`password`  = ? WHERE s.`staffId`= ?;";
		return jdbcTemplate.update(sql, new Object[] { staff.getName(), staff.getEmail(), staff.getTel(),
				staff.getProtraitPath(), newPassword, staff.getStaffId() }) > 0;
	}

	@Override
	public boolean deleteStaffById(String staffId) {
		String sqlDelFromStaff = "DELETE FROM `Staff` WHERE `staffId` = ?;";
		String sqlDelFromStaffAccess = "DELETE FROM `StaffAccess` WHERE `staffId` = ?;";
		jdbcTemplate.update(sqlDelFromStaffAccess, new Object[] { staffId });
		return jdbcTemplate.update(sqlDelFromStaff, new Object[] { staffId }) > 0;
	}

	@Override
	public Staff getStaffById(String staffId) {
		String sql = "SELECT * FROM `Staff` WHERE `staffId` = ?;";
		Staff.setStaffInstance(jdbcTemplate.queryForObject(sql, new Object[] { staffId }, new StaffMapper()));
		return Staff.getStaffInstance();
	}

	// SELECT s.*, ss.name FROM `Staff` s JOIN Staff sm on s.`hostManagerId` =
	// ss.staffId
	@Override
	public List<Staff> getEntireStaffs() {
		// String sql = "SELECT * FROM `Staff`;";
		String sql = "SELECT s.*, sm.name AS managerName FROM `Staff` s LEFT JOIN Staff sm on s.`hostManagerId` = sm.staffId ;";
		// String sql = "SELECT s.*, sm.name AS managerName FROM `Staff` s JOIN
		// StaffAccess sa on s.`staffId` = sa.staffId;";
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

	@Override
	public List<Staff> getTotalManagers() {
		String sql = "SELECT * FROM `Staff` WHERE  `staffType` = ? ;";
		return jdbcTemplate.query(sql, new Object[] { Staff.TYPE_MANAGER }, new StaffMapper());
	}

	@Override
	public List<Staff> getTotalStaffs() {
		String sql = "SELECT * FROM `Staff` WHERE  `staffType` = ? OR `staffType` = ? ;";
		return jdbcTemplate.query(sql, new Object[] { Staff.TYPE_STAFF, Staff.TYPE_ADMINISTRATOR }, new StaffMapper());
	}

	@Override
	public List<Staff> getTotalUnassignedStaffs() {
		String sql = "SELECT * FROM `Staff` WHERE  `staffType` != ? AND hostManagerId IS NULL;";
		return jdbcTemplate.query(sql, new Object[] { Staff.TYPE_MANAGER }, new StaffMapper());

	}

	@Override
	public boolean editPassword(String staffId, String password) {
		// TODO Auto-generated method stub
		return false;
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
			staff.setStaffType(rs.getString("staffType"));
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
			staff.setStaffType(rs.getString("staffType"));
			staff.setHostManagerName(rs.getString("managerName"));
			return staff;
		}

	}

}
