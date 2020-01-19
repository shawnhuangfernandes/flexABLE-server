# Need to scrap a website so require these gems
require 'rest-client'
require 'nokogiri'

# Rest Client to access the webpage and return jibberish HTML
html_activities = RestClient.get("https://developers.google.com/android/reference/com/google/android/gms/fitness/FitnessActivities.html")
# Nokogiri to parse through the jibberish HTML and return proper HTML
doc_activities = Nokogiri::HTML.parse(html_activities);
# Grab the dom objects of a specific class (for the exercises)
activities = doc_activities.css('.jd-details')

# if the exercises have not been marked as deprecated, create an exercise instance
activities.each do |activity|
    if !activity.css('strong').text.include? "deprecated"
        Exercise.create(name: activity.css('strong').text, description: activity.css('p').text.gsub(/\s+/, ' '), category: "Activity")        
    end
end

# Rest Client to access the webpage and return jibberish HTML
html_exercises = RestClient.get("https://developers.google.com/android/reference/com/google/android/gms/fitness/data/WorkoutExercises.html", headers={})
# Nokogiri to parse through the jibberish HTML and return proper HTML
doc_exercises = Nokogiri::HTML.parse(html_exercises);
# Grab the dom objects of a specific class (for the exercises of type 'activity')
exercises = doc_exercises.css('.jd-details')

# if the activities have not been marked as deprecated, create an exercise instance of type 'activity'
exercises.each do |exercise|
    if !exercise.css('strong').text.include? "deprecated"
        Exercise.create(name: exercise.css('strong').text, description: exercise.css('p').text.gsub(/\s+/, ' '), category: "Arms")  
    end
end

User.create(username: "Hi", password: "pass", first_name: "Shawn", last_name: "Huangnandes")

counter = 12

while counter <= 20 do
    Workout.create(user_id: 1, exercise_id: 1, workout_date: Date.new(2020, 1, counter), completed: false, description: "10 minutes")
    Workout.create(user_id: 1, exercise_id: 2, workout_date: Date.new(2020, 1, counter), completed: false, description: "20 65-yard shots")
    counter += 1
end



