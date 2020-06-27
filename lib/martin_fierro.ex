defmodule MartinFierro do
  def write do
    {:ok, martin_fierro} = leer()

    martin_fierro
    |> ordenar_alfabeticamente()
    |> escribir()
  end

  defp leer() do
    case File.read("lib/martin_fierro.txt") do
      {:ok, file} -> {:ok, file |> String.split("\n", trim: true)}
      {:error, error} -> {:error, error}
    end
  end

  defp ordenar_alfabeticamente(martin_fierro) do
    martin_fierro
    |> Enum.map(&String.capitalize/1)
    |> Enum.sort()
  end

  defp escribir(martin_fierro) do
    poema = martin_fierro |> Enum.join("\n")

    File.write!("lib/martin_fierro_ordenado_alfabeticamente.txt", poema)
  end
end
