module ApplicationHelper
    def gravatar_for(user, options = {size: 80})
        if user.image
            image_tag(user.image, alt: user.username, class: "img-circle")
        else
            gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
            size = options[:size]
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?#{size}"
            image_tag(gravatar_url, alt: user.username, class: "img-circle")
        end 
    end  
end
