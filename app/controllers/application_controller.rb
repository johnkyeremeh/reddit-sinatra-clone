require 'rack-flash'
class ApplicationController < Sinatra::Base
    use Rack::Flash
    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions 
        set :session_secret, "reddit_clone_secret" 
    end

    #homepage
    get "/" do 
        if logged_in?
            erb :'users/homefeed' 
        else
            erb :"index"
        end
    end

    get "/about" do 
         erb :'about'
    end




    helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
            User.find(session[:user_id])
		end
	end



end