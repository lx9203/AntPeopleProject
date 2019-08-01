# AntPeopleProject

### :calendar: EgovframeProject : AntPeople :ant:

---
### 프로젝트 기간 : 19. 07. 04 ~
### 프로젝트 제목 : AntPeople  

### 프로젝트 내용

- **직원 일정 관리:** 근무시간 신청(직원), 근무시간 확정(사장)
- **출,퇴근 관리:** 출,퇴근 기록 저장, 출,퇴근 기록에 따른 급여 정산


### 프로젝트 개발 환경

- 프레임워크 : Spring Tool Suite 3.9.9
- 서버 : Tomcat 8.0.46
- DB : MySQL
- 테스트 : JUnit

---
### 프로젝트 commit 내용

- **형식 :** "Day00 : 내용 (작성자)" 
- **ex) Day01 : ProjectPPT (권오인)**
- 한글로 작성해도 상관 없음
- 내용은 간략하게 ex) OOO DAO 추가 , web.xml file 삭제
- merge 관련 내용 commit은 "git merge"로 커밋

### 프로젝트 Readme file 작성법

- 자신이 추가, 삭제한 내용 적어 놓기
- **ex) (공통) PPT파일 작성**

### Day 01 : Project 기획 PPT (19.07.04) 
- (공통) 프로젝트 기획 PPT 발표

### Day 02 : Project 시작 파일 (19.07.08)
- (오인) project 시작 전 Maven, spring 설정 완료
- (오인) MySQL, MyBatis 연결 및 테스트 진행 (성공) // 수정 - 현재 MyBatis 사용하지 않음
- (정우) 일정등록 ui 기능 구성 시작 - fullcalendar api 사용

### Day 04 : 로그인 (19.07.10)
- (성현) login기능 (쿠키 DB연결 없음)
- (오인) XML -> @Configuration 설정 클래스 변환 시작
- (오인) MySQL, Hibernate 연결 및 단위 테스트 진행 (성공)
- (오인) AOP Logging 기능 구현 
- (성현) 로그인 JUnit Test

### Day 05 : 레이어 아키텍처 구성 & 로그인 (19.07.11)
- (오인) Spring Data JPA 및 Hibernate 설정
- (오인) Service 레이어, repository 레이어 구성
- (오인) Entity, DTO 클래스 구성
- (성현) 로그인 오류 수정중
- (정우) 일정등록 ui - 구간선택을 이용한 일정등록, 삭제기능 추가

### Day 06 : User Table Test & 로그인 (19.07.12)
- (오인) user Table 재구성 (user 테이블과 role 테이블로 나누어 테이블 연결)
- (오인) user Table을 이용한 CRUD Service 및 단위 Test (성공)
- (오인) BCryptPasswordEncoder Bean 등록 및 단위 Test (성공)
- (성현) 로그인 오류 수정 완료
- (정우) 일정등록 ui - 일정 정보 관리방식, 생성방식 변경

### Day 07 : VerifiedPassword Test (19.07.15)
- (오인) verifiedPassword 기능 추가 및 단위 Test (성공)
- (성현) verifiedPassword 기능 Controller에 연결
- (종환) 출퇴근 기능 작성  

### Day 08 : View update (19.07.16)
- (정우) view update : login, register, main page

### Day 09 : Web.xml -> WebInitializer.java 변경, xml 파일 제거 (19.07.17)
- (오인) xml파일 제거 및 java config파일로 변경, WebInitializer.java 파일 생성
- (정우) view update : common, staff, admin, pages 로 view 폴더구조 변경, 기본화면 업데이트
- (성현) Controller와 모든 Page연결

### Day 10 : Register 추가 (19.07.18)
- (성현) RequestMapping 경로 전체 정리
- (성현) Register 기능추가
- (오인) WebInitializer 설정 변경 (servlet-config 오류 수정)
- (오인) DB ER다이어그램 추가 (user, store, role, bbs, todo)

### Day 11 : View 추가, View Folder 개편 Controller 연결  (19.07.19)
- (정우) view update : notice, board, article, write등 페이지 추가, 폴더구조 변경, 업데이트
- (성현) controller : Controller 개편에 맞춰 URL 정리, Register기능 
- (오인) 회원가입 기능 추가, 로그인 화면 연결

### Day 12 : bbs DB구축 및 CRUD 테스트 (19.07.22)
- (오인) bbs(게시판) DB구축 및 CRUD 테스트
- (오인) 메인 페이지, 로그인, 회원가입, 게시판 Controller 연결
- (종환) 출퇴근 기능 수정  
- (성현) 직원 정보보기 기능 수정

### Day 13 : View 수정 (19.07.23)
- (정우) view update : login, register ajax script 추가.
- (성현) WebFlow 시각화 작성

### Day 14 : WebFlow (19.07.24)  
- (성현) WebFlow 시각화 완료

### Day 15 : notice, bbs 서비스 (19.07.25) 
- (오인) notice DB, Repository, Entity 구성
- (오인) bbs, notice 화면 연동
- (정우) 일정등록 ui - planning.jsp, ant_fullcalendar1.0.2.js 업데이트
- (성현) bbs, notice 컨트롤 작성  

### Day 16 : schedule 서비스 (19.07.26)
- (오인) schedule DB, Repository, Entity 구성
- (성현) bbs, notice 컨트롤 작성  

### Day 17 : mainpage, notice, bbs (19.07.29)
- (오인) mainpage 공지사항, 자유게시판 리스트 control
- (성현) notice, bbs Controll 완료  

### Day 18 : Schedule (19.07.30)
- (오인) Schedule Object 만들기 (화면출력)
- (오인) Schedule Object insert (DB 저장)
- (정우) 일정등록 ui - monthplanpage.jsp (planner main page) 업데이트
- (오인) Schedule Object 월별 리스트 Select
- (성현) Schedule Controller 연결

### Day 19 : Schedule Service (10.07.31)
- (오인) Schedule Service 구성
- (성현) Schedule - Controller간 오류수정
