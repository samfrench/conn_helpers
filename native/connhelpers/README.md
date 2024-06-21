# NIF for Elixir.ConnHelpers

## To build the NIF module:

- Your NIF will now build along with your project.

## To load the NIF:

```elixir
defmodule ConnHelpers do
  use Rustler, otp_app: :conn_helpers, crate: "connhelpers"

  # When your NIF is loaded, it will override this function.
  def cookie_decode(_cookie), do: :erlang.nif_error(:nif_not_loaded)
end
```

## Examples

[This](https://github.com/rusterlium/NifIo) is a complete example of a NIF written in Rust.
