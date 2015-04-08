GH_NAMES_TO_IDS = {"121watts"=>7582765,
                   "tyrbo"=>2217533,
                   "alanbsmith"=>4818182,
                   "wfro"=>6454987,
                   "jcasimir"=>43102,
                   "BobGu"=>4348166,
                   "MarcGarreau"=>3621728,
                   "ianderse"=>5242189,
                   "emilyadavis303"=>7103421,
                   "Hilaryous"=>5042071,
                   "tanmdoan"=>7057689,
                   "Tmee"=>8226837,
                   "AndyDangerous"=>2694765,
                   "allisonlarson"=>7552541,
                   "timproctor"=>5150213,
                   "smbsimon"=>5553382,
                   "awortham"=>6271986,
                   "glenegbert"=>5980245,
                   "a6ftcruton"=>5419731,
                   "lukeaiken"=>3201898,
                   "scottcrawford03"=>8398867,
                   "kavitasa"=>1514862,
                   "rNavarrete"=>3431580,
                   "Jwan622"=>6790201,
                   "mikedao"=>3011748,
                   "GusVilla303"=>6902951,
                   "dalexj"=>2790993,
                   "skuhlmann"=>6923345,
                   "VikiAnn"=>5874167,
                   "bayendor"=>4405520,
                   "chandracarney"=>8561841,
                   "HoracioChavez"=>3926939,
                   "gregnar"=>8186136,
                   "dglunz"=>2965795,
                   "katelane"=>3933878,
                   "chasevanhekken"=>5781795,
                   "ericfransen"=>5271281,
                   "Copywright"=>7808793,
                   "larsonkonr"=>7245142,
                   "trayo"=>6809782,
                   "coreyd303"=>6662565,
                   "zRouth"=>8505719,
                   "oorion"=>869456,
                   "laurawhalin"=>8449527,
                   "bryceholcomb"=>6202829,
                   "bmrsny"=>8440504,
                   "EmilyMB"=>8007635,
                   "scottalexandra"=>8812335,
                   "bhargavisatpathy"=>8531351,
                   "ndwhtlssthr"=>3827810,
                   "rshea303"=>7894293,
                   "cluhring"=>8466906,
                   "Lydias303"=>8863407,
                   "KristaANelson"=>8313881}

namespace :user_gh_ids do
  desc "Backfill all the current people records with appropriate user_github_id"
  task :backfill => :environment do
    GH_NAMES_TO_IDS.each do |name, gh_id|
      gh_account_urls = ["http://github.com/#{name}", "https://github.com/#{name}",
                         "http://www.github.com/#{name}", "https://www.github.com/#{name}"]
      person = Person.where(github_url: gh_account_urls).first
      puts "backfilling gh id for gh username #{name}, person #{person.first_name} #{person.last_name};setting github_id: #{gh_id}"
      person.github_id = gh_id
      person.save!
    end
  end
end
