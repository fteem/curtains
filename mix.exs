defmodule Curtains.Mixfile do
  use Mix.Project

  def project do
    [
      app: :curtains,
      version: "0.0.1",
      elixir: "~> 1.1",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      package: package
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger],
      env: [curtain_file: Path.join([Mix.Project.deps_path, "curtains", "public", "curtains.html"])]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:plug, "~> 1.0.2"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.10", only: :dev}
    ]
  end

  defp package do
    [# These are the default files included in the package
     files: ["lib", "mix.exs", "README*", "LICENSE", "public"],
     maintainers: ["Ilija Eftimov"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/fteem/curtains",
              "Docs" => "http://hexdocs.pm/curtains"}]
  end
end
