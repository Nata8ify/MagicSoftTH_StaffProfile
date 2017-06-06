package com.n8ify.mgs.stffp.dealer;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.mgs.stffp.intface.StffpfAccessInterface;
import com.n8ify.mgs.stffp.model.Staff;
import com.n8ify.mgs.stffp.model.StaffAccess;

public class SttfpAccess implements StffpfAccessInterface {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(this.dataSource);
	}

	@Override
	public Staff login(String staffId, String password) {
		String sql = "SELECT * FROM `Staff` s JOIN StaffAccess sa on s.`staffId` = sa.staffId WHERE sa.staffId = ? AND sa.password = ?;";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { staffId, password }, new StaffMapper());
		} catch (EmptyResultDataAccessException erex) {
			return null; // <-- Please Change Handle Thing.
		}
	}

	@Override
	public Staff login(String staffId, String password, String staffType) {
		String sql = "SELECT * FROM `Staff` s JOIN StaffAccess sa on s.`staffId` = sa.staffId WHERE sa.staffId = ? AND sa.password = ? AND staffType = ?;";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { staffId, password, staffType }, new StaffMapper());
		} catch (EmptyResultDataAccessException erex) {
			return null; // <-- Please Change Handle Thing.
		}
	}

	@Override
	public Staff getProfile(String staffId) {
		String sql = "SELECT * FROM `Staff` s JOIN StaffAccess sa on s.`staffId` = sa.staffId WHERE sa.staffId = ? AND sa.password = ?;";
		//
		return null;
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

	class StaffAccessMapper implements RowMapper<StaffAccess> {

		@Override
		public StaffAccess mapRow(ResultSet rs, int arg1) throws SQLException {
			return new StaffAccess(rs.getString("staffId"), rs.getString("password"));
		}
	}

}
