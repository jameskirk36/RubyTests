require_relative "../src/bracket_extractor.rb"

describe "bracket extractor" do
  before do
    @bracket_extractor = BracketExtractor.new
    @bracket_extractor.set_bracket_chars("(",")")
  end

  it "should extract innermost bracket simple" do
    expect(@bracket_extractor.extract_innermost_bracket_section_from("(inner)")).to eq("(inner)")
  end

  it "should extract innermost bracket from nested brackets" do
    expect(@bracket_extractor.extract_innermost_bracket_section_from("((inner)outer)")).to eq("(inner)")
  end

end
