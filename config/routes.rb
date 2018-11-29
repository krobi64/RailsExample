Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/questions/sync', controller: :questions, action: :sync_questions
  post '/questions/purge', controller: :questions, action: :purge_answered_questions
end
