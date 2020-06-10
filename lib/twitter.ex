defmodule PensadorBot.Twitter do
  def send() do
    phrase = PensadorBot.Crawler.start()

    ExTwitter.update(phrase, trim_user: true)
  end
end
