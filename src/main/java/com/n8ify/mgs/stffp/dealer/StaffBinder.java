package com.n8ify.mgs.stffp.dealer;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.n8ify.mgs.stffp.intface.StaffBinderInterface;

public class StaffBinder implements StaffBinderInterface {

	private DataSource dataSource;
	private JdbcTemplate jdbctemplate;
	
	
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbctemplate = new JdbcTemplate(this.dataSource);
	}

	@Override
	public void bindStaffToManager(String staffId, String managerId) {
		String sql = "UPDATE `Staff` SET `hostManagerId`= ? WHERE `staffId`= ?;";
		jdbctemplate.update(sql, new Object[]{managerId, staffId});
	}

	@Override
	public void bindStaffsToManager(List<String> staffIds, String managerId) {
		String sql = "UPDATE `Staff` SET `hostManagerId`= ? WHERE `staffId` IN(?);";
		jdbctemplate.update(sql, new Object[]{managerId, staffIds.toArray()});
	}


	@Override
	public void bindStaffsToManager(Object[] staffIds, String managerId) {
		String sql = "UPDATE `Staff` SET `hostManagerId`= ? WHERE `staffId` IN(?);";
		jdbctemplate.update(sql, new Object[]{managerId, staffIds});
		
	}
	
	
	@Override
	public void unbindStaffFromManager(String staffId) {
		String sql = "UPDATE `Staff` SET `hostManagerId`= NULL WHERE `staffId` = ?;";
		jdbctemplate.update(sql, new Object[]{staffId});

	}

	@Override
	public void unbindStaffsFromManager(List<String> staffIds) {
		String sql = "UPDATE `Staff` SET `hostManagerId`= NULL WHERE `staffId` IN (?);";
		jdbctemplate.update(sql, new Object[]{staffIds.toArray()});

	}


	@Override
	public void unbindStaffsFromManager(Object[] staffIds) {
		String sql = "UPDATE `Staff` SET `hostManagerId`= NULL WHERE `staffId` IN (?);";
		jdbctemplate.update(sql, new Object[]{staffIds});
		
	}


}
