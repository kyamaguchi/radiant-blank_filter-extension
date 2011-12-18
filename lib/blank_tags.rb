module BlankTags
  include Radiant::Taggable

  desc "Filters its contents with the Blank filter."
  tag 'blank' do |tag|
    BlankFilter.filter(tag.expand)
  end
end
