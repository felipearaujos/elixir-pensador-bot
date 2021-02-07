use Mix.Config

config :pensador_crawler, PensadorBot.Crawler,
  fetch_url: "http://localhost:8081/frases/:PAGE_NUMBER/"
