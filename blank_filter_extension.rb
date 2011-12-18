# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class BlankFilterExtension < Radiant::Extension
  version "1.0"
  description "This filter removes blank lines and trailing spaces."
  url "http:///github.com/kyamaguchi/radiant-blank_filter-extension"

  def activate
    BlankFilter
    Page.send :include, BlankTags
  end
end
