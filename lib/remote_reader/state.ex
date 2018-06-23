defmodule Bunyan.Source.RemoteReader.State do

  defstruct(
    collector:    nil,
    global_name:  nil
  )

  def from(options) do
    %__MODULE__{}
    |> add_global_name(options[:global_name])
  end


  defp add_global_name(config, name) when is_atom(name) and name != nil do
    %{ config | global_name: name }
  end

  defp add_global_name(_, nil) do
    raise """

    Bunyan.Source.RemoteReader is missing the required `global_name:` option.

    """
  end

  defp add_global_name(_, other) do
    raise """

    The `global_name:` option for Bunyan.Source.RemoteReader should be an atom.

    Got: #{inspect other}

    """
  end
end
