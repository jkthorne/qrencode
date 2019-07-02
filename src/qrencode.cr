require "./lib/*"

module QREncode
  VERSION = "0.1.0"

  def self.start(input)
    level = Lib::QREncode::QRecLevel::QrEclevelH
    # level = Lib::QREncode::QRecLevel::QrEclevelM
    mode = Lib::QREncode::QRencodeMode::QrMode8
    # mode = Lib::QREncode::QRencodeMode::QrModeAn
    Lib::QREncode.QRcode_encodeString8bit(input.to_s, 0, level).value
    # Lib::QREncode.QRcode_encodeString(input.to_s, 0, level, mode, 0).value
  end
end

qrc = QREncode.start("yolo")
pp qrc
pp qrc.data

pp String.new(Slice.new(qrc.data, qrc.width))
