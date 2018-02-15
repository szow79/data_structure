def merge_schedule(times)
  times = times.sort_by { |t| t[0] }
  t1 = times[0]
  schedule = []
  times.each_with_index do |time, index|
    next if index == 0
    t2 = times[index]
    if can_be_merged?(t1, t2)
      t1 = merge_time(t1, t2)
    else
      schedule << t1
      t1 = t2
    end
  end
  schedule << t1
  schedule
end

def can_be_merged?(t1, t2)
  t2[0] <= t1[1]
end

def merge_time(t1, t2)
  if t2[1] > t1[1]
    [t1[0], t2[1]]
  else
    t1
  end
end



