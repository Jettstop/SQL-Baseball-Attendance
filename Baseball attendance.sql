-- I imported this table from Kraggle. I am looking at season 2010-2015.
-- I am seeing if there is anything that drives attendance besides wins and losses. 
-- I am a huge baseball fan. I played my entire life. I really think offensive numbers drive attendance.
-- If that does turn out to be true it should lead teams to build more hitter friendly ball parks

-- First lets see if the data came over right

SELECT 
	*
FROM 
	mlb_teams.baseball;

-- lets see the offensive numbers

SELECT 
	Team, R, AB, H, 2B, 3B, HR, BB
FROM 
	mlb_teams.baseball;

-- Looking at each teams best year of attendance 

SELECT 
	team, year, MAX(attendance) AS Attendance
FROM 
	mlb_teams.baseball
GROUP BY team
ORDER BY MAX(attendance) DESC;

-- Looking at the average attendanec by team

SELECT 
	team, AVG(attendance) AS Attendance
FROM 
	mlb_teams.baseball
GROUP BY team
ORDER BY AVG(attendance) DESC;

-- looking at the worst year of attendance 

SELECT 
	team, MIN(attendance) AS Attendance
FROM 
	mlb_teams.baseball
GROUP BY team
ORDER BY MIN(attendance);

-- Looking at each teams avg city population and avg attendance. Ordered by attendance to show that populatino doesnt matter

SELECT 
	team, ROUND(AVG(population) ,2) AS population, ROUND(AVG(attendance),2) AS attendance
FROM 
	mlb_teams.baseball
ORDER BY population DESC;

-- Seeing attendance on winning teams(0ver 80 wins), some good teams have awful attendance here.
-- I ordered it by least attendance
SELECT 
	team, w, year, attendance
FROM 
	mlb_teams.baseball
WHERE w > 80
GROUP BY team
ORDER BY attendance;

-- Seeing attendance on losing teams, 

SELECT 
	team, w, year, attendance
FROM 
	mlb_teams.baseball
WHERE w < 80
ORDER BY attendance DESC;

-- THis is a work in progress. i plan on uploading as i go along. 
-- as of 6/24/2022 I found the data, asked a questioned that the data may answer, cleaned the data, and started analyzing the data



