require 'spec_helper'

describe HTML::Pipeline::WistiaFilter do
  subject { HTML::Pipeline::WistiaFilter }
  let(:wistia_url) { "https://spark59.wistia.com/medias/yq6dhu6ggg" }

  it 'has a version number' do
    expect(HTML::Pipeline::Wistia::VERSION).not_to be nil
  end

  context "With other filter's result" do
    it "doesn't affect links in markdown" do
      markdown_link = "[Video](https://spark59.wistia.com/medias/yq6dhu6ggg)"

      expect(subject.to_html(markdown_link)).to eq(markdown_link)
    end

    it "doesn't affect links in html tag" do
      hyper_link = %(<a href="https://spark59.wistia.com/medias/yq6dhu6ggg">Video</a>)

      expect(subject.to_html(hyper_link)).to eq(hyper_link)
    end

    it "does affect in isolation with no tag" do
      text = %(<strong>1. Test<br><br></strong>https://spark59.wistia.com/medias/yq6dhu6ggg<br><br>)
      expect(subject.to_html(text)).to eq(
        %(<strong>1. Test<br><br></strong>\n\n<div class="video wistia" data-wistia-id="yq6dhu6ggg"><iframe src="//fast.wistia.net/embed/iframe/yq6dhu6ggg?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="640" height="360" style=""></iframe><script src="//fast.wistia.net/assets/external/E-v1.js" async></script></div><br><br>)
      )
    end

    it "does affect links in a div" do
      hyper_link = %(<div>https://spark59.wistia.com/medias/yq6dhu6ggg</div>)

      expect(subject.to_html(hyper_link)).to eq(
        %(<div>\n\n<div class="video wistia" data-wistia-id="yq6dhu6ggg"><iframe src="//fast.wistia.net/embed/iframe/yq6dhu6ggg?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="640" height="360" style=""></iframe><script src="//fast.wistia.net/assets/external/E-v1.js" async></script></div></div>)
      )
    end
    it "does affect links after a br" do
      hyper_link = %(<br>https://spark59.wistia.com/medias/yq6dhu6ggg)

      expect(subject.to_html(hyper_link)).to eq(
        %(<br>\n\n<div class="video wistia" data-wistia-id="yq6dhu6ggg"><iframe src="//fast.wistia.net/embed/iframe/yq6dhu6ggg?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="640" height="360" style=""></iframe><script src="//fast.wistia.net/assets/external/E-v1.js" async></script></div>)
      )
    end
    it "does not consume whitespace" do
      source = 'Check out https://spark59.wistia.com/medias/yq6dhu6ggg'
      expect(subject.to_html(source)).to eq(
        %(Check out \n\n<div class="video wistia" data-wistia-id="yq6dhu6ggg"><iframe src="//fast.wistia.net/embed/iframe/yq6dhu6ggg?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="640" height="360" style=""></iframe><script src="//fast.wistia.net/assets/external/E-v1.js" async></script></div>)
      )
    end
    it "supports /embed URLs" do
      source = 'http://fast.wistia.com/embed/medias/po0vtz6ggg'
      expect(subject.to_html(source)).to eq(
        %(\n\n<div class="video wistia" data-wistia-id="po0vtz6ggg"><iframe src="//fast.wistia.net/embed/iframe/po0vtz6ggg?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="640" height="360" style=""></iframe><script src="//fast.wistia.net/assets/external/E-v1.js" async></script></div>)
      )
    end
  end

  context "With options" do
    it "generated iframe with custom option" do
      source = 'http://fast.wistia.com/embed/medias/po0vtz6ggg'
      result = subject.to_html(
        source,
        style: 'border-radius: 10px;'
      )

      expect(result).to eq(
        %(\n\n<div class="video wistia" data-wistia-id="po0vtz6ggg"><iframe src="//fast.wistia.net/embed/iframe/po0vtz6ggg?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="640" height="360" style="border-radius: 10px;"></iframe><script src="//fast.wistia.net/assets/external/E-v1.js" async></script></div>)
      )
    end
  end
end
