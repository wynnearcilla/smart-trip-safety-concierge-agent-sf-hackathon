# smart-trip-analyst-sf-hackathon

# 🧭 Smart Trip & Safety Concierge Agent - Snowflake Inteligence

This repository contains the **Snowflake SQL setup and data pipeline** used for the *Smart Trip & Safety Concierge Hackathon* project.  
It builds a full end-to-end environment in Snowflake for managing and analyzing **tourism-related datasets** — including weather, crime, traffic, holidays, points of interest, and hotels.

---

## 🚀 STEP-BY-STEP INSTRUCTIONS

# 1) Run the (`HACKATHON.ipynb`) file in Snowflake to setup the data environment.

This Snowflake notebook (`HACKATHON.ipynb`) automates the full setup of a data pipeline for the **Smart Trip & Safety Concierge** project.  
It prepares a secure, organized environment for analyzing tourism-related datasets such as weather, traffic, crime, holidays, POIs, and hotels.

### 🔹 Step-by-Step Summary
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

# 2) In Cortex Analyst, upload the YAML files found in [SEMANTIC_VIEWS/](SEMANTIC_VIEWS/) to create the Semantic Views.

### 🔹 Detailed Instructions
1. Download the YAML files in [SEMANTIC_VIEWS/](SEMANTIC_VIEWS/) to your local computer.
2. In the Snowflake UI, go to AI & ML --> Cortex Analyst.
3. Select the Warehouse 'HACK_WH'.
4. Upload the YAML files to create the Semantic Views.
5. Set the Database & Schema to 'TOURISM_DB.CURATED' and the Stage to 'SEMANTIC_UPLOAD_STAGE'.
6. Ensure that the following 8 Semantic Views are successfully created.
     - WEATHER_SUITABILITY_SEM
     - SAFETY_INDEX_SEM
     - HOTEL_RECO_SEM
     - POI_SEM
     - HOLIDAYS_SEM
     - TRAFFIC_LATEST_SEM
     - TRAFFIC_ALERTS_SEM
     - TRANSIT_NEXT_DEPARTURES_SEM
7. Note: The created Views from Step 1 were used as Logical Tables for the Semantic Views. Each View directly corresponds to a Semantic View (e.g., WEATHER_SUITABILITY --> WEATHER_SUITABILITY_SEM).

---

# 3) Create the semantic views for the Cortex Analyst.
https://drive.google.com/file/d/19Q6E85FlF-Pt1kXsgGs9E0ZzKEqF93JS/view?usp=sharing
---

# 4) Create the Cortex Search Service.

---

# 5) Create the Cortex Agent.

---

# 6) 

---
