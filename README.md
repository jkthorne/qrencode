# qrencode

A library to convert text or data to a QR Code

## Installation

1. Dependencies

  install qrencode

  a. MacOS

    ```shell
      brew install qrencode
    ```

  b. Ubuntu

    ```shell
      sudo apt install qrencode
    ```

2. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     qrencode:
       github: wontruefree/qrencode
   ```

3. Run `shards install`

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

[![asciicast](https://raw.githubusercontent.com/wontruefree/qrencode/master/demo.gif)](https://raw.githubusercontent.com/wontruefree/qrencode/master/demo.gif)

## Contributors

- [Jack Thorne](https://github.com/your-github-user) - creator and maintainer
