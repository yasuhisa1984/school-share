module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name, class: "img-circle") if user.avatar?

    if user.provider.blank?
      img_url = 'no_image.png'
    else
      img_url = user.image_url
    end
    image_tag(img_url, alt: user.name, class: "img-circle")
  end
end
