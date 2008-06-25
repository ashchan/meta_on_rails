module MetaOnRails
  
  def set_meta(meta = {})
    @meta = meta
  end
  
  def display_meta(default = {})
    @meta ||= {}
    #@meta.reverse_merge!(default)
    @meta = default.merge(@meta)
    @meta.map do |m|
      "<meta name=\"#{m[0]}\" content=\"#{normalize(m[1])}\" />"
    end.join("\n")
  end
  
  private
  def normalize(s)
    s.gsub(/<\/?[^>]*>/, '')
  end
  
end
