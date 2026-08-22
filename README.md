# ai-with-ruby-demo

Companion Rails app for the [AI with Ruby](https://antoninoscaffidi.github.io/series/ai-with-ruby/) blog series ([Italiano](https://antoninoscaffidi.github.io/it/series/ai-with-ruby/)) — a chatbot built step by step with [RubyLLM](https://rubyllm.com), from a plain chat form to persisted conversations, semantic search, and tool calling.

Each blog post has a matching git tag here (`episode-2`, `episode-3`, ...) so you can check out the exact code state discussed in that post:

```bash
git checkout episode-2
```

## Stack

- Rails 8, Tailwind CSS
- PostgreSQL with [pgvector](https://github.com/pgvector/pgvector) (as of episode 5, for semantic search)
- [RubyLLM](https://rubyllm.com) (OpenAI by default)

## Setup

Needs a PostgreSQL server with the `vector` extension available (`CREATE EXTENSION vector` must succeed — see [pgvector's install docs](https://github.com/pgvector/pgvector#installation) if it doesn't).

```bash
bundle install
cp .env.example .env   # then fill in your own OPENAI_API_KEY
bin/rails db:create db:migrate
bin/rails ruby_llm:load_models   # needed once, so RubyLLM.embed can resolve the embedding model
bin/dev
```

App available at `http://127.0.0.1:3000`.
