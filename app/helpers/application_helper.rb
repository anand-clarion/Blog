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
    all_data  = User.all.collect{ |a|  [ a.name, a.city] }.flatten.uniq
    all_data << Post.all.collect{ |a|  [ a.title] }.flatten.uniq
    all_data << Comment.all.collect{ |a|  [ a.content] }.flatten.uniq
    return all_data.flatten
  end
end
