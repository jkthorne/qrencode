# qrencode

A library to convert text or data to a QR Code

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     qrencode:
       github: wontruefree/qrencode
   ```

2. Run `shards install`

## Usage

### Quickstart

```crystal
require "qrencode"

QR.print("this is a smoke test")
```

### Construct Object

```crystal
require "qrencode"

qr_code = QR.encode("this is a smoke test")
qr_code.level = 3
qr_code.print
```

## Demo

[![asciicast](https://asciinema.org/a/XH1fGZAonWgXcellTCudwqs1Q.png)](https://asciinema.org/a/XH1fGZAonWgXcellTCudwqs1Q?autoplay=1)

## Contributors

- [Jack Thorne](https://github.com/your-github-user) - creator and maintainer
