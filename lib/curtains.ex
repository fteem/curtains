defmodule Curtains do
  import Plug.Conn

  def init(_opts) do
  end

  def call(conn, _opts) do
    file = IO.puts(Application.get_env(:curtains, :curtain_file))
    case File.read(file) do
      {:ok, binary } ->
        conn
        |> put_resp_content_type("text/html")
        |> send_resp(200, binary)
        |> halt
      {:error, reason } ->
        IO.inspect reason
        conn
    end
  end
end


