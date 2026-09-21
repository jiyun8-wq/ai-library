# 아주대학교 중앙도서관 서비스 확인 기록

확인일: 2026-09-09. 공개 홈페이지와 홈페이지가 불러오는 공개 안내 본문을 확인했습니다. 로그인, 신청, 예약은 수행하지 않았습니다.

## 추천에 반영한 공식 출처

| 서비스 | 공식 안내 | 확인 내용 |
| --- | --- | --- |
| 소장자료 | https://library.ajou.ac.kr/search/all-collections | 검색, 소장 상태 |
| 전자자료 | https://library.ajou.ac.kr/search/database | 공식 전자자료 메뉴 |
| 원문복사 | https://library.ajou.ac.kr/service/dds | 대상, 신청, 수령, 해외의뢰, 인쇄물 제공 |
| 상호대차 | https://library.ajou.ac.kr/service/ill | 대상, 신청, 수령, 대출기간, 국외자료 제한 |
| Citeasy | https://library.ajou.ac.kr/research/writing/citeasy | 서지관리 기능, DBpia 회원가입, 매뉴얼 |
| 카피킬러 | https://library.ajou.ac.kr/research/writing/copy | 제공 여부, 로그인 필수, 공식 바로가기 |
| 좌석·공간 | https://library.ajou.ac.kr/service/facility/seat 및 https://library.ajou.ac.kr/service/facility/room | 공식 이용신청/현황 메뉴 |
| 모바일 시설 이용 | https://library.ajou.ac.kr/service/facility/m-pass | 앱의 좌석·시설 예약, 임시배정·NFC 확정 |
| 전자책 | https://library.ajou.ac.kr/search/ebook-collection/brwose | 브라우징, 플랫폼 목록, 온라인 이용 표시 |
| 교외접속 | https://library.ajou.ac.kr/search/proxy | 이용 대상, 제외 대상, 로그인 후 전자자료 링크 이용 |
| 대출·반납·예약 | https://library.ajou.ac.kr/service/borrow | 학생증, 대출 장소, 신분별 조건, 신간·북큐레이션 예외 |
| 이용교육 | https://library.ajou.ac.kr/research/edu-req/edu-info | 정규교육 신청, 맞춤교육 조건 |
| 교육 일정 | https://library.ajou.ac.kr/research/edu-req/regular | 공식 교육신청 메뉴 |
| 컬렉션 | https://library.ajou.ac.kr/search/curation 및 https://library.ajou.ac.kr/search/recommend | 북큐레이션·전공진로 추천도서 메뉴 |
| 문의 | https://library.ajou.ac.kr/guide/bulletins/faq 및 https://library.ajou.ac.kr/guide/bulletins/contact | 실제 FAQ·문의 및 건의, 서비스별 연락처 |

## 확인 방식과 적용 범위

일부 페이지는 JavaScript로 본문을 표시하여 웹 검색 도구에서 본문이 비어 있었습니다. 홈페이지가 공개적으로 제공하는 메뉴 설정과 아래 공개 안내 API를 통해 본문을 확인했습니다. 실제 메뉴에서 확인한 주소만 사용했습니다.

공개 안내 API: `https://library.ajou.ac.kr/pyxis-api/1/static-pages/{code}`

- `SERVICE-DDS`, `SERVICE-ILL`, `SERVICE-BORROW`
- `RESEARCH-THESIS-CITEASY`, `SEARCH-PROXY`, `SEARCH-PROXY2`
- `RESEARCH-EDUCATION-GUIDE`, `SERVICE-MOBILE`
- `SERVICE-REQUEST-BOOK`도 확인했으나 이번 추천 목록에는 추가하지 않았습니다.

좌석·공간의 세부 예약 한도, 실시간 잔여석, 플랫폼별 전자책 대출 조건은 확인된 범위 밖이므로 수치를 넣지 않았습니다. 공통 학생증 요구를 모든 서비스에 적용하지 않았으며, 대상 제한은 서비스별로 표시했습니다.

기존의 일반 사서 상담, 오디오북, 포괄적인 독서 문화 프로그램 문구를 제거했습니다. 2026-03-31 종료 공지가 있는 RefWorks는 추천하지 않습니다. 아주북통은 실제 운영되지만 확인 당시 모집 마감 공지가 있어 현재 신청 가능한 프로그램으로 추천하지 않았습니다. 정규교육도 특정 강좌가 현재 접수 중이라고 단정하지 않습니다.

상황별 연결과 정렬은 이 앱에서 설정한 태그 일치 개수에 따른 추천입니다. 학교가 제공한 추천 순위가 아닙니다. 실시간 동기화 기능은 없으며, 향후 정책 변경 시 `library-data.js`와 확인일을 함께 갱신해야 합니다.
