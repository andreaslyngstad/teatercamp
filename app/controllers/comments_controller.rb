class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.find(:all)

    case params[:status]
      when 'godkjent'
        @comments = Comment.find(:all, :conditions => "status = 'godkjent'", :order => 'created_at DESC') 
      when 'spam'
      @comments = Comment.find(:all, :conditions => "status = 'spam'", :order => 'created_at DESC') 
      when 'alle'
       @comments = Comment.find(:all, :order => 'created_at DESC') 
      when 'slett'
        @comments.each do |com| 
          @comment = com.find(params[:id]) 
          @comment.destroy
        end
      else
       @comments = Comment.find(:all, :conditions => "status = 'nye'", :order => 'created_at DESC')
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

def set_status  
    begin        
      status = params[:commit] || "" 
      checked_items = params[:commentlist]
      if status == "Slett"
      checked_items.each do |com| 
      Comment.delete(com)
      
      end
    else
      checked_items.each do |id|   
      Comment.update(id.to_i, :status => status.downcase)
      end
    end
      flash[:notice] = "De valgte kommentarene ble oppdatert"
      redirect_to(:controller => "comments", :action => "index") 
    rescue
      flash[:notice] = "Du må velge kommentarer før du trykker."
      redirect_to(:controller => "comments", :action => "index")
    end
  end
 end 
private 

def all_posts
  return Post.find(:all, :order => "title ASC").collect {|p| [p.title, p.id]}
  
end
