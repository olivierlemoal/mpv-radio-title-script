# mpv-radio-title-script

This script fetch radio current playing title directly from the radio website when it is not announced by the stream.

![example](/readme.png)

Currently compatible radios are currently only French radio :

  * FIP (all radios)
  * France Inter
  * France Musique
  * France culture
  * TSF Jazz
  * RFI

It should be easy to add support for any radio, editing the `radio_title_helper`. Just create a parser function that returns title and add your radio to `INDEX` :
```python
INDEX = [
    {"name": "TSF Jazz",
     "pattern": "tsfjazz", # Pattern to be found in stream url sent by lua script
     "url": "https://api.tsfjazz.com/api/tracklists/current/TSF?radio=TSF",
     "parser": parser_tsfjazz},
     },
     # [...]
]
```

Then add your radio to the `radio_title.lua` config.


## Config

Edit `radio_title.lua`

```lua
local settings = {
    radio_title_helper = "/usr/local/bin/radio_title_helper", -- Path to Radio title helper
    interval = 10, -- Renew every 10 seconds (default)
    radios = {"fip", "franceculture", "francemusique", "tsfjazz", "franceinter"}, -- enable script for these radios (keyword must be in stream url)
}
```

## Install

```bash
git clone https://github.com/olivierlemoal/mpv-radio-title-script
mv mpv-radio-title-script/radio_title_helper /usr/local/bin/
mv mpv-radio-title-script/radio_title.lua ~/.config/mpv/script
python3 -m pip install --user -r mpv-radio-title-script/requirements.txt
```



