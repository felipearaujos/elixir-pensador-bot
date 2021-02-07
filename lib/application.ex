defmodule PensadorBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, args) do
    children = [PensadorBot.Twitter] ++ extra_children(args)
    opts = [strategy: :one_for_one, name: PensadorBot.Twitter]

    Supervisor.start_link(children, opts)
  end

  defp extra_children(env: :test) do
    [{Plug.Cowboy, scheme: :http, plug: PensadorBot.CrawlyMockServer, options: [port: 8081]}]
  end

  defp extra_children(_) do
    []
  end
end
