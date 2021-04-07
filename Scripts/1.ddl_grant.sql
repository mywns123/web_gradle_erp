select user(), database();

select user (), database ();

-- 내 스키마
DROP SCHEMA IF EXISTS web_gradle_erp;

-- 내 스키마
CREATE SCHEMA web_gradle_erp;

-- 직책
CREATE TABLE web_gradle_erp.title (
	titleNo   INT         NOT NULL COMMENT '직책코드', -- 직책코드
	titleName VARCHAR(20) NOT NULL COMMENT '직책명' -- 직책명
)
COMMENT '직책';

-- 직책
ALTER TABLE web_gradle_erp.title
	ADD CONSTRAINT PK_title -- 직책 기본키
		PRIMARY KEY (
			titleNo -- 직책코드
		);

-- 부서
CREATE TABLE web_gradle_erp.department (
	deptNO   INT         NOT NULL COMMENT '부서번호', -- 부서번호
	deptName VARCHAR(20) NOT NULL COMMENT '부서명', -- 부서명
	floor    INT         NULL     COMMENT '위치' -- 위치
)
COMMENT '부서';

-- 부서
ALTER TABLE web_gradle_erp.department
	ADD CONSTRAINT PK_department -- 부서 기본키
		PRIMARY KEY (
			deptNO -- 부서번호
		);

-- 사원
CREATE TABLE web_gradle_erp.employee (
	empNo   INT         NOT NULL COMMENT '사원번호', -- 사원번호
	empName VARCHAR(20) NOT NULL COMMENT '사원명', -- 사원명
	title   INT         NULL     COMMENT '직책', -- 직책
	manager INT         NULL     COMMENT '직속상사', -- 직속상사
	salary  INT         NULL     COMMENT '급여', -- 급여
	dept    INT         NULL     COMMENT '부서', -- 부서
	hiredate date 		NULL     COMMENT '입사일' -- 입사일
)
COMMENT '사원';

-- 사원
ALTER TABLE web_gradle_erp.employee
	ADD CONSTRAINT PK_employee -- 사원 기본키
		PRIMARY KEY (
			empNo -- 사원번호
		);

-- 사원
ALTER TABLE web_gradle_erp.employee
	ADD CONSTRAINT FK_title_TO_employee -- 직책 -> 사원
		FOREIGN KEY (
			title -- 직책
		)
		REFERENCES web_gradle_erp.title ( -- 직책
			titleNo -- 직책코드
		);

-- 사원
ALTER TABLE web_gradle_erp.employee
	ADD CONSTRAINT FK_employee_TO_employee -- 사원 -> 사원
		FOREIGN KEY (
			manager -- 직속상사
		)
		REFERENCES web_gradle_erp.employee ( -- 사원
			empNo -- 사원번호
		);

-- 사원
ALTER TABLE web_gradle_erp.employee
	ADD CONSTRAINT FK_department_TO_employee -- 부서 -> 사원
		FOREIGN KEY (
			dept -- 부서
		)
		REFERENCES web_gradle_erp.department ( -- 부서
			deptNO -- 부서번호
		);
		
-- 계정권한 부여
	grant all
	on web_gradle_erp.* 
	to 'user_gradle_erp'@'localhost' identified by 'rootroot';

-- file (backup, load)권한 --root만 권한 부여가능
	grant File
	on *.*
	to 'user_gradle_erp'@'localhost';
