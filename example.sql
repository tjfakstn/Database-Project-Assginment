-- ✅ 크루 탐색 (지역 기반)
SELECT * 
FROM "Crew"
WHERE region = '서울특별시 강남구';

-- ✅ 크루 생성
INSERT INTO "Crew" (name, description, region, created_by)
VALUES ('한강 러닝크루', '야경 러닝 좋아하는 사람들 모임', '서울특별시 용산구', 1);

-- ✅ 크루 참여
INSERT INTO "CrewMember" (crew_id, user_id)
VALUES (2, 3);

-- ✅ 크루 리뷰 작성
INSERT INTO "Review" (user_id, crew_id, rating, comment)
VALUES (3, 2, 5, '분위기 좋고 함께 뛰기 좋아요!');

-- ✅ 인증글 / 코스추천 게시글 작성
INSERT INTO "Post" (user_id, type, title, content, image_url)
VALUES (3, '인증글', '한강 5km 완주!', '너무 상쾌했다', 'https://example.com/run.jpg');

-- ✅ 게시글 목록 조회 (타입별)
SELECT * 
FROM "Post"
WHERE type = '코스추천'
ORDER BY created_at DESC;




-- ✅ 게시글 좋아요 누르기
INSERT INTO "PostLike" (user_id, post_id)
VALUES (3, 12);

-- ✅ 게시글 좋아요 수 조회
SELECT COUNT(*) 
FROM "PostLike"
WHERE post_id = 12;

-- ✅ 사용자 러닝 기록 등록
INSERT INTO "UserRunLog" (user_id, date, distance_km, duration_min, pace)
VALUES (3, CURRENT_DATE, 5.0, 28, 5.6);

-- ✅ 크루 러닝 기록 등록
INSERT INTO "CrewRunLog" 
(crew_id, date, title, distance_km, duartion_min, avg_pace, photo_url, 
notes, created_by)
VALUES 
(2, CURRENT_DATE, '주말 10km 러닝', 10.0, 55, 5.5,
 'https://example.com/photo.jpg', '참석 8명', 1);

-- ✅ 공공 체육행사 목록 보기
SELECT * 
FROM "SportsEvent"
WHERE date >= CURRENT_DATE
ORDER BY date ASC;





-- ✅ 체육행사 참여 기록 남기기
INSERT INTO "SportsEventLog" (event_id, user_id, feedback, ranking)
VALUES (5, 3, '완주했습니다! 너무 재밌었어요', 41);

-- ✅ 유저가 참여한 크루 목록
SELECT C.*
FROM "Crew" C
JOIN "CrewMember" CM ON C.crew_id = CM.crew_id
WHERE CM.user_id = 3;

-- ✅ 유저가 참여한 체육행사 목록
SELECT SE.title, SE.date, SL.feedback
FROM "SportsEventLog" SL
JOIN "SportsEvent" SE ON SL.event_id = SE.event_id
WHERE SL.user_id = 3;
-- ✅ 크루 탐색 (지역 기반)
SELECT * 
FROM "Crew"
WHERE region = '서울특별시 강남구';

-- ✅ 크루 생성
INSERT INTO "Crew" (name, description, region, created_by)
VALUES ('한강 러닝크루', '야경 러닝 좋아하는 사람들 모임', '서울특별시 용산구', 1);

-- ✅ 크루 참여
INSERT INTO "CrewMember" (crew_id, user_id)
VALUES (2, 3);

-- ✅ 크루 리뷰 작성
INSERT INTO "Review" (user_id, crew_id, rating, comment)
VALUES (3, 2, 5, '분위기 좋고 함께 뛰기 좋아요!');

-- ✅ 인증글 / 코스추천 게시글 작성
INSERT INTO "Post" (user_id, type, title, content, image_url)
VALUES (3, '인증글', '한강 5km 완주!', '너무 상쾌했다', 'https://example.com/run.jpg');

-- ✅ 게시글 목록 조회 (타입별)
SELECT * 
FROM "Post"
WHERE type = '코스추천'
ORDER BY created_at DESC;

-- ✅ 게시글 좋아요 누르기
INSERT INTO "PostLike" (user_id, post_id)
VALUES (3, 12);

-- ✅ 게시글 좋아요 수 조회
SELECT COUNT(*) 
FROM "PostLike"
WHERE post_id = 12;

-- ✅ 사용자 러닝 기록 등록
INSERT INTO "UserRunLog" (user_id, date, distance_km, duration_min, pace)
VALUES (3, CURRENT_DATE, 5.0, 28, 5.6);



-- ✅ 크루 러닝 기록 등록
INSERT INTO "CrewRunLog" 
(crew_id, date, title, distance_km, duartion_min, avg_pace, photo_url, notes, created_by)
VALUES 
(2, CURRENT_DATE, '주말 10km 러닝', 10.0, 55, 5.5, 'https://example.com/photo.jpg', '참석 8명', 1);

-- ✅ 공공 체육행사 목록 보기
SELECT * 
FROM "SportsEvent"
WHERE date >= CURRENT_DATE
ORDER BY date ASC;

-- ✅ 체육행사 참여 기록 남기기
INSERT INTO "SportsEventLog" (event_id, user_id, feedback, ranking)
VALUES (5, 3, '완주했습니다! 너무 재밌었어요', 41);

-- ✅ 유저가 참여한 크루 목록
SELECT C.*
FROM "Crew" C
JOIN "CrewMember" CM ON C.crew_id = CM.crew_id
WHERE CM.user_id = 3;

-- ✅ 유저가 참여한 체육행사 목록
SELECT SE.title, SE.date, SL.feedback
FROM "SportsEventLog" SL
JOIN "SportsEvent" SE ON SL.event_id = SE.event_id
WHERE SL.user_id = 3;
