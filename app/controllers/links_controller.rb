class LinksController < ApplicationController
	before_action :authenticate_user!

	def show
		@link = Link.find(params[:id])
	end

	def edit
		@link = Link.find(params[:id])
	end

	def new
		@link = current_user.links.build
	end

	def index
		@links = current_user.links
		
	end

	def upvote
		@link = Link.find(params[:id])
		@link.liked_by current_user
		redirect_to :back
	end

	def downvote
		@link = Link.find(params[:id])
		@link.downvote_from current_user
		redirect_to :back
	end

	# this will get called when you save a new link
	def create
		link = current_user.links.new(link_params)

		respond_to do | format |
			if link.save
				format.html{
					redirect_to link
				}
			else
				format.html{
					render action: "new"
				}
			end
		end 
		
	end

	# this will get called when you save an edit page for links
	def update
		link = current_user.links.find(params[:id])

		respond_to do | format |
			if link.update_attributes(link_params)
				format.html{
					redirect_to link
				}
			else
				format.html{
					render action: "edit"
				}
			end

		end 
	end

	# this will get called when we delete a link
	def destroy
		link = current_user.links.find(params[:id])
		respond_to do | format |
			if link.destroy
				format.html{
					redirect_to links_url
				}
			else
				format.html{
					redirect_to link
				}
			end
		end 
	end

	def link_params
		params.require(:link).permit(:title, :url)
		
	end

end