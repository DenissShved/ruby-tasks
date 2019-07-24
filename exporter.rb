require "csv"

## TODO: Wrap strings in "" for better .csv
class Export
  def self.toCSV(array)
    #
    if array.length == 0
      raise "Array is nil or empty"
    end
    #trueClass represents first object's class
    #That will be required in oreder to save this object into csv
    workingWith, trueClass = array[0], array[0].class

    firstArray = []
    if workingWith.instance_variables.length < 1
      raise "First object has no instance variables. Thus, cannot create columns"
    end

    #Creating first row in csv file
    workingWith.instance_variables.map do |attrName|
      firstArray << attrName.to_s.sub(/^@/, '')
    end

    fileName = trueClass.name.split('::').last + "_ALL.csv"
    puts ("Creating output csv file: " + fileName)

    objectsSkipped = 0

    CSV.open(fileName, "w") do |file|
      file << firstArray
      array.each do |obj|
        infoArray = []
        #Checking that wokring with same objects in an array and skipping it if different
        if obj.class != trueClass
          puts ("Warning: skipping "+objectsSkipped+" object\(s\)")
          next
        end
        obj.instance_variables.map do |attr|
          infoArray << obj.instance_variable_get(attr).to_s
        end
        file << infoArray
      end
    end
  end
end
