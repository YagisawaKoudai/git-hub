require 'octokit'

# github access token
puts 'Input accesstoken'
accesstoken = gets.to_s.chomp

# github repo name
puts 'Input repo'
repo = gets.to_s.chomp

# github pull request number
puts 'Input pull request number'
pull_id = gets.to_i

options = {
  auto_paginate: true,
  access_token: accesstoken # 必要に応じて入力する
}

# Clientオブジェクトを生成
@client = Octokit::Client.new(options)

pull_request_commits = @client.pull_request_commits("f-scratch/#{repo}", pull_id)

pull_request_commits.each do |commit|
  puts commit[:sha]
end
