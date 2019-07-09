module ApplicationHelper
    
    def full_title(page_name = "")
        base_title = "TeamlabApp"
        if page_name.empty?
            base_title
        else
            page_name + " | " + basetitle
        end
    end
end
