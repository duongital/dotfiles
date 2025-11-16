---
description: Fetch Hacker News Show HN posts and group them by topics with Vietnamese summaries
---

You are going to fetch and analyze Hacker News Show HN posts. Follow these steps:

1. Use the browser tools to navigate to https://news.ycombinator.com/show
2. Extract all Show HN posts from the page including:
   - Post title
   - Description/subtitle (if available)
   - Link to the post
   - Number of points and comments (if visible)
3. Analyze the posts and group them by common topics/themes (e.g., Web Apps, Mobile Apps, Tools/Libraries, Games, Hardware, Side Projects, Open Source, etc.)
4. For each Show HN post:
   - Provide a brief summary in Vietnamese (2-3 sentences about what was built/shown)
   - Include the original URL
   - Include engagement metrics (points, comments) if available
   - Group it under the appropriate topic
5. Generate a timestamp in the format YYYY-MM-DD_HH:MM (e.g., 2025-11-12_14:00)
6. Write the output to a markdown file named with the timestamp and "show" prefix (e.g., 2025-11-12_14:00_show.md) in the news/ folder

Output format for the markdown file:
```
# Hacker News Show HN - Nhóm theo chủ đề
*Fetched on: [Timestamp]*

## 1. [Topic Name in Vietnamese] (e.g., Ứng dụng Web / Web Applications)

### 1.1. [Show HN Title]
**Tóm tắt:** [Vietnamese summary about what was built/shown and its key features]
**Link:** [Original URL]
**Tương tác:** [X points, Y comments] (if available)

### 1.2. [Show HN Title]
**Tóm tắt:** [Vietnamese summary about what was built/shown and its key features]
**Link:** [Original URL]
**Tương tác:** [X points, Y comments] (if available)

[Repeat for each post in this topic with numbering 1.1, 1.2, 1.3, etc.]

## 2. [Next Topic Name in Vietnamese]

### 2.1. [Show HN Title]
**Tóm tắt:** [Vietnamese summary about what was built/shown and its key features]
**Link:** [Original URL]
**Tương tác:** [X points, Y comments] (if available)

[Repeat for each topic group with numbering 2, 3, 4, etc.]
```

Important:
- Group similar Show HN posts together under logical topics
- Write summaries in clear, natural Vietnamese
- Focus on explaining what the project does and what makes it interesting
- Keep summaries concise but informative
- Include all Show HN posts from the page
- Provide direct links for easy access
- Include engagement metrics when available to highlight popular posts
- Save the output to a markdown file with timestamp and "show" suffix in the news/ folder

