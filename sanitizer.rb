load 'item.rb'
class Sanitizer
  def groupLocation(items)
      groupArray = items.group_by(&location);
      return groupArray;
  end

  def uniqueDuplicate(groupArray)
    groupArray.length.time do |i|
      uniqueDuplicate = groupArray.index[i].unique(&name);
    end
    return uniqueDuplictae;
  end
  return uniqueDuplicate;
end