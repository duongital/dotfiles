---
description: Fetch Hacker News jobs and create a structured markdown file
---

You are going to fetch and analyze Hacker News job postings. Follow these steps:

1. Use the browser tools to navigate to https://news.ycombinator.com/jobs
2. Extract all job postings from the page including:
   - Job title
   - Company name
   - Location (if available)
   - Job type (if available)
   - Link to the job posting
3. Analyze the jobs and group them by categories (e.g., Engineering, Design, Product, Data/AI, Remote, etc.)
4. For each job posting:
   - Provide a brief summary in Vietnamese (1-2 sentences about the role)
   - Include company name and location
   - Include the original URL
   - Group it under the appropriate category
5. Generate a timestamp in the format YYYY-MM-DD_HH:MM (e.g., 2025-11-12_14:00)
6. Write the output to a markdown file named with the timestamp and "jobs" prefix (e.g., 2025-11-12_14:00_jobs.md) in the current directory

Output format for the markdown file:
```
# Hacker News Jobs - Nhóm theo danh mục
*Fetched on: [Timestamp]*

## 1. [Category Name in Vietnamese] (e.g., Kỹ thuật phần mềm / Software Engineering)

### 1.1. [Job Title] - [Company Name]
**Vị trí:** [Location]
**Tóm tắt:** [Vietnamese summary about the role and responsibilities]
**Link:** [Original URL]

### 1.2. [Job Title] - [Company Name]
**Vị trí:** [Location]
**Tóm tắt:** [Vietnamese summary about the role and responsibilities]
**Link:** [Original URL]

[Repeat for each job in this category with numbering 1.1, 1.2, 1.3, etc.]

## 2. [Next Category Name in Vietnamese]

### 2.1. [Job Title] - [Company Name]
**Vị trí:** [Location]
**Tóm tắt:** [Vietnamese summary about the role and responsibilities]
**Link:** [Original URL]

[Repeat for each category with numbering 2, 3, 4, etc.]
```

Important:
- Group similar jobs together under logical categories
- Write summaries in clear, natural Vietnamese
- Keep summaries concise but informative
- Include all available job postings from the page
- Provide direct links for easy access
- Save the output to a markdown file with timestamp and "jobs" suffix in the current directory
- If location or other details are not available, you can omit those fields

