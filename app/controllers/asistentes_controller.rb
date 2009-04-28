class AsistentesController < ApplicationController
  before_filter :preconfig

  active_scaffold do |config|
    config.actions.exclude :update
    config.columns[:usuario].clear_link
    config.columns[:asiste].form_ui = :checkbox
    config.columns[:asiste].inplace_edit = :true
  end

  def preconfig
    active_scaffold_config.actions.exclude :create, :delete unless current_user.es_admin?
  end
end
