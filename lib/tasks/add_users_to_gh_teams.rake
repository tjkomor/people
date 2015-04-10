namespace :github do
  desc "add users to appropriate turing team"
  task :add_users_to_teams => :environment do
    raise "Please provied a 'GH_TOKEN' -- note that you will need the admin:org permission on turingschool" unless ENV["GH_TOKEN"]
    users_to_teams = Person.all.reduce({}) { |c,p| c[p.github_url.split('/').last] = p.cohort.name; c }
    octokit = Octokit::Client.new(access_token: ENV["GH_TOKEN"])
    teams = octokit.org_teams("turingschool")

    puts "pulled all turing teams: #{teams.map(&:name)}"
    users_to_teams.each do |username, team|
      puts "looking for team #{team}"
      gh_team = teams.find { |t| t.name == team.to_s }
      puts "will add user #{username} to team #{gh_team.name} (id: #{gh_team.id})"
      octokit.add_team_membership(gh_team.id, username)
    end
  end
end
