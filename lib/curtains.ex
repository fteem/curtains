defmodule Curtains do
  import Plug.Conn

  def init(_opts) do
    Application.get_env(:curtains, :file_path)
  end

  def call(conn, file) do
    case File.read(file) do
      {:ok, binary } ->
        conn
        |> put_resp_content_type("text/html")
        |> send_resp(200, binary)
      {:error, reason } ->
        conn
    end
  end
end

