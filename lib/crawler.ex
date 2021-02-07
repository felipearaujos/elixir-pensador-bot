defmodule PensadorBot.Crawler do
  require Logger

  def start() do
    build_url()
    |> fetch
    |> parse_response
    |> extract_data
    |> get_random_phrase
  end

  defp randomize() do
    Logger.info("[#{__MODULE__}.randomize/0]")
    randomize(:rand.uniform(9950))
  end

  defp randomize(number) do
    Logger.info("[#{__MODULE__}.randomize/1")

    case number do
      1 -> randomize()
      _ -> number
    end
  end

  defp build_url() do
    Logger.info("[#{__MODULE__}.build_url]")

    env(:fetch_url)
    |> put_page()
  end

  defp put_page(url) do
    Logger.info("[#{__MODULE__}.put_page]")

    page =
      randomize()
      |> Integer.to_string()

    String.replace(url, ":PAGE_NUMBER", page)
  end

  defp fetch(url) do
    Logger.info("[#{__MODULE__}.fetch]request to #{url}")

    {:ok, response} = Crawly.fetch(url)
    response
  end

  defp parse_response(response) do
    Floki.find(response.body, "[id=phrasesList] > .thought-card")
  end

  defp extract_data(phrases_list) do
    Enum.reduce(phrases_list, [], fn phrase_element, acc ->
      data_alt = Floki.attribute(phrase_element, "data-alt")
      [data_alt | acc]
    end)
  end

  defp get_random_phrase(parsed_phrases) do
    IO.inspect(parsed_phrases)
    Enum.at(parsed_phrases, :rand.uniform(Enum.count(parsed_phrases)))
  end

  defp env(key), do: Application.get_env(:pensador_crawler, __MODULE__)[key]
end
