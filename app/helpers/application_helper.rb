module ApplicationHelper
  
  # This action give activcation/deactivation status
  def check_activation_status(id, model)
    status = model.find(id)
    if status.is_active == true
      "deactivate"
    else
      "activate"
    end
  end

  # This action fetch data from all tables for autocomplete functionlity
  def table_data() 
    all_data  = User.all.collect { |a| [a.name.strip, a.city.strip] }.flatten.uniq
    all_data << Post.all.collect { |a| [a.title.strip] }.flatten.uniq
    all_data << Comment.all.collect { |a| [a.content.strip] }.flatten.uniq
    all_data.flatten.uniq
  end
  
end
