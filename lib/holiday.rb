require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above 
  # add the second argument, which is a supply, to BOTH the 
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
    holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
     winter_supplies = []

  holiday_hash.each do |season, holiday|
      if season == :winter
        holiday.each do |name, supplies|
          supplies.each do |supply|
            winter_supplies << supply
        end
      end
 
    end
  end

  return winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

string = ""
  holiday_hash.each do |season, holiday|

    string = string +  season.to_s.capitalize + ":\n"

        holiday.each do |name, supplies|
          name = name.to_s
          occasions= name.split("_")
          x = 0

          while x < occasions.length
            occasions[x] = occasions[x].capitalize!
            x = x + 1
          end

          occasions = occasions.join(" ")
          string = string + "  " + occasions + ": "

          y = 0
          while y < supplies.length
            if supplies.length > 1 && y != (supplies.length - 1)
              string = string + supplies[y] + ", "
            else
              string = string + supplies[y]
            end
            y = y + 1
          end

        string = string + "\n"
 
    end
  end

  puts string

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
       bbq_supplies = []

  holiday_hash.each do |season, holiday|
        holiday.each do |name, supplies|
          supplies.each do |supply|
            if supply == "BBQ"
              bbq_supplies << name

            end
        end
      end
  end
return bbq_supplies
end







