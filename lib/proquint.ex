defmodule Proquint do

  @consonant_map %{0=>'b', 1=>'d', 2=>'f', 3=>'g', 4=>'h', 5=>'j', 6=>'k', 7=>'l',
    8=>'m', 9=>'n', 10=>'p', 11=>'r', 12=>'s', 13=>'t', 14=>'v', 15=>'z'}
  @vowel_map %{0=>'a', 1=>'i', 2=>'o', 3=>'u'}

  # Proquint
  # https://arxiv.org/html/0901.4016
  # Four-bits as a consonant:
  #
  #     0 1 2 3 4 5 6 7 8 9 A B C D E F
  #     b d f g h j k l m n p r s t v z
  #
  # Two-bits as a vowel:
  #
  #     0 1 2 3
  #     a i o u

  def encode(bytes) when is_binary(bytes) and rem(byte_size(bytes), 2) == 0 do
    do_encode(bytes, [])
  end

  #when is_binary(string) and rem(byte_size(string), 5) == 1
  #when is_binary(string) and byte_size(string) == 5
  def decode(string) when is_binary(string) do
    # TODO: validate
    String.split(string, "-") |> Enum.map(&decode_word/1) |> Enum.join
  end

  defp decode_word(string) when byte_size(string) == 5 do
    [con1, vow1, con2, vow2, con3] = string |> to_charlist
    <<
      consonant_decode(con1) :: size(4),
      vowel_decode(vow1) :: size(2),
      consonant_decode(con2) :: size(4),
      vowel_decode(vow2) :: size(2),
      consonant_decode(con3) :: size(4)
      >>
  end

  defp do_encode(<< word :: size(16), rest :: binary >>, acc) do
    << con1 :: size(4), vow1 :: size(2), con2 :: size(4), vow2 :: size(2), con3 :: size(4) >> = << word :: size(16) >>
    encoded_word = [
      consonant_encode(con1),
      vowel_encode(vow1),
      consonant_encode(con2),
      vowel_encode(vow2),
      consonant_encode(con3),
    ] |> Enum.join()
  do_encode(rest, [encoded_word|acc])
  end

  defp do_encode(<<>>, acc) do
    Enum.reverse(acc) |> Enum.join("-")
  end

  for {number, char} <- @consonant_map do
    defp consonant_encode(unquote(number)) do
      unquote(char)
    end

    defp consonant_decode(unquote(char|>hd)) do
      unquote(number)
    end
  end

  for {number, char} <- @vowel_map do
    defp vowel_encode(unquote(number)) do
      unquote(char)
    end
    defp vowel_decode(unquote(char|>hd)) do
      unquote(number)
    end
  end

end
