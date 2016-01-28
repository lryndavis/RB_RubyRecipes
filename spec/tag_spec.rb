require('spec_helper')

describe(Tag) do
  it("converts the tag to titlecase") do
    tag = Tag.create({:category => "vegan"})
    expect(tag.category()).to(eq("Vegan"))
    end

  it("validates presence of a tag entry") do
    tag = Tag.new({:category => ""})
    expect(tag.save()).to(eq(false))
  end
end
