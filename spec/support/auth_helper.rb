module AuthHelper
  def person_params
    {first_name: "pizza",
     last_name: "man",
     image_url: "pizza_man.jpg",
     email_address: "pizza@example.com",
     looking_for: "pizza cooking or delivery job",
     best_at: "delivering pizzas",
     cohort_id: 1,
     github_url: "http://github.com/worace",
     user_id: 15,
     introduction: "hi im the pizza man"
    }
  end

  def sample_user
    TuringAuth::User.new(:github_id=>1227440,
                         :github_name=>"worace",
                         :email=>"horace.d.williams@gmail.com",
                         :github_token=>"1234",
                         :authed_at=>"2015-04-09 14:32:46 -0600")
  end

  def login!(user=sample_user)
    session[:current_user] = sample_user.as_json
  end
end
