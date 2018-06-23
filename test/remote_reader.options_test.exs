defmodule TestRemoteReader.Options do
  use ExUnit.Case

  alias Bunyan.Source.RemoteReader.State

  test "requires a global name" do
    assert_raise RuntimeError,
                 ~r/missing the require.+global_name/,
                 fn -> State.from([]) end
  end

  test "insists on an atom" do
    assert_raise RuntimeError,
                 ~r/should be an atom.*Got: "wombat"/s,
                 fn -> State.from([ global_name: "wombat" ]) end
  end

  test "tucks the global name into the config" do
    assert %State{ global_name: name } = State.from(global_name: Wombat)
    assert name == Wombat
  end
end
