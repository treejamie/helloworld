defmodule Hello.Greetings do
  @moduledoc """
  Provides a simple Elixir interface to load **"Hello, World!" greetings**
  from a CSV file.

  The CSV is expected to have multiple rows with the greeting in the **second column**.
  """


  @doc """
  Loads the list of greetings from `hello_world_30_languages.csv`.

  ## Returns

  A list of strings, each representing a translated "Hello, World!" message.

  ## Example

      iex> Hello.Greetings.load_greetings()
      ["Hello, world!", "Hello, world!", "¡Hola, mundo!", "Bonjour, le monde!",
      "Hallo, Welt!", "Ciao, mondo!", "Olá, mundo!", "Привет, мир!",
      "你好，世界！", "こんにちは、世界！",
      "안녕하세요, 세계!", "مرحبا بالعالم!",
      "नमस्ते दुनिया!", "ওহে বিশ্ব!",
      "Merhaba, dünya!", "Witaj, świecie!", "Привіт, світе!",
      "سلام دنیا!", "Hej, världen!", "Hei, verden!", "Hej, verden!",
      "Hei, maailma!", "Ahoj, světe!", "Γειά σου, κόσμε!",
      "שלום, עולם!", "Halo, dunia!", "Halo, dunia!",
      "Xin chào, thế giới!", "สวัสดีชาวโลก!",
      "Hallo, wereld!", "Salut, lume!"]

  ## Notes

  - Assumes the CSV file is located **one level above** the current directory.
  - Uses `CSV.decode!/1` to parse rows.
  - Extracts the **second column** from each row (ignores language code and extras).
  """
  def load_greetings() do
    File.stream!("../hello_world_30_languages.csv")
    |> CSV.decode!()
    |> Enum.to_list()
    |> Enum.map(fn [_, greeting | _] -> greeting end)
  end
end
