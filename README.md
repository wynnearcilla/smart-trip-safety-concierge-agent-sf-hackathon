# smart-trip-safety-concierge-agent-sf-hackathon

# 🧭 Smart Trip & Safety Concierge Agent - Snowflake Inteligence

This repository contains the **Snowflake SQL setup and data pipeline** used for the *Smart Trip & Safety Concierge Hackathon* project.  
It builds a full end-to-end environment in Snowflake for managing and analyzing **tourism-related datasets** — including weather, crime, traffic, holidays, points of interest, and hotels.

---

# 🚀 STEP-BY-STEP INSTRUCTIONS

---

## 1) Run the `HACKATHON.ipynb` file in Snowflake to setup the data environment.

This Snowflake notebook `HACKATHON.ipynb` automates the full setup of a data pipeline for the **Smart Trip & Safety Concierge** project.  
It prepares a secure, organized environment for analyzing tourism-related datasets such as weather, traffic, crime, holidays, POIs, and hotels.

### 🔹 IMPORTANT: Detailed Instructions
1. In the `Hackathon.ipynb` notebook, run the first 4 blocks of code: `SCHEMA`, `ROLE`, `STG`, and `RAW_TBLS`.
2. Download the .csv and .txt files found in [CSV_TXT_FILES/](CSV_TXT_FILES/) to your local computer.
3. Upload the following files to their corresponding Stages under `TOURISM_DB.RAW`.
     - `crime_incidents.csv`        -->  `STAGE_CRIME`
     - `hotels.csv`                 -->  `STAGE_HOTELS`
     - `ph_holidays_2025_2026.csv`  -->  `STAGE_HOLIDAYS`
     - `poi_opentripmap.csv`        -->  `STAGE_POI`
     - `traffic_incidents.csv`      -->  `STAGE_TRAFFIC`
     - `traffic_speeds.csv`         -->  `STAGE_TRAFFIC`
     - `weather_hourly.csv`         -->  `STAGE_WEATHER`
     - `gtfs_stop_times_expanded.txt`   -->  `STAGE_GTFS`
     - `gtfs_stops_expanded.txt`        -->  `STAGE_GTFS`
     - `gtfs_trips_expanded.txt`        -->  `STAGE_GTFS`
5. Run the rest of the code in the `Hackathon.ipynb` notebook.

### 🔹 This part does not need execution. It just summarizes what the `HACKATHON.ipynb` code executed.
1. **Set context** — Uses the correct role, warehouse, and database (`ACCOUNTADMIN`, `HACK_WH`, `TOURISM_DB`).  
2. **Create schemas** — Builds `RAW` (raw data) and `CURATED` (processed data) layers.  
3. **Create role** — Defines `CORTEX_APP_ROLE` for controlled analyst access.  
4. **Grant permissions** — Gives the role access to the warehouse, schemas, and tables.  
5. **Define file format** — Sets up a standard CSV format for consistent file loading.  
6. **Create stages** — Makes internal stages for file uploads (weather, crime, holidays, etc.).  
7. **Upload data** — You upload CSV files into the appropriate stages.  
8. **Load raw tables** — Creates tables in `RAW` and loads data from the staged files.  
9. **Transform data** — Cleans and aggregates raw data into curated analytical tables.  
10. **Validate access** — Switches to `CORTEX_APP_ROLE` and confirms proper permissions.  

✅ **Result:**  
A ready-to-use Snowflake data environment for analytics and visualization — secure, structured, and role-based. **There are 8 created Views which will be used as Logical Tables for the Semantic Views in Cortex Analyst.**

---

## 2) In Cortex Analyst, upload the YAML files found in [SEMANTIC_VIEWS/](SEMANTIC_VIEWS/) to create the Semantic Views.

### 🔹 Detailed Instructions
1. Download the YAML files in [SEMANTIC_VIEWS/](SEMANTIC_VIEWS/) to your local computer.
2. In the Snowflake UI, go to AI & ML --> Cortex Analyst.
3. Select the Warehouse `HACK_WH`.
4. Upload the YAML files to create the Semantic Views.
5. Set the Database & Schema to `TOURISM_DB.CURATED` and the Stage to `SEMANTIC_UPLOAD_STAGE`.
6. Ensure that the following 8 Semantic Views are successfully created.
     - `WEATHER_SUITABILITY_SEM`
     - `SAFETY_INDEX_SEM`
     - `HOTEL_RECO_SEM`
     - `POI_SEM`
     - `HOLIDAYS_SEM`
     - `TRAFFIC_LATEST_SEM`
     - `TRAFFIC_ALERTS_SEM`
     - `TRANSIT_NEXT_DEPARTURES_SEM`
7. Note: The created Views from Step 1 were used as Logical Tables for the Semantic Views. Each View directly corresponds to a Semantic View (e.g., `WEATHER_SUITABILITY` --> `WEATHER_SUITABILITY_SEM`).

