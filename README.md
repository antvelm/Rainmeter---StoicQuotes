# Rainmeter — StoicQuote

A minimal Rainmeter skin that displays a random Stoic quote on your desktop, styled after the typography of a Roman inscription: tracked-out capitals, a serif italic body, and a thin gilded rule.

Quotes are pulled live from [stoic-quotes.com](https://www.stoic-quotes.com/).

![StoicQuote on the desktop](preview.png)

The header reads *STOICORVM VERBA* — Latin for "Words of the Stoics," spelled with `V` for `U` in the manner of Roman inscriptions.

## Features

- **Live quotes** — fetched from the stoic-quotes.com JSON API, refreshed automatically every hour.
- **Click to refresh** — click the skin to pull a new quote immediately.
- **Proper word wrapping** — long quotes break cleanly across multiple lines instead of being clipped, handled by a small Lua script.
- **No background box** — the text floats directly on your wallpaper.
- **Easy to restyle** — font, colours, line width, and position are all exposed as variables at the top of the `.ini`.

## Requirements

- [Rainmeter](https://www.rainmeter.net/) 4.0 or newer (uses the built-in WebParser plugin and Lua scripting — no extra downloads).
- An internet connection.

## Installation

1. Download or clone this repository.
2. Copy the `StoicQuote` folder into your Rainmeter skins folder, normally:

   ```
   Documents\Rainmeter\Skins\
   ```

   You should end up with `Documents\Rainmeter\Skins\StoicQuote\StoicQuote.ini`.
3. Right-click the Rainmeter tray icon → **Refresh all**.
4. Open **Manage**, select **StoicQuote → StoicQuote.ini**, and click **Load**.

## Customisation

Open `StoicQuote.ini` and edit the `[Variables]` section:

| Variable | Default | What it does |
| --- | --- | --- |
| `FontFace` | `Georgia` | Typeface for the quote and author. |
| `FontColorQuote` | `235,230,220,255` | Quote colour, as `R,G,B,A`. |
| `FontColorAccent` | `190,160,105,220` | Colour of the header, divider, and author name. |
| `MaxChars` | `42` | Characters per line before wrapping. Lower gives a narrower, taller block. |
| `CenterX` | `235` | Horizontal centre point of the text. |
| `Pad` | `15` | Padding above the header. |

Because the text has no background panel, it reads best over a darker wallpaper. To sit it somewhere specific, unlock the skin's position (right-click → **Settings → Draggable**) and drag it where you want.

## How it works

`StoicQuote.ini` uses Rainmeter's **WebParser** plugin to request `https://www.stoic-quotes.com/api/quote`, which returns:

```json
{ "text": "...", "author": "..." }
```

A single regular expression captures both fields from that response, so only one HTTP request is made per refresh.

Rainmeter's String meters don't reliably word-wrap on the `W` option alone — they clip to a single line instead. `Wrap.lua` therefore does the wrapping explicitly, breaking the quote at word boundaries every `MaxChars` characters and returning a string with real line breaks, which the meter then auto-sizes around.

## Files

| File | Purpose |
| --- | --- |
| `StoicQuote.ini` | The skin: measures, layout, and styling. |
| `Wrap.lua` | Word-wraps the quote text across multiple lines. |
| `preview.png` | Screenshot used in this README. |

## Credits

Quotes provided by [stoic-quotes.com](https://www.stoic-quotes.com/). This skin is an independent project and is not affiliated with or endorsed by them.

## License

Released under the [MIT License](LICENSE) — use it, modify it, and redistribute it however you like.
