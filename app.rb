require 'sinatra'
require 'octokit'

get '/' do
  erb :home
end

post '/' do
  options = {
    auto_paginate: true,
    access_token: params[:token]
  }

  @pr_commits = client(options).pull_request_commits("f-scratch/#{params[:repo]}", params[:pr_id].to_i)
  erb :commits
end


def client(options)
  Octokit::Client.new(options)
end
