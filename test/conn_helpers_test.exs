defmodule ConnHelpersTest do
  use ExUnit.Case, async: true
  import ConnHelpers

  doctest ConnHelpers

  test "ConnHelpers.cookie_decode cookies" do
    assert ConnHelpers.cookie_decode("key1=value1, key2=value2") == %{"key1" => "value1, key2=value2"}
    assert ConnHelpers.cookie_decode("key1=value1; key2=value2") == %{"key1" => "value1", "key2" => "value2"}

    assert ConnHelpers.cookie_decode("$key1=value1, key2=value2; $key3=value3") == %{
             "$key1" => "value1, key2=value2",
             "$key3" => "value3"
           }

    # assert ConnHelpers.cookie_decode("key space=value, key=value space") == %{}
    assert ConnHelpers.cookie_decode("  key1=value1 , key2=value2  ") == %{"key1" => "value1 , key2=value2"}
    assert ConnHelpers.cookie_decode("") == %{}
    assert ConnHelpers.cookie_decode("=") == %{}
    # assert ConnHelpers.cookie_decode("key, =, value") == %{}
    assert ConnHelpers.cookie_decode("key=") == %{"key" => ""}
    assert ConnHelpers.cookie_decode("key1=;;key2=") == %{"key1" => "", "key2" => ""}

    for whitespace <- [
      "\s"
      # "\t",
      # "\r",
      # "\n",
      # "\v",
      # "\f"
      ] do
      assert ConnHelpers.cookie_decode("#{whitespace}=value") == %{}
      assert ConnHelpers.cookie_decode("#{whitespace}=#{whitespace}") == %{}

      if whitespace == "\s" do
        assert ConnHelpers.cookie_decode("key=#{whitespace}") == %{"key" => ""}
      else
        assert ConnHelpers.cookie_decode("key=#{whitespace}") == %{}
      end
    end
  end
end
