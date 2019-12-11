require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  erb(:new)
end

post '/students' do
  @student = Student.new( params )
  @student.save()
  erb(:enroll)
end

# edit
get '/students/:id/edit' do
  @student = Student.find( params[:id])
  erb(:edit)
end

# show
get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end
# new

# create



# update

# destroy
