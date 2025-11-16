---
description: Fetch Hacker News front page articles from a specific date and group them by topics with Vietnamese summaries
---

You are going to fetch and analyze Hacker News front page articles from a specific date. Follow these steps:

1. Parse the date parameter:
   - If a date is provided in format YYYY-MM-DD (e.g., 2025-11-12), use that date
   - If no date is provided, calculate yesterday's date in format YYYY-MM-DD
   - Example: if today is 2025-11-13, yesterday is 2025-11-12

2. Use the browser tools to navigate to https://news.ycombinator.com/front?day={date} where {date} is the parsed date

3. Extract all article titles and links from the page (typically 30 articles)

4. Analyze the articles and group them by common topics/themes (e.g., AI/ML, Web Development, Security, Hardware, Startups, etc.)

5. For each article:
   - Provide a brief summary in Vietnamese (2-3 sentences)
   - Include the original URL
   - Group it under the appropriate topic

6. Generate a filename using the format: {date}_{time}_front.md where:
   - {date} is in YYYY-MM-DD format (e.g., 2025-11-12)
   - {time} is in HH:MM format (e.g., 14:01) using current local time
   - Example: 2025-11-12_14:01_front.md

7. Write the output to a markdown file in the news/ folder

Output format for the markdown file:
```
# Hacker News Front Page - {date} - Nhóm theo chủ đề
*Fetched on: {current_timestamp}*
*Front page date: {date}*

## 1. [Topic Name in Vietnamese]

### 1.1. [Article Title]
**Tóm tắt:** [Vietnamese summary]
**Link:** [Original URL]

### 1.2. [Article Title]
**Tóm tắt:** [Vietnamese summary]
**Link:** [Original URL]

[Repeat for each article in this topic with numbering 1.1, 1.2, 1.3, etc.]

## 2. [Next Topic Name in Vietnamese]

### 2.1. [Article Title]
**Tóm tắt:** [Vietnamese summary]
**Link:** [Original URL]

[Repeat for each topic group with numbering 2, 3, 4, etc.]
```

Important:
- Group similar articles together under logical topics
- Write summaries in clear, natural Vietnamese
- Keep summaries concise but informative
- Include all ~30 articles from the page
- Provide direct links for easy access
- Save the output to a markdown file named {date}_{time}_front.md in the news/ folder
- If the date page doesn't exist or has no articles, inform the user

Example usage:
- `/hn-front` - fetches yesterday's front page
- `/hn-front 2025-11-12` - fetches front page from November 12, 2025
