require 'spec_helper'

describe HTML::Pipeline::WistiaFilter do
  subject { HTML::Pipeline::WistiaFilter }
  let(:wistia_url) { "https://spark59.wistia.com/medias/yq6dhu6cig" }

  it 'has a version number' do
    expect(HTML::Pipeline::Wistia::VERSION).not_to be nil
  end

  context "With other filter's result" do
    it "doesn't affect links in markdown" do
      markdown_link = "[Video](https://spark59.wistia.com/medias/yq6dhu6cig)"

      expect(subject.to_html(markdown_link)).to eq(markdown_link)
    end

    it "doesn't affect links in html tag" do
      hyper_link = %(<a href="https://spark59.wistia.com/medias/yq6dhu6cig">Video</a>)

      expect(subject.to_html(hyper_link)).to eq(hyper_link)
    end

    it "does affect links in a div" do
      hyper_link = %(<div>https://spark59.wistia.com/medias/yq6dhu6cig</div>)

      expect(subject.to_html(hyper_link)).to eq(
        %(<div>\n\n<div class="video wistia"><iframe src="//fast.wistia.net/embed/iframe/yq6dhu6cig?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" lass="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="640" height="360"></iframe><script src="//fast.wistia.net/assets/external/iframe-api-v1.js"></script></div></div>)
      )
    end
    it "does affect links after a br" do
      hyper_link = %(<br>https://spark59.wistia.com/medias/yq6dhu6cig)

      expect(subject.to_html(hyper_link)).to eq(
        %(<br>\n\n<div class="video wistia"><iframe src="//fast.wistia.net/embed/iframe/yq6dhu6cig?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" lass="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="640" height="360"></iframe><script src="//fast.wistia.net/assets/external/iframe-api-v1.js"></script></div>)
      )
    end
    it "does not consume whitespace" do
      source = 'Check out https://spark59.wistia.com/medias/yq6dhu6cig'
      expect(subject.to_html(source)).to eq(
        %(Check out \n\n<div class="video wistia"><iframe src="//fast.wistia.net/embed/iframe/yq6dhu6cig?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" lass="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="640" height="360"></iframe><script src="//fast.wistia.net/assets/external/iframe-api-v1.js"></script></div>)
      )
    end
    it "supports /embed URLs" do
      source = 'http://fast.wistia.com/embed/medias/po0vtz6jix'
      expect(subject.to_html(source)).to eq(
        %(\n\n<div class="video wistia"><iframe src="//fast.wistia.net/embed/iframe/po0vtz6jix?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" lass="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="640" height="360"></iframe><script src="//fast.wistia.net/assets/external/iframe-api-v1.js"></script></div>)
      )
    end
  end
end
