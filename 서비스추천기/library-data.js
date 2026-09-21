// 아주대학교 중앙도서관 공개 안내 확인: 2026-09-09.
// 추천 태그는 이 앱의 분류이며, 서비스 제공 조건은 각 공식 안내를 따릅니다.
const libraryServices = [
  {
    title: '소장자료 검색', tags: ['assignment', 'first'],
    desc: '아주대학교 중앙도서관에 있는 책을 검색하고, 자료의 위치와 대출 가능 여부를 확인하세요.',
    steps: ['공식 소장자료 검색 화면에서 서명·저자·키워드를 입력하세요.', '검색 결과에서 원하는 자료를 선택하고 소장 위치와 대출 상태를 확인하세요.'],
    prepare: '찾으려는 책의 제목이나 저자, 주제어를 검색에 활용하세요.',
    sourceTitle: '소장자료 검색', url: 'https://library.ajou.ac.kr/search/all-collections'
  },
  {
    title: '전자저널·DB·매거진·신문', tags: ['assignment', 'research'],
    desc: '도서관의 전자자료 목록에서 과제와 연구에 필요한 학술정보원을 찾아보세요.',
    steps: ['자료검색 → 전자자료 → 전자저널·DB·매거진·신문으로 이동하세요.', '이용하려는 자료를 검색하거나 목록에서 선택하고 해당 서비스의 안내를 확인하세요.', '교외에서 이용한다면 도서관 홈페이지에 로그인한 뒤 전자자료 링크로 접속하세요.'],
    prepare: '교외접속 대상은 교원·직원·재학생과 별도 신청한 휴학생·수료생입니다. 졸업생·일반인은 전자저널/학술DB를 이용할 수 없습니다.',
    sourceTitle: '전자자료 목록', url: 'https://library.ajou.ac.kr/search/database',
    extraSource: { title: '교외접속 대상·방법', url: 'https://library.ajou.ac.kr/search/proxy' }
  },
  {
    title: '원문복사 서비스', tags: ['assignment', 'research'],
    desc: '우리 도서관에 없는 논문 등의 복사본을 협력기관에 의뢰하는 서비스입니다. 일반적으로 인쇄물로 받습니다.',
    steps: ['아주대학교 도서관의 소장·구독 여부를 먼저 확인하세요.', '원문복사 안내에서 신청 경로로 이동하고 의뢰 범위와 비용을 확인한 뒤 신청하세요.', '신청현황 또는 이메일로 도착·비용을 확인하고 도서관 1층 서비스 데스크에서 수령하세요.'],
    prepare: '대상: 본교 구성원(의료원 제외). 해외기관 포함 신청은 국내 미소장 시 별도 진행 연락 없이 해외에 의뢰됩니다. 비용과 지원금 잔액을 먼저 확인하세요. OA 원문은 PDF로 제공될 수 있습니다.',
    sourceTitle: '원문복사 대상·신청·수령 안내', url: 'https://library.ajou.ac.kr/service/dds'
  },
  {
    title: '상호대차 서비스', tags: ['assignment', 'research'],
    desc: '아주대학교 도서관에 없는 단행본을 다른 협력 도서관에서 빌려 이용할 수 있습니다.',
    steps: ['본교에 소장된 책인지 먼저 검색하세요.', '공식 상호대차 안내에서 비용과 조건을 확인하고 신청하세요.', '도착 안내를 확인한 뒤 1층 서비스 데스크에서 수령하세요.'],
    prepare: '대상: 본교 구성원(의료원 제외). 대출기간은 도서관 도착일부터 14일이며, 도착 후 1주일 내 미수령 시 반송됩니다. 국외에서 빌린 책은 도서관 밖으로 대출할 수 없습니다.',
    sourceTitle: '상호대차 대상·신청·유의사항', url: 'https://library.ajou.ac.kr/service/ill'
  },
  {
    title: 'Citeasy 서지관리', tags: ['research'],
    desc: '논문과 보고서에 인용한 자료 정보를 관리하고 출처와 참고문헌을 작성하는 도구입니다.',
    steps: ['연구학습지원 → 논문 작성법 → 서지관리 : Citeasy 안내를 여세요.', 'DBpia 회원가입 후 안내 페이지의 Citeasy 이동 링크를 이용하세요.', '공식 안내에 첨부된 이용 매뉴얼을 참고하세요.'],
    prepare: 'DBpia 회원가입 후 이용 가능합니다. 2026년에 도입된 도구이며, 종료된 RefWorks는 추천에서 제외했습니다.',
    sourceTitle: '서지관리 : Citeasy', url: 'https://library.ajou.ac.kr/research/writing/citeasy'
  },
  {
    title: '카피킬러 표절검사', tags: ['assignment', 'research'],
    desc: '과제나 논문을 점검할 수 있는 카피킬러를 도서관의 공식 접속 경로로 이용하세요.',
    steps: ['아주대학교 중앙도서관 홈페이지에 로그인하세요.', '연구학습지원 → 논문 작성법 → 표절검사도구 안내를 여세요.', 'Copy Killer 바로가기를 선택해 서비스에 접속하세요.'],
    prepare: '도서관 홈페이지 로그인이 필수입니다. 검사에 관한 세부 설정과 사용법은 연결된 공식 서비스에서 확인하세요.',
    sourceTitle: '표절검사도구 이용 안내', url: 'https://library.ajou.ac.kr/research/writing/copy'
  },
  {
    title: '좌석·공간 이용신청/현황', tags: ['space'],
    desc: '공식 홈페이지의 좌석·공간 현황에서 학습 공간을 살펴보고 이용신청 메뉴로 이동하세요.',
    steps: ['도서관 서비스 → 시설이용 → 좌석 이용신청/현황 또는 공간 이용신청/현황을 여세요.', '이용하려는 좌석·공간을 선택하고 해당 화면의 이용 조건을 확인하세요.', '도서관 모바일앱에서도 좌석·시설 예약 기능을 이용할 수 있습니다. 스터디 라운지는 임시배정·NFC 배정 확정 안내를 따르세요.'],
    prepare: '이 앱에는 실시간 잔여석과 예약 가능 시간을 표시하지 않습니다. 실제 신청 화면에서 확인하세요.',
    sourceTitle: '좌석 이용신청/현황', url: 'https://library.ajou.ac.kr/service/facility/seat',
    extraSource: { title: '공간 이용신청/현황', url: 'https://library.ajou.ac.kr/service/facility/room' },
    moreSources: [{ title: '모바일앱 좌석·시설 이용 안내', url: 'https://library.ajou.ac.kr/service/facility/m-pass' }]
  },
  {
    title: '전자책 검색·이용', tags: ['remote', 'rest'],
    desc: '전자책 브라우징과 플랫폼 목록에서 읽고 싶은 전자책을 찾아보세요.',
    steps: ['자료검색 → 전자자료 → 전자책으로 이동하세요.', '전자책 브라우징에서 제목을 검색하거나 전자책 플랫폼 목록을 살펴보세요.', '자료의 온라인 이용가능 표시와 연결 URL을 확인하고 해당 플랫폼의 이용 안내를 따르세요.'],
    prepare: '대출 권수·기간과 플랫폼별 로그인 조건은 이 앱에서 일괄 안내하지 않습니다. 해당 전자책 서비스에서 확인하세요.',
    sourceTitle: '전자책 브라우징·플랫폼 목록', url: 'https://library.ajou.ac.kr/search/ebook-collection/brwose'
  },
  {
    title: '교외접속 서비스', tags: ['remote'],
    desc: '학교 밖에서도 도서관 전자저널과 데이터베이스에 접속할 수 있습니다. 이용자 신분에 따른 조건을 확인하세요.',
    steps: ['공식 교외접속 가이드에서 본인의 이용 자격을 확인하세요.', '아주대학교 중앙도서관 홈페이지에 로그인하세요.', '도서관의 전자정보 배너·링크를 눌러 제공 사이트에 접속하세요.'],
    prepare: '교원·직원·재학생이 대상입니다. 휴학생·수료생은 별도 신청 시 이용할 수 있습니다. 졸업생·일반인은 교외접속 및 전자저널/학술DB 이용이 불가합니다.',
    sourceTitle: '교외접속 가이드', url: 'https://library.ajou.ac.kr/search/proxy'
  },
  {
    title: '자료 대출·반납·예약', tags: ['first', 'rest'],
    desc: '학생증 또는 모바일 학생증으로 책을 빌리고, 대출 중인 책의 예약과 연장 조건을 확인하세요.',
    steps: ['소장자료 검색으로 책의 위치와 대출 상태를 확인하세요.', '자료실 1층 서비스 데스크 또는 자료실 각 층의 자가대출반납기에서 대출하세요.', '나의 도서관에서 반납예정일을 확인하세요. 연장·예약은 공식 안내의 조건을 따릅니다.'],
    prepare: '학부 재학생은 15책·14일, 대학원 재학생은 30책·30일입니다. 신간도서·북큐레이션은 신분과 관계없이 14일이며 연장이 불가합니다. 다른 신분과 자료 유형의 조건은 공식 표를 확인하세요.',
    sourceTitle: '자료 대출/반납/예약 안내', url: 'https://library.ajou.ac.kr/service/borrow'
  },
  {
    title: '도서관 이용교육', tags: ['first', 'assignment', 'research'],
    desc: '자료검색, 도서관 시설·서비스, 구독 전자자료 활용을 배우는 정규교육을 찾아보세요.',
    steps: ['연구학습지원 → 이용교육 → 교육신청에서 일정을 확인하세요.', '원하는 교육명을 선택해 교육 내용과 신청 상태를 확인하세요.', '해당 교육의 신청버튼 또는 상세 안내에 명시된 신청폼으로 신청하세요.'],
    prepare: '교육별 신청 방법을 확인하세요. 맞춤교육은 최소 5명 이상, 희망일 2주 전까지 신청하며 담당자의 승인 후 확정됩니다.',
    sourceTitle: '교육안내', url: 'https://library.ajou.ac.kr/research/edu-req/edu-info',
    extraSource: { title: '교육신청 일정 보기', url: 'https://library.ajou.ac.kr/research/edu-req/regular' }
  },
  {
    title: '북큐레이션·전공진로 추천도서', tags: ['rest'],
    desc: '공식 컬렉션에서 북큐레이션과 전공진로 추천도서를 살펴보며 다음에 읽을 책을 골라보세요.',
    steps: ['자료검색 → 컬렉션에서 북큐레이션 또는 전공진로 추천도서를 선택하세요.', '관심 있는 컬렉션과 도서를 확인하세요.', '읽고 싶은 자료의 소장 상태와 이용 가능 여부를 확인하세요.'],
    prepare: '컬렉션은 읽을 책을 고르는 안내입니다. 도서별 대출 가능 여부는 실제 자료 조회 화면에서 확인하세요.',
    sourceTitle: '북큐레이션', url: 'https://library.ajou.ac.kr/search/curation',
    extraSource: { title: '전공진로 추천도서', url: 'https://library.ajou.ac.kr/search/recommend' }
  }
];
