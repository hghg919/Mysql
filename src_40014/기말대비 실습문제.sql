## 1. DML 실습 문제 (ch7)
### 01. 고객 테이블에 새로운 레코드 삽입
INSERT INTO 고객 (고객번호, 담당자명, 고객회사명, 도시) 
VALUES ('ZZZAA', '한동욱', '자유트레이딩', '서울특별시');

### 02. 'ZZZAA' 고객의 레코드 컬럼 값 변경
UPDATE 고객 
SET 도시 = '부산광역시', 마일리지 = 100, 담당자직위 = '대표이사' 
WHERE 고객번호 = 'ZZZAA';

### 03. 'ZZZAA' 고객의 마일리지를 '대표이사' 직위의 평균 마일리지로 변경
UPDATE 고객 
SET 마일리지 = (
    SELECT avg_mileage 
    FROM (
        SELECT AVG(마일리지) AS avg_mileage 
        FROM 고객 
        WHERE 담당자직위 = '대표이사'
    ) AS temp
) 
WHERE 고객번호 = 'ZZZAA';


### 04. 사원번호 'E15' 레코드가 없으면 삽입, 있으면 수정 (UPSERT)
INSERT INTO 사원 (사원번호, 이름, 직위) 
VALUES ('E15', '이석진', '수습사원')
ON DUPLICATE KEY UPDATE 이름 = '이석진', 직위 = '수습사원';

### 05. 'ZZZAA' 고객 레코드 삭제
DELETE FROM 고객 
WHERE 고객번호 = 'ZZZAA';

### 06. 'E15' 사원 레코드 삭제
DELETE FROM 사원 
WHERE 사원번호 = 'E15';

-- 2. 테이블 생성 실습 문제 (ch8)
CREATE DATABASE 기말대비; -- '기말대비'라는 새로운 데이터베이스 생성
USE 기말대비;             -- 지금부터 이 데이터베이스를 사용하겠다고 선언

-- 01. 영화 테이블 생성 
CREATE TABLE 영화 (
    영화번호 CHAR(5) PRIMARY KEY,
    타이틀 VARCHAR(100) NOT NULL,
    장르 VARCHAR(20) CHECK (장르 IN ('코미디', '드라마', '다큐', 'SF', '액션', '역사', '기타')),
    배우 VARCHAR(100) NOT NULL,
    감독 VARCHAR(50) NOT NULL,
    제작사 VARCHAR(50) NOT NULL,
    개봉일 DATE,
    등록일 DATE DEFAULT (CURRENT_DATE)
);

-- 02. 평점관리 테이블 생성
CREATE TABLE 평점관리 (
    번호 INT AUTO_INCREMENT PRIMARY KEY,
    평가자닉네임 VARCHAR(50) NOT NULL,
    영화번호 CHAR(5) NOT NULL,
    평점 INT NOT NULL CHECK (평점 BETWEEN 1 AND 5),
    평가 VARCHAR(2000) NOT NULL,
    등록일 DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (영화번호) REFERENCES 영화(영화번호)
);

## 3. 뷰(View) 생성 및 조회 실습 문제 (ch9)
### 01. 주문금액합이 많은 상위 3명의 고객 정보를 보이는 뷰 작성 및 실행
-- 뷰 생성
CREATE OR REPLACE VIEW view_상위3고객 AS
SELECT c.고객번호, c.고객회사명, c.담당자명, 
       SUM(od.단가 * od.주문수량 * (1 - od.할인율)) AS 주문금액합
FROM 고객 c
JOIN 주문 o ON c.고객번호 = o.고객번호
JOIN 주문세부 od ON o.주문번호 = od.주문번호
GROUP BY c.고객번호, c.고객회사명, c.담당자명
ORDER BY 주문금액합 DESC
LIMIT 3;

-- 뷰 실행
SELECT * FROM view_상위3고객;

### 02. 제품명별로 주문수량합과 주문금액합을 보이는 뷰 생성
CREATE OR REPLACE VIEW view_제품명별주문요약 AS
SELECT p.제품명, 
       SUM(od.주문수량) AS 주문수량합, 
       SUM(od.단가 * od.주문수량 * (1 - od.할인율)) AS 주문금액합
FROM 제품 p
JOIN 주문세부 od ON p.제품번호 = od.제품번호
GROUP BY p.제품명;

### 03. 생성한 뷰에서 주문수량합이 1,000개 이상인 레코드 검색
SELECT * FROM view_제품명별주문요약 
WHERE 주문수량합 >= 1000;

### 04. '광역시'에 사는 고객 뷰 생성 (WITH CHECK OPTION 포함)
CREATE OR REPLACE VIEW view_광역시고객 AS
SELECT 고객회사명, 담당자명, 도시
FROM 고객
WHERE 도시 LIKE '%광역시'
WITH CHECK OPTION;