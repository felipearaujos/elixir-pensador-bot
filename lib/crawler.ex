defmodule PensadorBot.Crawler do
  def start() do
    build_url()
    |> fetch
    |> parse_response
    |> extract_data
    |> get_random_phrase
  end

  def randomize() do
    randomize(:rand.uniform(9950))
  end

  def randomize(number) do
    case number do
      1 -> randomize()
      _ -> number
    end
  end

  def build_url() do
    page = randomize()
    "https://www.pensador.com/frases/#{page}/"
  end

  def fetch(url) do
    {:ok, response} = Crawly.fetch(url)
    response
  end

  def parse_response(response) do
    Floki.find(response.body, "[id=phrasesList] > .thought-card")
  end

  def extract_data(phrases_list) do
    Enum.reduce(phrases_list, [], fn phrase_element, acc ->
      data_alt = Floki.attribute(phrase_element, "data-alt")
      [data_alt | acc]
    end)
  end

  def get_random_phrase(parsed_phrases) do
    Enum.at(parsed_phrases, :rand.uniform(Enum.count(parsed_phrases)))
  end
end
