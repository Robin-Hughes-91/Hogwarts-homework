require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/student')
require_relative('./models/house')

get "/" do
  erb(:home)
end

get '/students' do
  @students = Student.all
  erb(:index)
end

get '/students/new' do
  @houses = House.all()
erb (:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  redirect to '/students'
end
