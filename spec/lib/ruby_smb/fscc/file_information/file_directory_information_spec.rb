require 'spec_helper'

RSpec.describe RubySMB::Fscc::FileInformation::FileDirectoryInformation do

  subject(:struct) { described_class.new }

  it { should respond_to :next_offset }
  it { should respond_to :file_index }
  it { should respond_to :create_time }
  it { should respond_to :last_access }
  it { should respond_to :last_write }
  it { should respond_to :last_change }
  it { should respond_to :end_of_file }
  it { should respond_to :allocation_size }
  it { should respond_to :file_attributes }
  it { should respond_to :file_name_length }
  it { should respond_to :file_name }

  it 'is little endian' do
    expect(described_class.fields.instance_variable_get(:@hints)[:endian]).to eq :little
  end

  it 'tracks the creation time in a Filetime field' do
    expect(struct.create_time).to be_a RubySMB::Field::FileTime
  end

  it 'tracks the last access time in a Filetime field' do
    expect(struct.last_access).to be_a RubySMB::Field::FileTime
  end

  it 'tracks the last write time in a Filetime field' do
    expect(struct.last_write).to be_a RubySMB::Field::FileTime
  end

  it 'tracks the last modified time in a Filetime field' do
    expect(struct.last_change).to be_a RubySMB::Field::FileTime
  end

  it 'contains the file attributes of the file' do
    expect(struct.file_attributes).to be_a RubySMB::Fscc::FileAttributes
  end


end