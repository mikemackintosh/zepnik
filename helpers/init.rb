module ::PROJECTNAME::
  module Helpers
    
    # Add pluralize method
    def pluralize(count, singular, plural=nil)
      if count > 1
        unless plural.nil? 
          return "#{count} #{plural}"
        end

        return "#{count} #{singular}s"
      end

      singular
    end

    # Time ago helpers
    def time_ago_in_words(timestamp)
        minutes = (((Time.now - timestamp).abs)/60).round

        return nil if minutes < 0

        case minutes
          when 0               then 'seconds'
          when 1               then 'less than 1 minute'
          when 2               then 'less than 2 minutes'
          when 3               then 'less than 3 minutes'
          when 4               then 'less than 5 minutes'
          when 5..9            then 'around 10 minutes'
          when 10..14          then 'around 15 minutes'
          when 15..19          then 'around 20 minutes'
          when 20..29          then 'about 30 minutes'
          when 30..59          then 'over 30 minutes'
          when 60..119         then 'over 1 hour'
          when 120..239        then '2 hours'
          when 240..479        then '4 hours'
          when 480..719        then '8 hours'
          when 720..1439       then '12 hours'
          when 1440..11519     then " about #{pluralize((minutes/1440).floor, 'a day', 'days')}"
          when 11520..43199    then " about #{pluralize((minutes/11520).floor, 'a week', 'weeks')}"
          when 43200..525599   then " about #{pluralize((minutes/43200).floor, 'a month', 'months')}"
          else                      " about #{pluralize((minutes/525600).floor, 'a year', 'years')}"
        end
    end

    # Is logged in?
    def logged_in?
        return !!session[:user]
    end

    def is_authenticated?
      unless logged_in?
        redirect "/login", 303 
      end
    end

  end
end