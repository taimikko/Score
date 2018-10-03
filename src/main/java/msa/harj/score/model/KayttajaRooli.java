package msa.harj.score.model;

public class KayttajaRooli {
	private Long id;
	private Long userId;
	private Long roleId;

	public KayttajaRooli() {

	}

	public KayttajaRooli(Long id, Long userId, Long roleId) {
		this.id = id;
		this.userId = userId;
		this.roleId = roleId;
	}

	public KayttajaRooli(Long userId, Long roleId) {
		this.id = 0L;
		this.userId = userId;
		this.roleId = roleId;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	@Override
	public String toString() {
		return Long.toString(this.id) + ":" + Long.toString(this.userId) + " " + Long.toString(this.roleId);
	}
}
