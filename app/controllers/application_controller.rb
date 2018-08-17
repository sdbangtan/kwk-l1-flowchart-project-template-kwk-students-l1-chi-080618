require './config/environment'


class App < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :home 
  end 
  
  get '/workouts' do
    erb :workouts
  end
  
   get '/skincare' do
    erb :skincare
  end
  
   get '/mealplans' do
    erb :mealplans
  end
  
  get '/index.erb' do
    erb :index
  end
  
  post '/workout' do
   answers = params.values
   @total = 0
   answers.each do |answer|
     @total += answer.to_i
   end
   
   puts @total
   
   if @total <= 2 
     return erb :workoutresults1
    # "You should do some light cardio (jumping jacks, butt-kicks, high-knees) for 5-15 minutes to get your blood pumping and feet moving throughout the day!"
   elsif @total <= 8
   return erb :workoutresults2
     #"You should participate in active cardio (jogging, dancing, burpees) to improve stamina and endurance!"
   elsif @total <= 14
   return erb :workoutresults3
     #"You should focus on some lighter muscle toning exercises (lunges, wall sits, squats) to improve flexibility and lose overall body fat!"
   elsif @total < 20
   return erb :workoutresults4
     #"You should participate in hardcore muscle building exercises (pushes, crunches, weight-lifting) in order to improve strength!"
    else
      "error"
   end
 end
 
 post '/mealplan' do
   
   answers = params.values
   @total = 0
   answers.each do |answer|
     @total += answer.to_i
   end
   
   puts @total
   
   if @total <= 2
     return erb :foodresults1
     #"You should try some egg salad!"
   elsif @total <= 8
   return erb :foodresults2
     #"You should try some chicken ranch wraps!"
   elsif @total <= 14
   return erb :foodresults3
     #"You should try some BBQ chicken tostados!"
   elsif @total < 20
   return erb :foodresults4
     #"You should try some frozen banana yogurt!"
    else
      "error"
   end
 end
 
 post '/skincare' do
    answers = params.values
   @total = 0
   answers.each do |answer|
     @total += answer.to_i
   end
   
   puts @total
   
   if @total < 5
     return erb :skincareresults1
     #"Use a gentle skin cleanser."
   elsif @total >= 5 && @total <= 9
   return erb :skincareresults2
     #"Try the Lush FOMO Jelly face mask."
   elsif @total >= 10 && @total <= 14
   return erb :skincareresults3
     #"Try the The Body Shop Himalayan Charcoal Purifying Glow Mask."
   elsif @total < 14
   return erb :skincareresults4
     #"Combine lemon juice and yogurt. Mix lemon juice and yogurt. Take 2 tablespoons of plain yogurt in a bowl. Apply the face mask once weekly. Apply this mask once a week to get rid of oily skin. Using a face pack brush, apply the paste all over the face, leaving the area around the eyes."
    else
      "error"
    end
   
 end

end

