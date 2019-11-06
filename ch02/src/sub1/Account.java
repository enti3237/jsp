package sub1;

// ���̺귯�� Ŭ����
// ��������� private(ĸ��ȭ=�����Ұ�). �����ڴ� public Ŭ���������� ����. ����� public(��������).
public class Account {

	// Ư�� (�������) - ���� ���̹��ϴ� �� ����
	public String bank;
	public String id;
	public String name;
	public int money; // �ܾ�
	// Ŭ������ ��������� �ݵ�� ĸ��ȭ(private) �ؾ���. ��ü���� �������� �ʵ���.

	// ������ - ��ü������ �� ��������� �ʱ�ȭ�ϴ� �޼���. Ŭ���������� �����Ѵ�
	// �̰� ������ �����̺����� ĸ��ȭ�� ������ ��ü�� �ʱ�ȭ �� �� ����
	public Account(String bank, String id, String name, int money) {
		this.bank = bank;
		this.id = id;
		this.name = name;
		this.money = money;
	}

	// ��� (����޼���) - ����� ���̹��ϴ� �� ����
	public void deposit(int money) {
		this.money += money;
	} // �ܾ��� �ܾ�+�ű��Աݾ��̹Ƿ� ���� �ܾ��� �� Ŭ������ ������ �ǹ̷� this.�� �������ش�

	public void withdraw(int money) {
		this.money -= money;
	} // ��ݽ� �ܾ�
}
