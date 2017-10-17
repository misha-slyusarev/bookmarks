module BookmarksHelper
  def concat_tag_list(tag_list)
    capture do
      tag_list.split.each do |tag|
        concat(content_tag(:span, tag, class: "tag label label-info"))
        concat ' '
      end
    end
  end
end
