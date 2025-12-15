WITH UserCounts AS (
    SELECT 
        u.name,
        COUNT(*) AS cnt,
        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC, u.name ASC) AS rn
    FROM Users u
    JOIN MovieRating mr ON u.user_id = mr.user_id
    GROUP BY u.name
),
MovieAvg AS (
    SELECT
        m.title,
        AVG(CAST(mr.rating AS FLOAT)) AS avg_rating,
        ROW_NUMBER() OVER (
            ORDER BY AVG(CAST(mr.rating AS FLOAT)) DESC, m.title ASC
        ) AS rn
    FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE mr.created_at >= '2020-02-01' AND mr.created_at < '2020-03-01'
    GROUP BY m.title
)
SELECT name AS results
FROM UserCounts
WHERE rn = 1

UNION ALL

SELECT title AS results
FROM MovieAvg
WHERE rn = 1;
