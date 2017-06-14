class PortfolisController < ApplicationController
	def index
		@portfolio_items = Portfoli.all
	end

	def angular
		@angular_portfolio_items = Portfoli.anuglar
	end

	def new
		@portfolio_item = Portfoli.new
		3.times{ @portfolio_item.technologies.build }
	end

	def create
		@portfolio_item = Portfoli.new(params.require(:portfoli).permit(:title, :subtitle, :body, 
																																		technologies_attributes: [:name]
																																		)
																									)

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
			if @portfolio_item.update(params.require(:portfoli).permit(:title, :subtitle, :body))
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

end