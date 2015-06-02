## Turing People

This app serves as an online portfolio and resume for Turing students
and alumni.

### Production server

```
git remote add heroku git@heroku.com:turing-people.git
```

### Staging server

```
git remote add staging git@github.com:turingschool/people.git
```

## Local Setup

These environment variables will need to be set in your `.bash_profile`:  
```bash
export TURING_AUTH_ADMIN_TOKEN="YOUR_SECRET_TOKEN"
export PEOPLE_GITHUB_ID="YOUR_SECRET_TOKEN"
export PEOPLE_GITHUB_SECRET="YOUR_SECRET_TOKEN"
```

A secret token can be generated with the command `rake secret` in the project directory.
