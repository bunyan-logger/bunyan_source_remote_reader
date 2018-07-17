unless function_exported?(Bunyan.Shared.Build, :__info__, 1),
do: Code.require_file("shared_build_stuff/mix.exs")

alias Bunyan.Shared.Build

defmodule BunyanSourceRemoteReader.MixProject do
  use Mix.Project

  def project() do
    Build.project(
      :bunyan_source_remote_reader,
      &deps/1,
      "Let this node act as the target for a remote logger in the Bunyan distributed and pluggable logging system"
    )
  end

  def application(), do: []

  def deps(_) do
    [
      bunyan:  [ bunyan_shared: ">= 0.0.0" ],
      others:  [],
    ]
  end

end
