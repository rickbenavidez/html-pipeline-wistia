module HTML
  class Pipeline
    class WistiaFilter < TextFilter
      def call
        #
        # This filter converts wistia embed or medial url into a wistia embed.
        #
        regex = /(?<!">|"|\()https?:\/\/(?:\w+\.)?(?:wistia\.com)\/(?:embed\/)?(?:medias)\/([A-Za-z0-9_-]{4,15})/
        @text.gsub(regex) do
          wistia_id = $1
          # Prefix with two "\n" for compatibility with markup such as Markdown:
          %{\n\n<div class="video wistia"><iframe src="//fast.wistia.net/embed/iframe/#{wistia_id}?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" lass="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="640" height="360"></iframe><script src="//fast.wistia.net/assets/external/iframe-api-v1.js"></script></div>}
        end
      end
    end
  end
end
