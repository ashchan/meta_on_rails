module MetaOnRails
  def set_meta(meta = {})
    @meta = meta
  end
  
  def display_meta(default = {})
    meta = default.merge(@meta||{}).reject{|k,v|v.blank?}
    meta.map do |key,value|
      %Q[<meta name="#{key}" content="#{normalize(value)}"/>]
    end.join("\n")
  end
  
  private

  def normalize(s)
    s.gsub(/<\/?[^>]*>/, '').gsub('"',"'")
  end
end
