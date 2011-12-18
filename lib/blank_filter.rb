class BlankFilter < TextFilter
  description_file File.dirname(__FILE__) + "/../blank.html"

  def filter(text)
    Array(text).reject{|line| line =~ /^\s*$/ }.map{|line| line.chomp=~/\s+$/ ? line.gsub(/\s+$/,'')+"\r\n" : line.chomp+"\r\n" }.to_s
  end
end
