require 'rest-client'
require 'nokogiri'

exercise_hash = {}
activity_hash = {}

# todos
# ignore excercise info if it contains the regex 'deprecated'

html_activities = RestClient.get("https://developers.google.com/android/reference/com/google/android/gms/fitness/FitnessActivities.html")
doc_activities = Nokogiri::HTML.parse(html_activities);

html_exercises = RestClient.get("https://developers.google.com/android/reference/com/google/android/gms/fitness/data/WorkoutExercises.html", headers={})
doc_exercises = Nokogiri::HTML.parse(html_exercises);

exercises = doc_exercises.css('.jd-details')
activities = doc_activities.css('.jd-details')

exercises.each do |exercise|
    if !exercise.css('strong').text.include? "deprecated"
        exercise_hash[exercise.css('strong').text]
        exercise.css('p').text.gsub(/\s+/, ' ') # create your exercise here
        # add attribute for equipment required
        # add attribute for video url (for use with the youtube-react library)
    end
end

activities.each do |activity|
    if !activity.css('strong').text.include? "deprecated"
        activity_hash[activity.css('strong').text]=activity.css('p').text.gsub(/\s+/, ' ') # create your activities here
    end
end

puts exercise_hash

