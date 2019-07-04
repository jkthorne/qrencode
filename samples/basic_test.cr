require "../src/qr"

qr_code = QR.encode("this is a smoke test")
qr_code.level = 3
qr_code.print