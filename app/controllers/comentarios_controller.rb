class ComentariosController < ApplicationController
  active_scaffold :comentario do |config|
    config.create.columns = :texto
    config.actions.exclude :update, :delete
  end
  
  def before_create_save(record)
    record.usuario_id = current_user.id
  end
  
end
