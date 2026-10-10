# Data-Driven Football Scouting System

## Project Title & Description
The **Data-Driven Football Scouting System** is an advanced desktop-based scouting dashboard designed to help football analysts, coaches, and scouts query, filter, and evaluate player performance metrics. Built with Python and a relational MySQL database, the application bridges raw player statistics across multiple playstyle categories—including possession, defensive blocks, counter-attacking, goal-scoring, and creative playmaking—into an interactive graphical user interface.

## Tech Stack & Database
* **Programming Language:** Python 3.x
* **GUI Framework:** Tkinter & ttk
* **Data Processing & Manipulation:** Pandas
* **Database Management System:** MySQL
* **ORM & Database Connector:** SQLAlchemy, PyMySQL
* **Database Schema:** `final_dbms_project` (comprising 11 normalized tables with defined Primary and Foreign Key constraints)

## Team Members & Institution
* **Institution:** MIT World Peace University
* **Pavith Sodhi** (PRN: 1262241522)
* **Aarya Nayak** (PRN: 1262242865)
* **Rahul Challapalli** (PRN: 1262243277)

## Project Structure & Architecture
* **`Pythoncode.py`**: Main application script handling database connection, data fetching, dynamic GUI rendering, and pandas multi-table merging/filtering logic.
* **`database_schema.sql`**: Complete database dump containing table structures, relationships, primary keys, and foreign keys.
* **`er_diagram.png`**: Entity-Relationship (EER) diagram illustrating the relational schema across all 11 tables.

## Database EER Diagram
The database consists of 11 normalized tables (`playertable`, `teamtable`, and various specialized statistics tables) linked via Primary and Foreign keys. 



## Setup & Execution Instructions

### Prerequisites
Ensure you have Python installed along with the required libraries. Run the following command in your terminal:
```bash
pip install pandas sqlalchemy pymysql

## Database Setup
1)Database Setup
Open MySQL Workbench and connect to your local MySQL instance.

Go to Server > Data Import in the top menu.

Select Import from Self-Contained File and choose the provided database_schema.sql file from your project directory.

Under Default Target Schema, click New and type final_dbms_project (or ensure your schema name matches).

Click Start Import to load all 11 normalized tables along with their primary and foreign key constraints.

Verify that your MySQL root password matches the connection string inside Pythoncode.py:
DATABASE_URL = 'mysql+pymysql://root:12345678@localhost:3306/final_dbms_project'
