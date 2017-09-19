require "./spec_helper"

describe Morganite do
  it "builds simple tags" do
    m = Morganite::Morganite.new

    tag = m.div
    tag.should eq("<div></div>")
  end

  it "builds tags with attributes" do
    m = Morganite::Morganite.new

    tag = m.div class: "foo"
    tag.should eq("<div class=\"foo\"></div>")
  end

  it "builds tags with a subtag" do
    m = Morganite::Morganite.new

    tag = m.div { m.div }
    tag.should eq("<div><div></div></div>")
  end

  it "builds tags with content" do
    m = Morganite::Morganite.new

    tag = m.div { "hello" }
    tag.should eq("<div>hello</div>")
  end

  it "builds tags with multiple subtags" do
    m = Morganite::Morganite.new

    tag = m.div {
      [ m.div { "hello" } ,
        m.div { "world" } ].join
    }
    tag.should eq("<div><div>hello</div><div>world</div></div>")
  end
end
