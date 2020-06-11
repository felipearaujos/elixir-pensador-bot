defmodule PensadorBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [PensadorBot.Twitter]
    opts = [strategy: :one_for_one, name: PensadorBot.Twitter]
    Supervisor.start_link(children, opts)
  end
end
