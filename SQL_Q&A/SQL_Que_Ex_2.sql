/*
Vistara is commencing Flights In India and has data below
The provided data represents a list of distances between various cities or points, denoted as Point A and Point B. 
Each entry consists of three columns: Point A, Point between them (Dist). 
Here's a breakdown of the information: B, and the distance
*/

CREATE TABLE rsc.Distance (
    PointA VARCHAR(MAX),
    PointB VARCHAR(MAX),
    Distance INTEGER
);

-- Insert the values
INSERT INTO rsc.Distance (PointA, PointB, Distance) VALUES ('HYD', 'BLR', 500);
INSERT INTO rsc.Distance (PointA, PointB, Distance) VALUES ('BLR', 'DEL', 500);
INSERT INTO rsc.Distance (PointA, PointB, Distance) VALUES ('GWH', 'VNS', 600);
INSERT INTO rsc.Distance (PointA, PointB, Distance) VALUES ('DEL', 'VNS', 600);
INSERT INTO rsc.Distance (PointA, PointB, Distance) VALUES ('VNS', 'GTK', 800);
INSERT INTO rsc.Distance (PointA, PointB, Distance) VALUES ('BLR', 'HYD', 500);
INSERT INTO rsc.Distance (PointA, PointB, Distance) VALUES ('DEL', 'BLR', 500);


/*
Find Unique Combinations From This table, Repetitions shouldn't be allowed

REVERSE PAIR QUESTION
*/

--- Solution_1
SELECT PointA,PointB,Distance
FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY Common ORDER BY (SELECT NULL)) AS rpt 
    FROM (
        SELECT 
            *, 
            CASE 
                WHEN PointA > PointB THEN PointA||PointB
                ELSE PointB||PointA
            END AS Common
        FROM rsc.Distance
    ) AS Alias 
) AS SubqueryAlias
WHERE rpt = 1;


