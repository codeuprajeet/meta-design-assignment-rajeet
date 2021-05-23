Rails.application.routes.draw do

  root 'uploadsheets#get_excel'
  match 'upload_excel', to: 'uploadsheets#upload_excel', via: [:post, :get]

end
