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
		jdbctemplate.update(sql, new Object[] { managerId, staffId });
	}

	@Override
	public void bindStaffsToManager(Object[] staffIds, String managerId) {
		String sql = "UPDATE `Staff` SET `hostManagerId`= ? WHERE `staffId` "
				.concat(getDynamicINClauseStatement(staffIds));
		jdbctemplate.update(sql, new Object[] { managerId });

	}

	@Override
	public void unbindStaffFromManager(String staffId) {
		String sql = "UPDATE `Staff` SET `hostManagerId`= NULL WHERE `staffId` = ?;";
		jdbctemplate.update(sql, new Object[] { staffId });
	}

	@Override
	public void unbindStaffsFromManager(Object[] staffIds) {
		String sql = "UPDATE `Staff` SET `hostManagerId`= NULL WHERE `staffId` "
				+ getDynamicINClauseStatement(staffIds);
		jdbctemplate.update(sql);

	}

	public String getDynamicINClauseStatement(Object[] staffIds) {
		StringBuilder strBd = new StringBuilder("IN (");
		for (Object staffId : staffIds) {
			strBd.append("'");
			strBd.append(staffId);
			strBd.append("',");
		}
		strBd.setCharAt(strBd.length()-1, ' ');
		strBd.append(");");
		return strBd.toString();
	}

}
