load 'item.rb'
class Sanitizer
  def groupLocation(items)
      groupArray = items.group_by(&location)
      return groupArray
  end

  def uniqueDuplicate(groupArray)
    groupArray.length.time do |i|
      uniqueDuplicate = groupArray[i].values
      uniqueDuplicate.length.time do|k|
        uniqueDuplicate.unique(&name);
      end
      return uniqueDuplicate
    end
  end
end