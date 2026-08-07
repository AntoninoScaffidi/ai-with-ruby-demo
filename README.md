# ai-with-ruby-demo

Companion Rails app for the [AI with Ruby](https://antoninoscaffidi.github.io/series/ai-with-ruby/) blog series ([Italiano](https://antoninoscaffidi.github.io/it/series/ai-with-ruby/)) — a chatbot built step by step with [RubyLLM](https://rubyllm.com), from a plain chat form to persisted conversations, semantic search, and tool calling.

Each blog post has a matching git tag here (`episode-2`, `episode-3`, ...) so you can check out the exact code state discussed in that post:

```bash
git checkout episode-2
```

## Stack

- Rails 8, Tailwind CSS
- SQLite
- [RubyLLM](https://rubyllm.com) (OpenAI by default)

## Setup

```bash
bundle install
cp .env.example .env   # then fill in your own OPENAI_API_KEY
bin/dev
```

App available at `http://127.0.0.1:3000`.
