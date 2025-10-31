# smart-trip-analyst-sf-hackathon

This repository contains a complete Snowflake implementation for the Smart Trip & Safety Concierge hackathon project.
It sets up database schemas, roles, file formats, stages, and curated analytical tables for integrating multiple tourism-related datasets such as weather, traffic, crime, holidays, points of interest, and hotels.

Key Features:

Automated Snowflake environment setup (roles, schemas, permissions)

Configurable RAW and CURATED layers for data management

Predefined stages and file formats for CSV ingestion

Example SQL transformations for analytics-ready datasets

Role-based access via CORTEX_APP_ROLE for secure data consumption

Usage:

Run the provided Snowflake SQL blocks in order.

Upload your raw CSV files to the defined stages.

Execute transformation scripts to build curated analytical tables.

Query or visualize the curated datasets using Snowflake Cortex or BI tools.
