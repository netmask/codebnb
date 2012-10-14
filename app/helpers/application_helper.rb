module ApplicationHelper

  def gravatar_image(email, size)
    hash = Digest::MD5.hexdigest(email)
    "https://secure.gravatar.com/avatar/#{hash}?s=#{size}"
  end

  def select_tab(tab)
    if controller_name == tab
      'active'
    end
  end
end
