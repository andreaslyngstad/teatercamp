class RegistrationsController < ApplicationController
  skip_before_filter :login_required, :only => [ :new, :create, :thank_you]
  # GET /registrations
  # GET /registrations.xml
  def index
    @registrations = Registration.find(:all, :order => "camp_id ASC")
    
    @registration = Registration.find(params[:id]) unless params[:id].blank?
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.xml
  def show
    @registration = Registration.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.xml
  def new
    @registration = Registration.new
    @camp = Camp.find(params[:id])
    @registration.camp =  @camp
    render :action => "new", :layout => "public"
   
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.xml
  def create
    @registration = Registration.new(params[:registration])
    @camp = @registration.camp
    respond_to do |format|
      format.html do
        if simple_captcha_valid?
          if @registration.save
            
            flash[:notice] = 'Påmeldingen er registrert.'
            render(:controller => "registrations", :action => "thank_you", :layout => "public" ) 
          else
            render :action => "new" 
          end
        
          else
           
            flash[:notice] = 'Koden nederst i meldingsvinduet var feil. Prøv igjen. Du trenger ikke å bry deg om store eller små bokstaver.'
            render :action => "new", :layout => "public" 
        end
      end
     format.js {render :action => "validate"} 
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.xml
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        flash[:notice] = 'Påmeldingen ble oppdatert!'
        format.html { redirect_to(registrations_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.xml
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to(registrations_url) }
      format.xml  { head :ok }
    end
  end
  def thank_you 
    @registration = Registration.find(params[:id])
  end
  def emails
  @registrations = Registration.all
  @small_mails = Registration.find(:all, :conditions => ["age < ?", "13"]).map{|reg| reg.billing_email + ", "}.uniq
  @medium_mails = Registration.find(:all, :conditions => ["age > ? AND age < ?", "12", "16"]).map{|reg| reg.billing_email + ", "}.uniq
  @big_mails = Registration.find(:all, :conditions => ["age > ?", "15"]).map{|reg| reg.billing_email + ", "}.uniq
  
  
   @all_mails = @registrations.map{|reg| reg.billing_email + ", "}.uniq
  
  @camps = Camp.all
  end
end
