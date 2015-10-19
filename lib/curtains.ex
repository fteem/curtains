defmodule Curtains do
  import Plug.Conn

  def init(_opts) do
    IO.puts "HERE!"
    IO.puts Application.get_env(:curtains, :curtain)
    IO.puts Application.get_all_env(:rumbl)
  end

  def call(conn, file) do
    case File.read(file) do
      {:ok, binary } ->
        conn
        |> put_resp_content_type("text/html")
        |> send_resp(200, binary)
      {:error, reason } ->
        IO.inspect reason
        conn
    end
  end
end


