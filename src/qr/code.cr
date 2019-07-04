module QR
  class Code
    getter content : String,
      version : Int32,
      level : Lib::QREncode::QRecLevel,
      hint : Lib::QREncode::QRencodeMode,
      casesensitive : Int32,
      qrcode : Lib::QREncode::QRcode

    def initialize(text,
                   @version : Int32 = 0,
                   level : (Int32 | Lib::QREncode::QRecLevel) = 0,
                   hint : (Int32 | Lib::QREncode::QRencodeMode) = 0,
                   casesensitive : (Bool | Int32) = 0,
                   @margin : Int32 = 4)
      @content = text.to_s
      @level = Lib::QREncode::QRecLevel.new(level)
      @hint = Lib::QREncode::QRencodeMode.new(hint)

      if casesensitive.is_a?(Bool)
        @casesensitive = casesensitive.to_unsafe
      else
        @casesensitive = casesensitive
      end

      @qrcode = Lib::QREncode.QRcode_encodeString8bit(@content, @version, @level).value
    end

    def self.print(text)
      new(text).print
    end

    def content=(new_content) : String
      @content = new_content.to_s
      @qrcode = ext_qrcode
      @content
    end

    def version=(new_version) : Int32
      @version = new_version
      @qrcode = ext_qrcode
      @version
    end

    def level=(new_level) : Lib::QREncode::QRecLevel
      @level = Lib::QREncode::QRecLevel.new(new_level)
      @qrcode = ext_qrcode
      @level
    end

    def hint=(new_hint) : Lib::QREncode::QRencodeMode
      @hint = Lib::QREncode::QRencodeMode.new(new_hint)
      @qrcode = ext_qrcode
      @hint
    end

    def casesensitive=(new_casesensitive) : Int32
      if casesensitive.is_a?(Bool)
        @casesensitive = new_casesensitive.to_unsafe
      else
        @casesensitive = new_casesensitive
      end

      @qrcode = ext_qrcode
      @casesensitive
    end

    def print
      realwidth = (@qrcode.width + @margin * 2)
      empty = " "
      lowhalf = "\342\226\204"
      uphalf = "\342\226\200"
      full = "\342\226\210"
      white = ""
      reset = ""

      (@margin / 2).times { realwidth.times { print(full) }; print("\n") }

      @qrcode.width.times { |y|
        top = (y % 2) == 0
        next if !top
        row1 = @qrcode.data + y * @qrcode.width
        row2 = row1 + @qrcode.width
        print(white)

        @margin.times { print(full) }

        @qrcode.width.times { |x|
          if (row1[x] & 1 == 0)
            if (top && (row2[x] & 1 == 0))
              print(full)
            else
              print(uphalf)
            end
          elsif (top && (row2[x] & 1 == 0))
            print(lowhalf)
          else
            print(empty)
          end
        }

        @margin.times { print(full) }

        print(reset)
        print("\n")
      }

      (@margin / 2).times { realwidth.times { print(full) }; print("\n") }
    end

    private def ext_qrcode
      # Lib::QREncode.QRcode_encodeString(@content, @version, @level, @hint, @casesensitive)
      Lib::QREncode.QRcode_encodeString8bit(@content, @version, @level).value
    end
  end
end
