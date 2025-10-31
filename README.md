# smart-trip-analyst-sf-hackathon

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
1. In the (`Hackathon.ipynb`) notebook, run the first 4 blocks of code: `SCHEMA`, `ROLE`, `STG`, and `RAW_TBLS`.
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
4. Parse the documents by running the rest of the code. After parsing, the `filename` and `content` of the .pdf documents are now stored at the `` table.

---

## 4) Create the Cortex Search Service.

### 🔹 Detailed Instructions
1. 

---

## 5) Create the Cortex Agent.

### 🔹 Detailed Instructions
1. 

---

## 6) Open the Snowflake Intelligence 

---
