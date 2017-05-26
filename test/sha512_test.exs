defmodule SHA512Test do
  use ExUnit.Case
  alias Crypto.Hash.SHA512
  doctest SHA512

  test "SHA512 empty" do
    assert SHA512.hash("") == <<207, 131, 225, 53, 126, 239, 184, 189, 241, 84, 40, 80, 214, 109, 128, 7, 214, 32, 228, 5, 11, 87, 21, 220, 131, 244, 169, 33, 211, 108, 233, 206, 71, 208, 209, 60, 93, 133, 242, 176, 255, 131, 24, 210, 135, 126, 236, 47, 99, 185, 49, 189, 71, 65, 122, 129, 165, 56, 50, 122, 249, 39, 218, 62>>
  end

  test "SHA512 hello world" do
    assert SHA512.hash("Hello World!") == <<134, 24, 68, 214, 112, 78, 133, 115, 254, 195, 77, 150, 126, 32, 188, 254, 243, 212, 36, 207, 72, 190, 4, 230, 220, 8, 242, 189, 88, 199, 41, 116, 51, 113, 1, 94, 173, 137, 28, 195, 207, 28, 157, 52, 180, 146, 100, 181, 16, 117, 27, 31, 249, 229, 55, 147, 123, 196, 107, 93, 111, 244, 236, 200>>
  end

  test "SHA512 random" do
    for _ <- 1..100 do
      rand = random()
      assert SHA512.hash(rand) == :crypto.hash(:sha512, rand)
    end
  end

  test "SHA384 empty" do
    assert SHA512.hash384("") == <<56, 176, 96, 167, 81, 172, 150, 56, 76, 217, 50, 126, 177, 177, 227, 106, 33, 253, 183, 17, 20, 190, 7, 67, 76, 12, 199, 191, 99, 246, 225, 218, 39, 78, 222, 191, 231, 111, 101, 251, 213, 26, 210, 241, 72, 152, 185, 91>>
  end

  test "SHA384 hello world" do
    assert SHA512.hash384("Hello World!") == <<191, 215, 108, 14, 187, 208, 6, 254, 229, 131, 65, 5, 71, 193, 136, 123, 2, 146, 190, 118, 213, 130, 217, 108, 36, 45, 42, 121, 39, 35, 227, 253, 111, 208, 97, 249, 213, 207, 209, 59, 143, 150, 19, 88, 230, 173, 186, 74>>
  end

  test "SHA384 random" do
    for _ <- 1..100 do
      rand = random()
      assert SHA512.hash384(rand) == :crypto.hash(:sha384, rand)
    end
  end

  defp random do
    for _ <- 0..:rand.uniform(0x4fff), into: <<>>, do: <<:rand.uniform(0xff)>>
  end
end
