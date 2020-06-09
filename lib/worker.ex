#https://www.erlang-solutions.com/blog/web-scraping-with-elixir.html

defmodule PensadorCrawler.Worker do
  @behaviour Crawly.Spider


  def start() do
    Crawly.Engine.start_spider(PensadorCrawler.Worker)
  end

  def randomize() do
    randomize(:rand.uniform(9950))
  end

  def randomize(number) do
    IO.inspect(number, label: "number")
    case number do
      1 -> randomize()
      _ -> number
    end
  end


  @impl Crawly.Spider
  def base_url() do
    "https://www.pensador.com"
  end

  @impl Crawly.Spider
  def init() do
    page = randomize()
    url = "https://www.pensador.com/frases/#{page}/"

    IO.inspect(url)
    [      
      start_urls: ["https://www.pensador.com/frases/10/"]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do

    parsed_body = Floki.parse(response.body)  
    phrases_list = Floki.find(parsed_body,"[id=phrasesList] > .thought-card")

    bob = Enum.reduce(phrases_list, [], fn(phrase_element, acc) ->
      
      data_id = Floki.attribute(phrase_element, "data-id")
      data_alt = Floki.attribute(phrase_element, "data-alt")

      elem = %{id: data_id, data_alt: data_alt}
      IO.inspect(acc)
      
      [ elem | acc]
    end)
    

    # # get the blog_post
    # blog_post = Floki.find(parsed_body, "article.blog_post")

    # # Extract item from a page, e.g.
    # # https://www.erlang-solutions.com/blog/introducing-telemetry.html
    # title =
    #   blog_post
    #   |> Floki.find("h1:first-child")
    #   |> Floki.text()

    # author =
    #   blog_post
    #   |> Floki.find("p.subheading")
    #   |> Floki.text(deep: false, sep: "")
    #   |> String.trim_leading()
    #   |> String.trim_trailing()

    # text =
    #   blog_post
    #   |> Floki.text()

    foi =  Enum.at(bob, :rand.uniform(Enum.count(bob)))
     %Crawly.ParsedItem{
       :items => [foi]
     }
  end


end
