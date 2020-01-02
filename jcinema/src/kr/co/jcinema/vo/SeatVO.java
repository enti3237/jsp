package kr.co.jcinema.vo;

public class SeatVO {
	
	private String seat_theater_no;
	private String seat_screen_no;
	private String seat_row;
	private String seat_column;
	private String ticket_is_valid;
	
	private String row_total;
	
	
	public String getRow_total() {
		return row_total;
	}
	public void setRow_total(String row_total) {
		this.row_total = row_total;
	}
	public String getSeat_theater_no() {
		return seat_theater_no;
	}
	public void setSeat_theater_no(String seat_theater_no) {
		this.seat_theater_no = seat_theater_no;
	}
	public String getSeat_screen_no() {
		return seat_screen_no;
	}
	public void setSeat_screen_no(String seat_screen_no) {
		this.seat_screen_no = seat_screen_no;
	}
	public String getSeat_row() {
		return seat_row;
	}
	public void setSeat_row(String seat_row) {
		this.seat_row = seat_row;
	}
	public String getSeat_column() {
		return seat_column;
	}
	public void setSeat_column(String seat_column) {
		this.seat_column = seat_column;
	}
	public String getTicket_is_valid() {
		return ticket_is_valid;
	}
	public void setTicket_is_valid(String ticket_is_valid) {
		this.ticket_is_valid = ticket_is_valid;
	}
	
}
