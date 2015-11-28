module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
    array = []

    resource.errors.each do |key, value|
        array << <<-HTML
        <div class="alert alert-danger alert-dismissible" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          #{key} #{value}
        </div>
          HTML
    end 

    array.join("").html_safe
  end
end