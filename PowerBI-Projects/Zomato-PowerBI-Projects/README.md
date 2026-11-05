# 🍽️ Zomato Restaurant Performance & Food Delivery Analytics (Power BI)

## 📌 Project Overview
This repository contains an end-to-end data analytics and business intelligence project analyzing **Zomato restaurant performance, customer dining preferences, and order delivery trends**. The project processes messy raw transactional data using Power Query, models it into a clean Star Schema, calculates key performance metrics using DAX, and presents an interactive executive dashboard designed to help restaurant owners and platform managers optimize engagement, ratings, and profitability.

---

## 🎯 Business Problems & Questions Answered
- **Market Presence:** What is the total volume of registered restaurants across major cities and operational localities?
- **Online Order & Table Booking Impact:** Do restaurants offering online ordering and table booking maintain higher average ratings and vote volumes compared to those that do not?
- **Cost vs. Rating Dynamics:** What is the correlation between average spend for two people and overall customer satisfaction ratings?
- **Cuisine Demand:** Which cuisines (e.g., North Indian, Chinese, Continental, Fast Food) dominate market supply versus customer rating performance?
- **Local Hotspots:** Which geographic clusters represent underserved markets with high demand but low restaurant density?

---

## 🏗️ Data Architecture & Star Schema Model
The data model connects a centralized fact table to dedicated dimension tables via one-to-many (`1:*`) relationships with single-direction cross-filtering:

<img width="1325" height="717" alt="image" src="https://github.com/user-attachments/assets/a38a6295-3aec-4307-b596-49d897ba476c" />
