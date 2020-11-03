package bbs.util;

public class Paging {
	private int nowPage,//현재 페이지값 얻어온 cPage 넣는 곳
				
				blockList, //한 페이지에 표현할 게시물 수 
				blockPage, //한블럭당 표현할 페이지 수 
				
				totalPage, 	//총 페이지
				rowTotal,//총 게시물 수 
				
				startPage,	//시작 page
				endPage,
				begin,		//시작 게시물의 행번호 
				end;
	private boolean isPrePage; //전으로 이동 "이전" 기능 가능 여부
	private boolean isNextPage; //뒤로 이동 "다음"페이지 기능 가능 여부
	
	//jsp에서 출력하는 게 아니라 여기서 계산해서 html코드까지 담다가 jsp에 줬으면 한다
	//문자열 편집이 불가피하기 때문에 String buffer를 권장한다.
	private StringBuffer sb; //게터세터

	public Paging(int nowPage, int blockList, int blockPage, int rowTotal) {
		super(); //지워도 기본
		this.nowPage = nowPage;
		this.blockList = blockList;
		this.blockPage = blockPage;
		this.rowTotal = rowTotal;
		
		isPrePage = isNextPage = false; //둘다 초기화 가능
		
		//입력된 전체 게시물 수를 통해 전체 페이지 수를 구한다.
		/*
		if((rowTotal%blockList)!= 0 ) {
		totalPage = rowTotal / blockList + 1;
		}else{
		totalPage = rowTotal / blockList;
		}
		조금 수정하자*/
		
		/*
		totalPage = rowTotal / blockList;
		if((rowTotal%blockList)!= 0 )totalPage++;
		조금 수정하자*/
		
		totalPage = (int)Math.ceil((double)rowTotal/blockList);
		//올림시 오류가 날 수 있다, ceil은 double이 들어와야한다. 소수점이 안나오면 int가 되어버린다.
		//둘 중 하나를 그냥 double로 강제형 변환을 시키면 무조건 안전하게 더블로 들어간다. 이후 int캐스팅
		//반올림은 round floor은 내림 ceil은 올림
		
		//현재 페이지의 값이 전체 페이지의 값보다 크다면 전체 페이지 값을 현재 페이지 값으로 지정해줍니다.
		if(nowPage > totalPage){
			nowPage=totalPage;
		}//내가 3페이지에 있는 데 블록 페이지를 다음으로 누르면 +5로 8로 가고 현제 페이지가 총페이지수를 넘어간다.
		//다음시 현페이지를 start 페이지로 바꾸는 건 쉽다
		
		//현재 블록의 시작 페이지 값과 끝페이지 값을 구한다
		startPage = ((nowPage-1)/blockPage * blockPage +1);
		endPage = startPage + blockPage - 1 ;//유지 보수의 문제
		
		//끝 페이지의 값이 전체 페이지의 값보다 크면 끝페이지의 값을 전체 페이지의 값으로 지정하자
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		//==page 처리는 끝 , 현재 페이지 값에 의해 시작 게시물의 행번호와 끝 게시물의 행번호를 지정
		//현 페이지에 보여질 게시물 목록을 얻을 준비를 하자
		
		begin = (nowPage-1)*blockList + 1;
		end = begin + blockList - 1;
		
		//end 값은 총게시물 수를 벗어나면 안된다. 하지만 begin end만 지정해주면 바티스에서 정량만 준다
		
		//다음 기능과 이전 기능 가능 여부
		//		시작 페이지가 1이 아닐 때 가능하다
		
		if(startPage > 1) {
			isPrePage = true;
		}
		
		//다음 기능 여부 확인 end page가 total page보다 작을 때
		if(endPage<totalPage) {
			isNextPage = true;
		}
		
		//이제 현재 페이지 값도 알고 시작, 끝 페이지도 알았으니, 페이징 기법에 사용할 html 를 작성하여 String buffer에 저장하자
		sb = new StringBuffer("<ol class= 'paging'>");
		
		if(isPrePage) {
			//이전 기능 활성화, 무조건 컨트롤러로 이동한다
			sb.append("<li><a href='Controller?cPage=");
			sb.append(startPage - blockPage); //항상 옮겨갈때 시작페이지로 가는 코드
			//현 페이지가 6이라면 6빼기 5가 되니까 12345가 출력된다.
			sb.append("'>&lt;</a></li>"); //비활성화를 disable class에 선언
		}else {
			//이전 기능 비활성화
			sb.append("<li class = 'disable'>&lt;</li>"); //비활성화를 disable class에 선언
		}
		
		
		
		
		
		//그다음에 페이지 번호를 출력하는 반복문, 현재 페이지는 now라는 css 클래스를 적용한다
		for(int i=startPage; i<endPage; i++) {
			//i의 값이 현재 페이지와 같을 때를 구별하여 css 클래스를 적용
			if(i == nowPage) {
				sb.append("<li class = 'now'>");//pink 색으로 부각시켜주는 현제 페이지 now class
				sb.append(i);
				sb.append("</li>");
				
				//append 안에서 +로 해도되지만 i는 int이기에 문자열과 i라는 정수와 연산하기 위해
				//String으로 재연산한다. 한번 고치고 나면 안의 내용을 못쓰기에 여러번 넣는다. 메모리 낭비
				//위의 방법은 스트링 버퍼에 적재 후 toString 으로 연산을 마무리만 하면된다. 아니면 쓰는 의미없다
			}else {
				sb.append("<li><a href='Controller?cPage=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a></li>");
			}
		}//for의 끝 , 매개변수로 받은 게 아니면 그냥 멤버변수처럼 쓸 수 있다.
		
		
		
		
		
		
		
		
		//다음기능 가능여부 확인 , 위에거 가져와서 수정만 진행
		if(isNextPage) {
			//이전 기능 활성화, 무조건 컨트롤러로 이동한다
			sb.append("<li><a href='Controller?cPage=");
			sb.append(startPage+blockPage); //다음페이지라면 6페이지가 되야한다. 
			//시작에서 + 보여줄 페이지를 해야 1->6으로 넘어간다.
			sb.append("'>&gt;</a></li>"); //비활성화를 disable class에 선언
		}else {
			//이전 기능 비활성화
			sb.append("<li class = 'disable'>&gt;</li>"); //비활성화를 disable class에 선언
		}
		sb.append("</ol>");
		
		
		
		//생성자로 다 초기화도 시키고 sb에 html 코드도 모두 적재
		//listaction에서 paging 객체 생성을 해야 쓸 수 있고 모든 인자를 넘겨줘야한다. 총 게시물 수는 내가 구해야하낟.
		//rowtotal값을 bbs에서 카운트해서 받아오는 xml 추가하자.
		
	}



	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getBlockList() {
		return blockList;
	}

	public void setBlockList(int blockList) {
		this.blockList = blockList;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getRowTotal() {
		return rowTotal;
	}

	public void setRowTotal(int rowTotal) {
		this.rowTotal = rowTotal;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public boolean isPrePage() {
		return isPrePage;
	}

	public void setPrePage(boolean isPrePage) {
		this.isPrePage = isPrePage;
	}

	public boolean isNextPage() {
		return isNextPage;
	}

	public void setNextPage(boolean isNextPage) {
		this.isNextPage = isNextPage;
	}

	public StringBuffer getSb() {
		return sb;
	}

	public void setSb(StringBuffer sb) {
		this.sb = sb;
	}
	
	

}