---

## 3) Run the `PARSE_DOCUMENTS.sql` file in Snowflake to parse the documents.

### 🔹 Detailed Instructions
1. Run the first 3 lines of code of `PARSE_DOCUMENTS.sql` to create the `DOCUMENT_UPLOAD_STAGE`.
2. Download the .zip file containing the .pdf documents from the following Google Drive link. It must contain 21 files.
     - https://drive.google.com/file/d/19Q6E85FlF-Pt1kXsgGs9E0ZzKEqF93JS/view?usp=sharing
3. Upload the .pdf documents to the `DOCUMENT_UPLOAD_STAGE`.
4. Parse the documents by running the rest of the code. After parsing, the `filename` and `content` of the .pdf documents are now stored at the `TOURISM_DOCSEARCH` table under the `TOURISM_DB.CREATED`.

---

## 4) Create the Cortex Search Service (`SEARCH_PDF`).

### 🔹 Detailed Instructions
1. In the Snowflake UI, go to AI & ML --> Cortex Search.
2. Create new Cortex Search Service. Set the Database and Schema to `TOURISM_DB.CREATED`. Set the service name to `SEARCH_PDF`.
3. Select `TOURISM_DOCSEARCH` as the base table.
4. Set the Search column to the `PAGE_CONTENT` column.
5. Set the Attribute column to the `FILENAME` column.
6. Select `HACK_WH` as the Warehouse. Set the target lag to 1 hour.
7. Set the embedding model to `snowflake-arctic-embed-m-v1.5`.
8. After which, the Cortex Search Service must now have been created.

---

## 5) Create the Cortex Agent (`TOURAGENT`).

### 🔹 Detailed Instructions
1. Create a new Cortex Agent. Set the name and display name to `TOURAGENT`.
2. Copy the following instructions to the Response Instructions.
     - Always use a warm, welcoming, and friendly tone in responses.
     - Be suggestive (example: if you want to do these kind of activities... then here are... , if you are into..., then this..) 
     - Be clear, concise, and courteous; avoid long paragraphs or complex sentences.
     - Respond as a helpful travel assistant, using positive and encouraging language.
     - Prioritize user comfort and confidence; reassure users when recommending activities or locations.
     - Use simple, everyday vocabulary that’s easy for all travelers to understand.
     - Never use technical or system terms; avoid references to backend processes or data sources.
     - When asking for clarification, do so politely and show appreciation for the user’s input.
     - Express enthusiasm for local attractions, experiences, and travel opportunities.
     - Avoid making absolute statements about safety or suitability; instead, offer practical guidance and alternatives.
     - Always thank users for their questions and offer further assistance at the end of each response.
     - If a recommendation involves risk (weather, safety, etc.), remind users to check with local authorities for the latest updates.
     - When sharing information, be empathetic to travelers’ needs, including accessibility, family, or special interests.
3. For the Cortex Analyst tools, add all the 8 Semantic Views with their corresponding `Description`.
     - `WEATHER_SUITABILITY_SEM`
     - `SAFETY_INDEX_SEM`
     - `HOTEL_RECO_SEM`
     - `POI_SEM`
     - `HOLIDAYS_SEM`
            - HOLIDAYS:
               - Database: TOURISM_DB, Schema: CURATED
               - Contains information about public holidays in the Philippines, including both local and English names of the holidays and their corresponding dates.
               - Useful for business planning, scheduling, and time-off management in the Philippine context.
               - LIST OF COLUMNS: LOCAL_NAME (holiday name in local language), NAME (holiday name in English), DATE (date of the holiday)

               REASONING:
               This semantic view focuses on Philippine holiday information management, providing a comprehensive view of public holidays with their dates and names in both local and English versions. The structure allows for easy holiday tracking and scheduling, which is essential for businesses operating in the Philippines. The view is particularly useful for organizations that need to manage schedules, plan operations, and handle time-off requests around Philippine holidays.

               DESCRIPTION:
               The HOLIDAY_SEM semantic view, located in TOURISM_DB.CURATED, serves as a centralized repository for Philippine public holiday information. It maintains a comprehensive list of holidays with their corresponding dates and provides both local and English names for each holiday, making it valuable for both domestic and international users. The view supports various business operations including workforce planning, scheduling, and holiday-related activities management. This semantic view is particularly useful for queries related to holiday dates, names, and cultural significance in the Philippine context, enabling efficient holiday-based planning and operations management.
     - `TRAFFIC_LATEST_SEM`
     - `TRAFFIC_ALERTS_SEM`
     - `TRANSIT_NEXT_DEPARTURES_SEM`
5. For the Cortex Search Services, add the `SEARCH_PDF`. 

---

## 6) Open the Snowflake Intelligence 

---
