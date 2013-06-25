require 'mocha'
require File.join(File.dirname(__FILE__), '..', 'liquid-picturefill/parser')

Rspec.configure do |c|
  c.mock_with :mocha
end

describe Parser do

  describe '##initialize' do
    it 'reads a hard coded yaml file' do
      YAML.stubs(:load_file)
      Parser.any_instance.expects(:read_yaml)
      Parser.new
    end
  end

  describe '#read_yaml' do
    it 'loads the correct file' do
      subject.stubs(file_name: 'test/_config.yml')
      subject.read_yaml
    end
  end

  describe '#file_name' do
    it 'returns a garbage filename for now' do
      subject.file_name.should == 'test/_config.yml'
    end
  end

end
