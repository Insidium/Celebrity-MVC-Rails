class CelebsController < ApplicationController

        skip_before_action :verify_authenticity_token
        before_action :setup_data
    
        #Show all celebrities
        def index
            render json: @celebrities
        end
    
        #Show a single celebrity
        def show
            if @celebrities[params[:id].to_i] == nil
                render plain: "#{params[:id]} is not a known celebrity ID."
            else
                render json: @celebrities[params[:id].to_i]
            end
        end
    
        #Create a new celebrity
        def create
            @celebrities << {:name => params[:name], :notability => params[:notability]}
            redirect_to "/"
        end
    
        #Update a celebrity
        def update
            @celebrities[params[:id].to_i] = {:name => params[:name], :notability => params[:notability]}
            redirect_to "/"
        end
    
        #Remove a celebrity
        def destroy
            @celebrities.delete_at(params[:id].to_i)
            redirect_to "/"
        end
    
        private
        def setup_data
            session[:celebrities] = [
                { name: "Lindsay Lohan", notability: "Parent Trap" },
                { name: "Adam Sandler", notability: "Big Daddy" },
                { name: "Rob Schnider", notability: "Adam Sandler" }
            ] unless session[:celebrities]
    
            @celebrities = session[:celebrities]

        end
end
