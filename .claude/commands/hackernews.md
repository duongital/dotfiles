---
description: Fetch Hacker News best articles and group them by topics with Vietnamese summaries
---

You are going to fetch and analyze Hacker News best articles. Follow these steps:

1. Use the browser tools to navigate to https://news.ycombinator.com/best
2. Extract all article titles and links from the page (typically 30 articles)
3. Analyze the articles and group them by common topics/themes (e.g., AI/ML, Web Development, Security, Hardware, Startups, etc.)
4. For each article:
   - Provide a brief summary in Vietnamese (2-3 sentences)
   - Include the original URL
   - Group it under the appropriate topic
5. Generate a timestamp in the format YYYY-MM-DD_HH:MM (e.g., 2025-11-07_12:00)
6. Write the output to a markdown file named with the timestamp (e.g., 2025-11-07_12:00.md) in the current directory

Output format for the markdown file:
```
# Hacker News Best - Nhóm theo chủ đề
*Fetched on: [Timestamp]*

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
- Save the output to a markdown file with timestamp in the current directory

