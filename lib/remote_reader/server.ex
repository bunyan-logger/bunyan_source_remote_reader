defmodule Bunyan.Source.RemoteReader.Server do
  use GenServer

  def start_link(config) do
    GenServer.start_link(__MODULE__, config, name: config.global_name)
  end

  def init(config) do
    { :ok, config }
  end

  def handle_cast({ :forward_log, msg }, config) do
    Bunyan.Shared.Collector.log(config.collector, msg)
    { :noreply, config }
  end
end
