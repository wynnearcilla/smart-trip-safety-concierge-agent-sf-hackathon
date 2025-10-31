# smart-trip-analyst-sf-hackathon

# 🧭 Smart Trip & Safety Concierge — Snowflake Data Pipeline

This repository contains the **Snowflake SQL setup and data pipeline** used for the *Smart Trip & Safety Concierge Hackathon* project.  
It builds a full end-to-end environment in Snowflake for managing and analyzing **tourism-related datasets** — including weather, crime, traffic, holidays, points of interest, and hotels.

---

## 🚀 STEP-BY-STEP INSTRUCTIONS

# 1) Run the (`HACKATHON.ipynb`) file.

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
A ready-to-use Snowflake data environment for analytics and visualization — secure, structured, and role-based.

---

---

CREATE SCHEMA IF NOT EXISTS TOURISM_DB.RAW;
CREATE SCHEMA IF NOT EXISTS TOURISM_DB.CURATED;
