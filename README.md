# Curtains

**Please note, this is still in development.**

Curtains is a Elixir package that "takes over" your Elixir website by returning 
content of a specified file (if it exists). This makes it perfect for "Under construction" 
and "Maintenance" pages. At it's heart, it's just a Plug.

## Installation

The package can be installed as:

  1. Add curtains to your list of dependencies in `mix.exs`:

        def deps do
          [{:curtains, "~> 0.0.1"}]
        end

  2. Ensure curtains is started before your application:

        def application do
          [applications: [:curtains]]
        end

  3. Run ```mix deps.get```

## Usage

Add ```Curtains``` to your desired pipeline in the router. For example:

```elixir
defmodule MyApp.Router do
  use MyApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Curtains
  end

  ...
end
```

With this config, Curtains will take over any browser requests coming to the 
application and will display the default Curtains page:

![Curtains](http://imgreview.com/i/gVLvB?w=1920)

## Changing the default curtain

In your ```config.exs``` or ```<env>.exs``` file, add:

```elixir
config :curtains, curtain_file: "/path/to/any/file.html"
```

Make sure you restart your application after changing the config.

## Using static assets in the curtain page

Make sure that the **host** application is serving the static assets you 
want to use on the curtain HTML page.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

  Copyright © 2015 Ilija Eftimov <ileeftimov@gmail.com>

  This work is free. You can redistribute it and/or modify it under the
  terms of the MIT License. See the LICENSE file for more details.
