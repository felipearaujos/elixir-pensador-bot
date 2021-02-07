defmodule PensadorBot.Twitter do
  use GenServer

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def send() do
    # PensadorBot.Crawler.start()
    # |> ExTwitter.update(trim_user: true)

    :ok
  end

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default)
  end

  @impl true
  def init(_stack) do
    {:ok, [], {:continue, :initialize}}
  end

  @impl true
  def handle_continue(:initialize, state) do
    Process.send(self(), :send, [])

    {:noreply, state}
  end

  @impl true
  def handle_info(:send, state) do
    send()
    Process.send_after(self(), :send, 18_000_000)
    {:noreply, state}
  end
end
