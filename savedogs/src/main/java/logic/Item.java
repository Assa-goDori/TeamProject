package logic;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Item {
	private int item_no;
	@NotEmpty(message ="상품명을 입력하세요")
	private String item_name;
	@Min(value = 10,message = "10원 이상 가능합니다")
	@Max(value = 100000,message = "100000원 이하만 가능합니다")
	private int item_price;
	
	@NotEmpty(message = "상품 설명을 입력하세요")
	@Size(min = 10, max = 1000 ,message = "10자이상 1000자 이하만 가능합니다.")
	private String item_content;
	private String item_picture;
	private MultipartFile picture ; //업로드 된 파일의 내용 저장
	private String item_code;
	private int item_state;
}
