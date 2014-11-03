cohorts = %w(1406 1407 1409 1410)
cohorts.each do |c|
  Cohort.where(:name => c).first_or_create
end
