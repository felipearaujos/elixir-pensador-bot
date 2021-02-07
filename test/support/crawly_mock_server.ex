defmodule PensadorBot.CrawlyMockServer do
  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["text/*"],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)

  get "frases/*page" do
    response = File.read!("test/support/fixtures/pensador_fixture.html")

    conn
    |> Plug.Conn.send_resp(200, response)
  end

  defp success(conn, body \\ "") do
    conn
    |> Plug.Conn.send_resp(200, Poison.encode!(body))
  end

  defp failure(conn) do
    conn
    |> Plug.Conn.send_resp(422, Poison.encode!(%{message: "error message"}))
  end
end
