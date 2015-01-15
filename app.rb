require('sinatra')
require('sinatra/reloader')
also_reload("./lib/**/*.rb")
require("./lib/definitions")
require("./lib/dictionary")


get('/') do
  @dictionaries = Dictionary.all()
  erb(:index)
end

post('/dictionary') do
  name = params.fetch('dictionary_name')
  Dictionary.new(name).save()
  @dictionaries = Dictionary.all()
  erb(:index)
end

post('/terms') do
  new_term = params.fetch('new_term')
  definition = params.fetch('definition')
  @term = Term.new(new_term, definition)
  @term.save()
  id = params.fetch("dictionary_id").to_i
  @dictionary = Dictionary.find(id)
  @dictionary.add_term(@term)
  erb(:dictionary)
end

get('/dictionary/:id') do
  id = params.fetch("id").to_i
  @dictionary = Dictionary.find(id)
  erb(:dictionary)
end

get('/all_terms/:id') do
  id = params.fetch("id").to_i
  @all_terms = Term.find(id)
  erb(:definitions)
end
