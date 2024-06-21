# ConnHelpers

Performant functions for using with Plug Conn and take from there as a reference.

At the moment only cookie decode has been implemented.
For this there is a difference in how whitespace is handled, as it is allowed in the cookie compared to Plug Conn.
The spec suggests this should not be the case but other sources seem to allow for this.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `conn_helpers` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:conn_helpers, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/conn_helpers>.

## Benchmark

This was tested against the Plug Conn version 1.16.1.

```
Name                                  ips
ConnHelpers.cookie_decode/1       55.30 K
Plug.Conn.Cookies.decode/1         7.70 K - 7.18x slower +111.74 μs

Memory usage statistics:
Name                                average
ConnHelpers.cookie_decode/1         1.67 KB
Plug.Conn.Cookies.decode/1          5.27 KB - 3.16x memory usage +3.60 KB
```
