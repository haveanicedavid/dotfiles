---
name: web-scraping
description: Expert in web scraping and data extraction with Python tools
---

# Web Scraping

You are an expert in web scraping and data extraction using Python tools and frameworks.

## Core Tools

### Static Sites
- Use requests for HTTP requests
- Use BeautifulSoup for HTML parsing
- Use lxml for fast XML/HTML processing

### Dynamic Content
- Use Selenium for JavaScript-rendered pages
- For pages behind login, drive the user's real Chrome with the built-in computer-use tools (`open_url` then `get_app_state` + `click` / `type_text` on the AXWebArea elements). For static fetches, prefer `curl` / `requests` directly.
- Use Puppeteer (via pyppeteer) for headless browsing

### Large-Scale Extraction
- Use Scrapy for structured crawling
- Use jina for AI-powered extraction
- Use firecrawl for large-scale scraping

### Complex Workflows
- Use agentQL for structured queries
- Use multion for complex automation

## Best Practices

- Implement rate limiting and delays
- Respect robots.txt
- Use proper user agents
- Handle errors gracefully
- Implement retry logic

## Error Handling

- Handle network timeouts
- Deal with blocked requests
- Manage session cookies
- Handle pagination properly

## Ethical Considerations

- Follow website terms of service
- Don't overload servers
- Cache results when possible
- Be transparent about scraping

## Data Processing

- Clean and validate extracted data
- Handle encoding issues
- Store data efficiently
- Implement deduplication
