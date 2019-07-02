module Lib
  @[Link("qrencode")]
  lib QREncode
    enum QRecLevel
      QrEclevelL = 0
      QrEclevelM = 1
      QrEclevelQ = 2
      QrEclevelH = 3
    end
    enum QRencodeMode
      QrModeNul = -1
      QrModeNum = 0
      QrModeAn = 1
      QrMode8 = 2
      QrModeKanji = 3
      QrModeStructure = 4
      QrModeEci = 5
      QrModeFnc1First = 6
      QrModeFnc1Second = 7
    end
    struct QRcode
      version : LibC::Int
      width : LibC::Int
      data : UInt8*
    end
    fun QRcode_encodeString(string : LibC::Char*, version : LibC::Int, level : QRecLevel, hint : QRencodeMode, casesensitive : LibC::Int) : QRcode*
    fun QRcode_encodeString8bit(string : LibC::Char*, version : LibC::Int, level : QRecLevel) : QRcode*
    fun QRcode_encodeData(size : LibC::Int, data : UInt8*, version : LibC::Int, level : QRecLevel) : QRcode*
    type QRinput = Void*
    fun QRinput_new : QRinput
    fun QRinput_append(input : QRinput, mode : QRencodeMode, size : LibC::Int, data : UInt8*) : LibC::Int
    fun QRcode_encodeInput(input : QRinput) : QRcode*
    fun QRcode_free(qrcode : QRcode*)
    type QRinputStruct = Void*
    fun QRinput_Struct_new : QRinputStruct
    fun QRinput_Struct_appendInput(s : QRinputStruct, input : QRinput) : LibC::Int
    fun QRinput_Struct_insertStructuredAppendHeaders(s : QRinputStruct) : LibC::Int
  end
end
