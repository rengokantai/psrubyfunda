require 'time'
weekend = proc{|time| time.saturday? || time.sunday?}
weekday = proc{|time| time.wday <6}

case Time.now
  when weekend then puts "weekend"
  when weekday then puts "weekday"
    else puts "wrong"
end

