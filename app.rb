require 'sinatra'
require 'octokit'

get '/' do
  erb :home
end

get '/search_commits' do
  erb :search_commits
end

post '/search_commits' do
  begin
    options = {
      auto_paginate: true,
      access_token: params[:token]
    }

    @pr_commits = client(options).pull_request_commits("f-scratch/#{params[:repo]}", params[:pr_id].to_i)
    erb :commits
  rescue
    erb :errors
  end
end

get '/search_milestone' do
  erb :search_milestone
end

post '/search_milestone' do
  begin
    options = {
      auto_paginate: true,
      access_token: params[:token]
    }

    @milestone_prs = client(options).list_issues("f-scratch/#{params[:repo]}", {milestone: params[:milestone_id].to_i, state: 'all'})
    erb :milestone
  rescue
    erb :errors
  end
end

def client(options)
  Octokit::Client.new(options)
end
