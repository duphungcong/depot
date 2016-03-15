module StoreHelper
  def add_span_tag_around_sub_string(str)
    if params[:search].present?

      # get sub_string from string using Regex matching
      # str = 'foobar'
      # /foo/i =~ str   => 0
      # 'foo'.length   => 3
      # str.from(0).to(3-1) => 'foo'

      i = /#{params[:search]}/i =~ str
      j = params[:search].length
      str.gsub(/#{params[:search]}/i, content_tag(:span, str.from(i).to(j - 1), :class => 'found_string'))
    else
      str
    end
  end
end
