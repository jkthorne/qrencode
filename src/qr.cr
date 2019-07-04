require "./lib/*"
require "./qr/*"

module QR
  def self.encode(text)
    Code.new(text)
  end

  def self.print(text)
    Code.print(text)
  end
end
