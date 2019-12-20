package kr.co.jcinema.admin.vo;

public class MovieScheduleVO {
	
	private String schedule_theater_no;
	private String schedule_screen_no;
	private String schedule_movie_no;
	private String schedule_date;
	private String schedule_start_time;
	private String schedule_end_time;
	private String schedule_round_view;
	
	private String movie_title;
	
	public String getMovie_title() {
		return movie_title;
	}
	
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	
	public String getSchedule_theater_no() {
		return schedule_theater_no;
	}
	public void setSchedule_theater_no(String schedule_theater_no) {
		this.schedule_theater_no = schedule_theater_no;
	}
	public String getSchedule_screen_no() {
		return schedule_screen_no;
	}
	public void setSchedule_screen_no(String schedule_screen_no) {
		this.schedule_screen_no = schedule_screen_no;
	}
	public String getSchedule_movie_no() {
		return schedule_movie_no;
	}
	public void setSchedule_movie_no(String schedule_movie_no) {
		this.schedule_movie_no = schedule_movie_no;
	}
	public String getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}
	public String getSchedule_start_time() {
		return schedule_start_time;
	}
	public void setSchedule_start_time(String schedule_start_time) {
		this.schedule_start_time = schedule_start_time;
	}
	public String getSchedule_end_time() {
		return schedule_end_time;
	}
	public void setSchedule_end_time(String schedule_end_time) {
		this.schedule_end_time = schedule_end_time;
	}
	public String getSchedule_round_view() {
		return schedule_round_view;
	}
	public void setSchedule_round_view(String schedule_round_view) {
		this.schedule_round_view = schedule_round_view;
	}
	
	

}
