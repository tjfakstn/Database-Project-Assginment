-- ENUM 타입 정의
CREATE TYPE post_type AS ENUM ('인증글', '코스추천');

-- 사용자
CREATE TABLE "User" (
  user_id SERIAL PRIMARY KEY,
  nickname VARCHAR(30),
  region VARCHAR(50)
);

-- 크루
CREATE TABLE "Crew" (
  crew_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  description TEXT,
  region VARCHAR(50),
  created_by INT REFERENCES "User"(user_id)
);

-- 리뷰
CREATE TABLE "Review" (
  review_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES "User"(user_id),
  crew_id INT REFERENCES "Crew"(crew_id),
  rating INT,
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 크루 멤버
CREATE TABLE "CrewMember" (
  crew_id INT REFERENCES "Crew"(crew_id),
  user_id INT REFERENCES "User"(user_id),
  join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (crew_id, user_id)
);

-- 게시글
CREATE TABLE "Post" (
  post_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES "User"(user_id),
  type post_type,
  title VARCHAR(100),
  content TEXT,
  image_url TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 사용자 러닝 기록
CREATE TABLE "UserRunLog" (
  user_log_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES "User"(user_id),
  date DATE,
  distance_km FLOAT,
  duration_min INT,
  pace FLOAT
);

-- 크루 러닝 기록
CREATE TABLE "CrewRunLog" (
  crew_log_id SERIAL PRIMARY KEY,
  crew_id INT REFERENCES "Crew"(crew_id),
  date DATE,
  title VARCHAR(100),
  distance_km FLOAT,
  duartion_min INT,
  avg_pace FLOAT,
  photo_url TEXT,
  notes TEXT,
  created_by INT REFERENCES "User"(user_id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 체육 행사
CREATE TABLE "SportsEvent" (
  event_id SERIAL PRIMARY KEY,
  title VARCHAR(100),
  host VARCHAR(100),
  location VARCHAR(100),
  date DATE,
  apply_url TEXT,
  description TEXT,
  region VARCHAR(50)
);

-- 체육 행사 참여 기록
CREATE TABLE "SportsEventLog" (
  event_log_id SERIAL PRIMARY KEY,
  event_id INT REFERENCES "SportsEvent"(event_id),
  user_id INT REFERENCES "User"(user_id),
  joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  feedback TEXT,
  ranking INT
);

-- 게시글 좋아요
CREATE TABLE "PostLike" (
  post_like_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES "User"(user_id),
  post_id INT REFERENCES "Post"(post_id),
  liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
