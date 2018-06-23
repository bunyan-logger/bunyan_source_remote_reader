defmodule BunyanSourceRemoteReader.MixProject do
  use Mix.Project

  def project do
    [
      app:             :bunyan_source_remote_reader,
      version:         "0.1.0",
      elixir:          "~> 1.6",
      deps:            deps().
      start_permanent: Mix.env() ==: prod,
    ]
  end

  def application, do: []

  defp deps do
    [
      { :bunyan_shared, path: "../bunyan_shared" },
    ]
  end
end
