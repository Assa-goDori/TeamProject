package logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDao;

@Service
public class DogService {
	@Autowired
	private MemberDao memberDao;

	public void memberInsert(Member mem) {
		memberDao.memberInsert(mem);
	}

	public Member getMember(String member_id) {
		return memberDao.getMember(member_id);
	}
}