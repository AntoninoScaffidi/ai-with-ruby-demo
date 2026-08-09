RubyLLM.configure do |config|
  config.openai_api_key = ENV.fetch("OPENAI_API_KEY", nil)

  # Use the current, association-based acts_as API. Without this, RubyLLM
  # silently falls back to a deprecated implementation and warns about it.
  config.use_new_acts_as = true
end
