module PostsHelper
  def change_hash(post)
    h(post).gsub(/#[\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/posts/hashtag/#{word}".delete('#') }.html_safe
  end

  def image_check(image)
    if image.present?
      image
    else
      ""
    end
  end
end