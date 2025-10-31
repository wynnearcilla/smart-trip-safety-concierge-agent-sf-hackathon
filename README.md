# smart-trip-analyst-sf-hackathon

# 🧭 Smart Trip & Safety Concierge — Snowflake Data Pipeline

This repository contains the **Snowflake SQL setup and data pipeline** used for the *Smart Trip & Safety Concierge Hackathon* project.  
It builds a full end-to-end environment in Snowflake for managing and analyzing **tourism-related datasets** — including weather, crime, traffic, holidays, points of interest, and hotels.

---

## 🚀 Step-by-Step Instructions

1) The Jupyter Notebook **`HACKATHON.ipynb`** contains SQL scripts that:

  1. Configure the Snowflake environment (roles, warehouses, schemas)
  2. Create secure role-based access for analysts
  3. Define file formats and staging areas for raw CSV uploads
  4. Load data into the RAW layer
  5. Transform and clean data into CURATED analytical tables
  6. Validate access through a dedicated Cortex role

This setup allows analysts and applications to easily query curated tourism data for smart trip recommendations, safety analytics, and travel insights.

2)
