require "./lib/*"

module QREncode
  VERSION = "0.1.0"

  def self.start(input)
    level = Lib::QREncode::QRecLevel::QrEclevelH
    Lib::QREncode.QRcode_encodeString8bit(input.to_s, 0, level).value
    # level = Lib::QREncode::QRecLevel::QrEclevelM
    # mode = Lib::QREncode::QRencodeMode::QrMode8
    # mode = Lib::QREncode::QRencodeMode::QrModeAn
    # Lib::QREncode.QRcode_encodeString(input.to_s, 0, level, mode, 0).value
  end
end

qrc = QREncode.start("https://www.kilmer.co/")

## UTF-8
# empty = " "
# lowhalf = "\342\226\204"
# uphalf = "\342\226\200"
# full = "\342\226\210"

# # white = "\033[40;37;1m"
# # reset = "\033[0m"
# white = ""
# reset = ""

# qrc.width.times { |y|
#   row1 = qrc.data + (qrc.width + y)
#   row2 = row1 + qrc.width

#   print white

#   qrc.width.times { |x|
#     if (row1[x] & 1)
#       if (y < (qrc.width - 1) && (row2[x] & 1))
#         print(empty)
#       else
#         print(lowhalf)
#       end
#     elsif (y < (qrc.width - 1) && (row2[x] & 1))
#       print(uphalf)
#     else
#       print(full)
#     end
#   }

#   print(reset)
#   print("\n")
# }


## ASCII
# white = "\033[47m";
# white_s = 5;
# black = "\033[40m";
# black_s = 5;

# black = '#';
# white = ' ';

# # white = "\033[48;5;231m";
# # white_s = 11;
# # black = "\033[48;5;16m";
# # black_s = 10;

# size = 1

# margin = 4
# realwidth = (qrc.width + margin * 2) * size;
# buffer_s = (realwidth * white_s) * 2
# buffer = IO::Memory.new(buffer_s)

# p = qrc.data

# qrc.width.times { |y|
#   row = (qrc.data.value + (y * qrc.width))
#   last = 0

#   qrc.width.times { |x|
#     print "%3d" % qrc.data[x * y]
#     if((row + x) & 0x1)
#       if (last != 1)
#         # print black
#         last = 1;
#       end
#     elsif(last != 0)
#       # print white
#       last = 0;
#     end

#     # print "  "
#   }

#   if( last != 0 )
#     print white
#   end
#   print "\033[0m\n"
#   puts
# }

margin = 4
realwidth = (qrc.width + margin * 2);

empty = " ";
lowhalf = "\342\226\204";
uphalf = "\342\226\200";
full = "\342\226\210";
white = "";
reset = "";

(margin / 2).times { realwidth.times{print(full)}; print("\n") }

qrc.width.times { |y|
  top = (y % 2) == 0
  next if !top
  row1 = qrc.data + y * qrc.width;
  row2 = row1 + qrc.width;

  print(white)

  margin.times { print(full) }

  qrc.width.times { |x|
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

  margin.times { print(full) }

  print(reset)
  print("\n")
}

(margin / 2).times { realwidth.times{print(full)}; print("\n") }
