class SessionsController < ApplicationController

  def create
    code = params[:code]
    conn = Faraday.new(url: "https://api.fitbit.com/oauth2/token")

    response = conn.post do |req|
      req.headers['Authorization'] = 'Basic MjI4SDJUOmM5MDAzYjE0N2Y0YTNmZjY1ZDYwOGIzZjM2OTY2MDM4'
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.params['redirect_uri'] = 'http://localhost:3000/auth/fitbit/callback'
      req.params['clientID'] = '228H2T'
      req.params['grant_type'] = 'authorization_code'
      req.params['code'] = params[:code]
    end

    token = JSON.parse(response.body)["access_token"]
    ## gets token back at this point. hooray!

    oauth_response = Faraday.get("https://api.fitbit.com/1/user/-/profile.json") do |req|
      req.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI0UldYN1AiLCJhdWQiOiIyMjhIMlQiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJyc29jIHJzZXQgcmFjdCBybG9jIHJ3ZWkgcmhyIHJudXQgcnBybyByc2xlIiwiZXhwIjoxNTAwNjIwODcyLCJpYXQiOjE1MDAwMzg1ODF9.vTWt-TAz1dO_IxOH_I_jQORYNwN1tjvSiJmPEiAxCHA'
    end

    auth = JSON.parse(oauth_response.body)
    ##gets user profile and others scopes! fuck yeah!
  end

end
