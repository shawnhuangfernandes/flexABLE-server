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
        Exercise.create(name: exercise.css('strong').text, description: exercise.css('p').text.gsub(/\s+/, ' '), category: "Exercise")  
    end
end



