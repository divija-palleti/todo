class TodoItemsController < ApplicationController
    before_action :set_todo_list
    before_action :set_todo_item, except: [:create]

    # def new
    #     # @todo_item = @todo_list.todo_items.new
    #     @todo_item = @todo_list.todo_items.new(todo_item_params)

    # end

   def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)
    logger.debug "New post: #{@todo_item.attributes.inspect}"
    logger.debug "Post should be valid: #{@todo_item.valid?}"
    @todo_item.save
    redirect_to @todo_list
    # if @todo_item.save
    #     flash[:notice] = 'ToDo was successfully created.'
    #     logger.debug "The post was saved and now is the user is going to be redirected..."
    #     redirect_to @todo_list
    #   else
    #     flash[:error] = "Item couldn't be deleted"
    #     # redirect_to @todo_list
    #   end
    # redirect_to @todo_list
   end

    def destroy
    if(@todo_item.destroy)
        flash[:success] ="Todo item deletion success "
    else
        flash[:error] = "Item couldn't be deleted"
    end
    redirect_to @todo_list
    end

   def complete
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @todo_list, notice: "Todo item completed"
   end
   
   private
   def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
   end
   def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
   end
   def todo_item_params
    params[:todo_item].permit(:content, :priority, :duedate)
   end
   end