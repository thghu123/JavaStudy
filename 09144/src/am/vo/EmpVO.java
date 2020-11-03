package am.vo;

/**
 * @author g
 *
 */
public class EmpVO {

	//empno, ename, job
	
	private String empno,ename,job; //string으로 못 가져오는 데이터 없음

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}
	
	public String printAll() {
		return "<tr><td>"+String.join("</td><td>", empno,ename,job)+"</td></tr>";
		//empno, ename, job 사이에사이에 " " 을 넣어준다.
	}
	
	
	
}
