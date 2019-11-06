package sub1;

// 라이브러리 클래스
// 멤버변수는 private(캡슐화=참조불가). 생성자는 public 클래스명으로 선언. 기능은 public(참조자유).
public class Account {

	// 특성 (멤버변수) - 명사로 네이밍하는 게 보통
	public String bank;
	public String id;
	public String name;
	public int money; // 잔액
	// 클래스의 멤버변수는 반드시 캡슐화(private) 해야함. 객체에서 참조하지 않도록.

	// 생성자 - 객체생성할 때 멤버변수를 초기화하는 메서드. 클래스명으로 선언한다
	// 이게 없으면 프라이빗으로 캡슐화된 변수를 객체가 초기화 할 수 없다
	public Account(String bank, String id, String name, int money) {
		this.bank = bank;
		this.id = id;
		this.name = name;
		this.money = money;
	}

	// 기능 (멤버메서드) - 동사로 네이밍하는 게 보통
	public void deposit(int money) {
		this.money += money;
	} // 잔액은 잔액+신규입금액이므로 기존 잔액을 이 클래스의 변수란 의미로 this.로 지정해준다

	public void withdraw(int money) {
		this.money -= money;
	} // 출금시 잔액
}
