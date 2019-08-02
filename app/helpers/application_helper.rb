module ApplicationHelper
    def avatar_for(user)
        avatar_id=user.username
        avatar_url="https://robohash.org/#{avatar_id}"
        image_tag(avatar_url,alt: user.username,class: "img-circle")

    end    
end
