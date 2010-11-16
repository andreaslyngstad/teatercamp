class CampsController < ApplicationController
  # GET /camps
  # GET /camps.xml

    def index
    @camps = Camp.find(:all)
    if request.get? && !params[:id].blank?
      @camp = Camp.find(params[:id])
      elsif request.get? && params[:id].blank?
      @camp = Camp.new
      elsif request.post? && !params[:id].blank?
      @camp = Camp.find(params[:id])
      if params[:commit] == "oppdater"
        respond_to do |format|
          if @camp.update_attributes(params[:camp])
            flash[:notice] = 'Kurset ble oppdatert'
            format.html { redirect_to(:action => "index") }
            format.xml  { head :ok }
          else
            format.html { render :action => "index" }
            format.xml  { render :xml => @camp.errors }
          end
      end
      end
    end
  end
 

  # GET /camps/1
  # GET /camps/1.xml
  def show
    @camp = Camp.find(params[:id])
    @camps = Camp.find(:all)
    respond_to do |format|
      format.html { render :action => "show" }
      format.xml  { render :xml => @camp }
    end
  end

  
  def create
    @camp = Camp.new(params[:camp])
    @camps = Camp.all
    respond_to do |format|
      if @camp.save
        flash[:notice] = 'Kurset ble laget.'
        format.html { redirect_to(camps_path) }
        format.xml  { render :xml => @camp, :status => :created, :location => @camp }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @camp.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /camps/1
  # DELETE /camps/1.xml
  def destroy
    @camp = Camp.find(params[:id])
    @camp.destroy

    respond_to do |format|
      format.html { redirect_to(camps_url) }
      format.xml  { head :ok }
    end
  end
end
