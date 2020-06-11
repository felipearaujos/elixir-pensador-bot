defmodule PensadorBot.Twitter do
  use GenServer

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def send() do
    phrase = PensadorBot.Crawler.start()

    ExTwitter.update(phrase, trim_user: true)
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
    IO.inspect("send")
    send()
    Process.send_after(self(), :send, 18000000)
    {:noreply, state}
  end
end
