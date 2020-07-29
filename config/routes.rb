# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'hide_journal/:journal_id', to: 'journals#hide_journal', as: 'hide_journal'