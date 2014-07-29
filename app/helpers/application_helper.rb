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
end
