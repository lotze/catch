$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helper'

describe Catch::Note do
  before do
    @client = catch_test_client
  end

  describe "#notes" do
    before do
      stub_get("https://fooman:123123123@api.catch.com/v1/notes", "notes.json")
      @notes = @client.notes
    end

    it "retrieves a list of notes as an array" do
      @notes.must_be_instance_of Array
    end

    it "retrieves values from a note within the retrieved array" do
      @notes.first.id.must_equal 12345678
      @notes.first.text.must_equal "Lorem ipsum dolor"
    end
  end
  describe "#note" do
    before do
      stub_get("https://fooman:123123123@api.catch.com/v1/notes/12345678", "note.json")
      @note = @client.note(12345678)
    end

    it "retrieves values a note" do
      @note.id.must_equal 12345678
      @note.text.must_equal "Lorem ipsum dolor"
    end
  end
end
