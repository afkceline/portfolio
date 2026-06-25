# Web Scraping — Python & BeautifulSoup

**Tools:** Python · BeautifulSoup · Pandas · Requests  
**Focus:** Automated data extraction from web sources

---

## Contents

| File | Description |
|------|-------------|
| `webscraping_cs.ipynb` | Practice exercises using Pandas and BeautifulSoup to extract structured data from different web sources and case studies |
| `master_project_europcar_scraping.ipynb` | Full scraping script for the Europcar fleet analysis project — extracts 55,000+ vehicle listings and outputs a clean CSV ready for processing |

---

## Featured Script — Europcar Fleet Data Extraction

**Business context:** Europcar needed market data on second-hand vehicles across Spain to support a €3M fleet acquisition decision. No dataset existed — the data had to be collected from scratch.

**What the script does:**
- Sends automated HTTP requests to the target source
- Parses HTML with BeautifulSoup to extract structured fields (brand, model, price, mileage, fuel type, year, category)
- Iterates across multiple pages to collect the full dataset
- Exports a `.csv` file with 55,000+ records, ready for cleaning and analysis

**Output:** Raw dataset used as the starting point for the full [Europcar analysis pipeline](../PowerBI/README.md) — data cleaning (Pandas), SQL exploratory analysis, TCO modelling, and Power BI dashboards.

---

## Practice Exercises

The exercises file covers core BeautifulSoup techniques applied to different case studies:

- Navigating HTML tree structure
- Extracting text, attributes, and links
- Handling pagination and nested elements
- Structuring scraped data into DataFrames with Pandas

---

## Skills Demonstrated

- End-to-end web data collection pipeline
- HTML parsing and structured data extraction
- Handling large-scale scraping (55,000+ records)
- Clean output formatting for downstream analysis

---

## Requirements

```
pip install requests beautifulsoup4 pandas
```
