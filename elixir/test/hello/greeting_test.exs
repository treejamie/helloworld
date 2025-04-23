defmodule Hello.Greetings.Tests do
  use ExUnit.Case
  alias Hello.Greetings
  doctest Hello.Greetings

  test "load_greetings" do
    # Here's the greetings
    x = [
      "Hello, world!",
      "Hello, world!",
      "¡Hola, mundo!",
      "Bonjour, le monde!",
      "Hallo, Welt!",
      "Ciao, mondo!",
      "Olá, mundo!",
      "Привет, мир!",
      "你好，世界！",
      "こんにちは、世界！",
      "안녕하세요, 세계!",
      "مرحبا بالعالم!",
      "नमस्ते दुनिया!",
      "ওহে বিশ্ব!",
      "Merhaba, dünya!",
      "Witaj, świecie!",
      "Привіт, світе!",
      "سلام دنیا!",
      "Hej, världen!",
      "Hei, verden!",
      "Hej, verden!",
      "Hei, maailma!",
      "Ahoj, světe!",
      "Γειά σου, κόσμε!",
      "שלום, עולם!",
      "Halo, dunia!",
      "Halo, dunia!",
      "Xin chào, thế giới!",
      "สวัสดีชาวโลก!",
      "Hallo, wereld!",
      "Salut, lume!"


    # and we have what we expected
    assert x == Greetings.load_greetings()
  end
end
