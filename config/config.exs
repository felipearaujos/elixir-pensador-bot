use Mix.Config

config :extwitter, :oauth,
  consumer_key: System.get_env("TWITTER_CONSUMER_API_KEY"),
  consumer_secret: System.get_env("TWITTER_CONSUMER_TOKEN"),
  access_token: System.get_env("TWITTER_TOKEN"),
  access_token_secret: System.get_env("TWITTER_SECRET")

config :pensador_crawler, PensadorBot.Crawler,
  fetch_url: "https://www.pensador.com/frases/:PAGE_NUMBER/"

import_config "#{Mix.env()}.exs"
