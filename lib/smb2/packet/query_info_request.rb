require 'smb2/packet'

class Smb2::Packet
  class QueryInfoRequest < Smb2::Packet
    nest :header, RequestHeader

    unsigned :struct_size, 16, default: 41
    unsigned :info_type, 8
    unsigned :file_info_class, 8
    unsigned :output_buffer_length, 32

    data_buffer :input_buffer, 32, padding: 16

    unsigned :additional_information, 32
    unsigned :flags, 32

    string :file_id, 128

    rest :buffer
  end

end
