class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    
    # The build method instatiates hested attributes, in this case technologies

    3.times do
      @portfolio_item.technologies.build
    end

  end

  def create

    # The require method marks paramenters as permitted. The permit method sets certain parametnes as permiited and limits which ones should be allowed for mass updating

    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your portfolio item is now live"}
      else
        format.html { render :new}
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    # The respond_to method passes actions demending on how (format) the server client desires to display the web-page 

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    #perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    #Destroy/delete the record
    @portfolio_item.destroy

    #Redirect
    respond_to do |format|  
      format.html {  redirect_to portfolios_url, notice: "Record was removed"}
    end
  end

end
