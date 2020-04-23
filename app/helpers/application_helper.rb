module ApplicationHelper
    def gravatar_for(user, options = {size: 75})
        if user.image
            image_tag(user.image, alt: user.username, class: "rounded-circle", style: "width:50px;height:50px")
        else
            gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
            size = options[:size]
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?#{size}"
            image_tag(gravatar_url, alt: user.username, class: "rounded-circle", style: "width:50px;height:50px")
        end 
    end  
end
