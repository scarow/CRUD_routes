get '/' do
  erb :index
end

post '/notes' do
  @user_input=params[:user_input]
  Note.create(text: params[:user_input])

  redirect '/'
end

get '/notes' do

  erb :list
end


get '/edit/:note_id' do
  session[:note_id] = params[:note_id]
  erb :edit
end

post '/edit' do
  Note.find(session[:note_id]).update_attribute(:text, params[:edited_note])

  erb :list
end

#DELETE METHOD NOT WORKING-- WHY?
get '/delete/:note_id' do
  Note.destroy(session[:note_id])
  erb :destroy
end


