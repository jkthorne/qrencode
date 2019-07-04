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

[![asciicast](https://asciinema.org/a/XH1fGZAonWgXcellTCudwqs1Q.svg)](https://asciinema.org/a/XH1fGZAonWgXcellTCudwqs1Q)

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/wontruefree/qrencode/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Jack Thorne](https://github.com/your-github-user) - creator and maintainer
