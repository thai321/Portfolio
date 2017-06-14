class PortfolisController < ApplicationController
	layout 'portfolio'

	def index
		@portfolio_items = Portfoli.all
		@blog_title = "My Portfolio"
	end

	def angular
		@angular_portfolio_items = Portfoli.anuglar
	end

	def new
		@portfolio_item = Portfoli.new
		3.times{ @portfolio_item.technologies.build }
	end

	def create
		@portfolio_item = Portfoli.new(portfolio_params)

		respond_to do |format|
			if @portfolio_item.save
				format.html {redirect_to portfolis_path, notice: 'Your portfolio is now live.' }
			else
				format.html {render :new}
			end
		end
	end

	def edit
		@portfolio_item = Portfoli.find(params[:id])
	end

	def update
		@portfolio_item = Portfoli.find(params[:id])

		respond_to do |format|
			if @portfolio_item.update(portfolio_params)
				format.html { redirect_to portfolis_path, notice: "Your portfolio is successfully updated."}
			else												# /portfolis
				format.html {render :edit}
			end
		end
	end

	def show
		@portfolio_item = Portfoli.find(params[:id])
	end

	def destroy
		# Peform the lookup
		@portfolio_item = Portfoli.find(params[:id])

		# Destroy/delete the record
		@portfolio_item.destroy

		# Redirect
		respond_to do |format|
			format.html { redirect_to portfolis_url, notice: 'The portfolio was removed.'}
		end
	end

	
	private

	def portfolio_params
		params.require(:portfoli).permit(:title, 
																		 :subtitle, 
																		 :body, 
																		 technologies_attributes: [:name]
																		)
	end
end
