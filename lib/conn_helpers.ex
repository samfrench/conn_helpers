defmodule ConnHelpers do
  use Rustler,
    otp_app: :conn_helpers,
    crate: :connhelpers
  @moduledoc """
  Adds performant helper functions for Plug Conn.
  """

  @doc ~S"""

  ## Examples
    iex> cookie_decode("key1=value1;key2=value2")
    %{"key1" => "value1", "key2" => "value2"}
  """
  def cookie_decode(_cookie) do
    :erlang.nif_error(:nif_not_loaded)
  end
end
