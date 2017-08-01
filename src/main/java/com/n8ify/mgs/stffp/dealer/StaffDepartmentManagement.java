package com.n8ify.mgs.stffp.dealer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.mgs.stffp.intface.StaffDepartmentManagementInterface;
import com.n8ify.mgs.stffp.model.StaffDepartment;

public class StaffDepartmentManagement implements StaffDepartmentManagementInterface{
	private JdbcTemplate jdbc;

	public StaffDepartmentManagement(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public boolean add(String department) {
		String sqlAdd = "INSERT INTO `StaffDepartment`(`department`) VALUES (?)";
		return jdbc.update(sqlAdd, new Object[]{department}) == 1;
	}

	@Override
	public boolean update(StaffDepartment department) {
		String sqlFindOldDepartment = "SELECT `department` FROM `StaffDepartment` WHERE `departmentId` = ?;";
		String sqlUpdate = "UPDATE `StaffDepartment` SET `department`= ? WHERE `departmentId` = ?;";
		String sqlUpateStaffDivision = "UPDATE `Staff` SET `division` = ? WHERE `division` = ?;";
		String oldDepartment = jdbc.queryForObject(sqlFindOldDepartment, new Object[]{department.getDepartmentId()}, String.class);
		if(jdbc.update(sqlUpdate, new Object[]{department.getDepartment(), department.getDepartmentId()}) == 1){
			return jdbc.update(sqlUpateStaffDivision, new Object[]{department.getDepartment(), oldDepartment}) >= 0;
		}
		return false;
	}

	@Override
	public boolean deleteById(int departmentId) {
		String sqlDelById = "DELETE FROM `StaffDepartment` WHERE `departmentId` = ?;";
		return jdbc.update(sqlDelById, departmentId) == 1;
	}

	@Override
	public boolean deleteByName(String department) {
		String sqlDelByName = "DELETE FROM `StaffDepartment` WHERE `department` = ?;";
		return jdbc.update(sqlDelByName, department) == 1;
	}

	@Override
	public List<StaffDepartment> findAll() {
		String sqlFindAll = "SELECT * FROM `StaffDepartment`;";
		return jdbc.query(sqlFindAll, new DepartmentMapper());
	}
	
	class DepartmentMapper implements RowMapper<StaffDepartment>{

		@Override
		public StaffDepartment mapRow(ResultSet rs, int arg1) throws SQLException {
			return new StaffDepartment(rs.getInt(1), rs.getString(2));
		}}

}
