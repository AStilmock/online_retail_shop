module ApplicationHelper
  def ui_flash_variant(key)
    case key.to_sym
    when :notice then :notice
    when :alert then :alert
    else :info
    end
  end
end
