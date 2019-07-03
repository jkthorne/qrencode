module Lib
  @[Link("qrencode")]
  lib QREncode
    type QRinput = Void*

    struct QRcode
      version : LibC::Int
      width : LibC::Int
      data : UInt8*
    end

    fun QRcode_encodeInput(input : QRinput) : QRcode*
    enum QRecLevel
      QrEclevelL = 0
      QrEclevelM = 1
      QrEclevelQ = 2
      QrEclevelH = 3
    end
    enum QRencodeMode
      QrModeNul        = -1
      QrModeNum        =  0
      QrModeAn         =  1
      QrMode8          =  2
      QrModeKanji      =  3
      QrModeStructure  =  4
      QrModeEci        =  5
      QrModeFnc1First  =  6
      QrModeFnc1Second =  7
    end
    fun QRcode_encodeString(string : LibC::Char*, version : LibC::Int, level : QRecLevel, hint : QRencodeMode, casesensitive : LibC::Int) : QRcode*
    fun QRcode_encodeString8bit(string : LibC::Char*, version : LibC::Int, level : QRecLevel) : QRcode*
    fun QRcode_encodeStringMQR(string : LibC::Char*, version : LibC::Int, level : QRecLevel, hint : QRencodeMode, casesensitive : LibC::Int) : QRcode*
    fun QRcode_encodeString8bitMQR(string : LibC::Char*, version : LibC::Int, level : QRecLevel) : QRcode*
    fun QRcode_encodeData(size : LibC::Int, data : UInt8*, version : LibC::Int, level : QRecLevel) : QRcode*
    fun QRcode_encodeDataMQR(size : LibC::Int, data : UInt8*, version : LibC::Int, level : QRecLevel) : QRcode*
    fun QRcode_free(qrcode : QRcode*)
    type QRinputStruct = Void*

    struct X_QRcodeList
      code : QRcode*
      next : X_QRcodeList*
    end

    type QRcodeList = X_QRcodeList
    fun QRcode_encodeInputStructured(s : QRinputStruct) : QRcodeList*
    fun QRcode_encodeStringStructured(string : LibC::Char*, version : LibC::Int, level : QRecLevel, hint : QRencodeMode, casesensitive : LibC::Int) : QRcodeList*
    fun QRcode_encodeString8bitStructured(string : LibC::Char*, version : LibC::Int, level : QRecLevel) : QRcodeList*
    fun QRcode_List_size(qrlist : QRcodeList*) : LibC::Int
    fun QRcode_List_free(qrlist : QRcodeList*)
    fun QRcode_APIVersion(major_version : LibC::Int*, minor_version : LibC::Int*, micro_version : LibC::Int*)
    fun QRcode_clearCache
  end
end
