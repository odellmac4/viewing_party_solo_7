module ApplicationHelper
    def minutes_to_hours_minutes(minutes)
        hours = minutes / 60
        remaining_minutes = minutes % 60
        "#{hours} #{'hour' if hours == 1} #{'hours' unless hours == 1} #{remaining_minutes} minutes"

        
    end      
end
