require 'rspec/expectations'

RSpec::Matchers.define :be_same_book_as do |expected|
  match do |actual|
    reader_methods_for(expected).each do |r|
      expected.send(r).should == actual.send(r)
    end
  end

  failure_message_for_should do |actual|
    actual_outputs = reader_methods_for(actual).collect { |c| actual.send(c) }
    expected_outputs = reader_methods_for(expected).collect { |c| expected.send(c) }
    "The actual outputs (#{actual_outputs}) differ from the expected ones (#{expected_outputs})"
  end

  def reader_methods_for(object)
    object.fields.keys - %w(_id _type)
  end
end
