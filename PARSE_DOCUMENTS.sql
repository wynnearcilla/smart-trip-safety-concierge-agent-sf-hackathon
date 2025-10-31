//==CREATE DOCUMENT_UPLOAD_STAGE
CREATE OR REPLACE STAGE DOCUMENT_UPLOAD_STAGE 
    encryption = (type = 'snowflake_sse') directory = (enable = true);


//==DOCUMENT CONTENT INGESTION TO TABLES

-- 1. Create a table to store parsed PDF page contents of all the documents
CREATE OR REPLACE TABLE tourism_docsearch (
    filename STRING,
    page_content STRING
);

-- 2. Parse the PDFs from the stage and insert into the table

//==(1)==Marikina
INSERT INTO tourism_docsearch
SELECT
    'Marikina'                             AS filename,
    f.value:"content"::STRING              AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','marikina.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(2)==10 Must-Try Tours & Activities Around Manila City _ Guide to the Philippines
INSERT INTO tourism_docsearch
SELECT
    '10 Must-Try Tours & Activities Around Manila City _ Guide to the Philippines'      AS filename,
    f.value:"content"::STRING                                                           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','10 Must-Try Tours & Activities Around Manila City _ Guide to the Philippines.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(3)==Red Planet Hotels _ THINGS TO DO IN BGC_ 14 PLACES AND ACTIVITIES FOR A FUN WEEKEND
INSERT INTO tourism_docsearch
SELECT
    'Red Planet Hotels _ THINGS TO DO IN BGC_ 14 PLACES AND ACTIVITIES FOR A FUN WEEKEND'      AS filename,
    f.value:"content"::STRING                                                                  AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','Red Planet Hotels _ THINGS TO DO IN BGC_ 14 PLACES AND ACTIVITIES FOR A FUN WEEKEND.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(4)==SOUTHERN MANILA_ 6 Things To Do in Las Piñas, Muntinlupa & Parañaque _ The Poor Traveler® Itinerary Blog
INSERT INTO tourism_docsearch
SELECT
    'SOUTHERN MANILA_ 6 Things To Do in Las Piñas, Muntinlupa & Parañaque _ The Poor Traveler® Itinerary Blog'      AS filename,
    f.value:"content"::STRING                                                                  AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','SOUTHERN MANILA_ 6 Things To Do in Las Piñas, Muntinlupa & Parañaque _ The Poor Traveler® Itinerary Blog.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(5)==The Full Makati Travel Guide_ Top Things to Do and See - Abraham Tours Philippines
INSERT INTO tourism_docsearch
SELECT
    'The Full Makati Travel Guide_ Top Things to Do and See - Abraham Tours Philippines'      AS filename,
    f.value:"content"::STRING                                                                 AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','The Full Makati Travel Guide_ Top Things to Do and See - Abraham Tours Philippines.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(6)==Alabang Muntinlupa
INSERT INTO tourism_docsearch
SELECT
    'Alabang Muntinlupa'                    AS filename,
    f.value:"content"::STRING               AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','alabang muntinlupa.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(7)==BF Homes Paranaque
INSERT INTO tourism_docsearch
SELECT
    'BF Homes Paranaque'                    AS filename,
    f.value:"content"::STRING               AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','BF Homes Paranaque.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(8)==MAKATI _ Coffee Places and Creative Cafés in Poblacion - RJdEXPLORER
INSERT INTO tourism_docsearch
SELECT
    'MAKATI _ Coffee Places and Creative Cafés in Poblacion - RJdEXPLORER'          AS filename,
    f.value:"content"::STRING                                                       AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','MAKATI _ Coffee Places and Creative Cafés in Poblacion - RJdEXPLORER.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(9)==Malabon
INSERT INTO tourism_docsearch
SELECT
    'Malabon'                           AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','malabon.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(10)==Mandaluyong
INSERT INTO tourism_docsearch
SELECT
    'Mandaluyong'                       AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','mandaluyong.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(11)==Navotas
INSERT INTO tourism_docsearch
SELECT
    'Navotas'                           AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','navotas.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(12)==Paranaque
INSERT INTO tourism_docsearch
SELECT
    'Paranaque'                         AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','paranaque.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(13)==The Ultimate Poblacion (Makati City) Food Guide_ Restaurants, Eateries, and Cafes You Should Visit in Makati City’s Nightlife District — Zoy To The World
INSERT INTO tourism_docsearch
SELECT
    'The Ultimate Poblacion (Makati City) Food Guide_ Restaurants, Eateries, and Cafes You Should Visit in Makati City’s Nightlife District — Zoy To The World'                         AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','The Ultimate Poblacion (Makati City) Food Guide_ Restaurants, Eateries, and Cafes You Should Visit in Makati City’s Nightlife District — Zoy To The World.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(14)==Pasay
INSERT INTO tourism_docsearch
SELECT
    'Pasay'                             AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','pasay.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(15)==Pasig
INSERT INTO tourism_docsearch
SELECT
    'Pasig'                             AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','pasig.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(16)==QC Cafe
INSERT INTO tourism_docsearch
SELECT
    'QC Cafe'                           AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','QC Cafe.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(17)==QC
INSERT INTO tourism_docsearch
SELECT
    'QC'                                AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','QC.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(18)==San Juan Resto
INSERT INTO tourism_docsearch
SELECT
    'San Juan Resto'                    AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','san juan resto.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(19)==San Juan
INSERT INTO tourism_docsearch
SELECT
    'San Juan'                    AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','san juan.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(20)==10 Best Restaurants in BGC
INSERT INTO tourism_docsearch
SELECT
    '10 Best Restaurants in BGC'        AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','10 Best Restaurants in BGC.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;


//==(21)== Taguig
INSERT INTO tourism_docsearch
SELECT
    'Taguig'                            AS filename,
    f.value:"content"::STRING           AS page_content
FROM (
    SELECT AI_PARSE_DOCUMENT (
        TO_FILE('@DOCUMENT_UPLOAD_STAGE','taguig.pdf'),
        {'mode': 'LAYOUT' , 'page_split': true}
    ) AS doc
) t,
LATERAL FLATTEN(input => doc:"pages") f;

-- 3. Verify results
SELECT * FROM tourism_docsearch;


