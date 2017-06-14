module ApplicationHelper

  def form_group_tag(errors, &block) #PS: errors is an array || & turns the block into a Proc(reusable block like a variable)
     css_class = 'form-group'
     css_class << ' has-error' if errors.any?

     content_tag :div, capture(&block), class: css_class #build HTML & CSS to display form element & associated errors.
   end

   def avatar_url(user)
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
   end
   
end
