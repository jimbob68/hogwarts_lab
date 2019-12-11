require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/students' do # show all
  @students = Student.all()
  erb(:index)
end

get '/students/new' do # create
  @houses = House.all()
  erb(:new)
end

post '/students' do # create(save)
  @student = Student.new( params )
  @student.save()
  erb(:enroll)
end

get '/students/:id/edit' do # edit
  @student = Student.find( params[:id])
  @houses = House.all()
  erb(:edit)
end

post '/students/:id' do
  Student.new( params ).update
  redirect to '/students'
end

get '/students/:id' do # show
  @student = Student.find(params[:id])
  erb(:show)
end

post '/students/:id/delete' do
  student = Student.find( params[:id])
  student.delete()
  redirect to '/students'
end
