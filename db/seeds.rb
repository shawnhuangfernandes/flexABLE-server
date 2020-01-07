require 'rest-client'
require 'nokogiri'

html_activities = RestClient.get("https://developers.google.com/android/reference/com/google/android/gms/fitness/FitnessActivities.html")
doc_activities = Nokogiri::HTML.parse(html_activities);

html_exercises = RestClient.get("https://developers.google.com/android/reference/com/google/android/gms/fitness/data/WorkoutExercises.html", headers={})
doc_exercises = Nokogiri::HTML.parse(html_exercises);

exercises = doc_exercises.css('.jd-details')
activities = doc_activities.css('.jd-details')

exercises.each do |exercise|
    if !exercise.css('strong').text.include? "deprecated"
        Exercise.create(name: exercise.css('strong').text, description: exercise.css('p').text.gsub(/\s+/, ' '), category: "Exercise")        
    end
end

activities.each do |activity|
    if !activity.css('strong').text.include? "deprecated"
        Exercise.create(name: activity.css('strong').text, description: activity.css('p').text.gsub(/\s+/, ' '), category: "Activity")  
    end
end

