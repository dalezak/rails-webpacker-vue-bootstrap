<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :index, <%= class_name %>
    @search = params.fetch(:search, nil)
    @offset = params.fetch(:offset, 0).to_i
    @limit = [params.fetch(:limit, 12).to_i, 48].min
    query = <%= class_name %>.for_search(@search)
    @<%= plural_table_name %> = query.limit(@limit).offset(@offset).order(created_at: :asc).all
    @<%= plural_table_name %>_count = query.count(:all)
    respond_to do |format|
      format.html { render layout: true }
      format.json { }
    end
  end

  def show
    authorize! :show, @<%= singular_table_name %>
  end

  def new
    authorize! :new, <%= class_name %>
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  def edit
    authorize! :edit, @<%= singular_table_name %>
  end

  def create
    authorize! :create, <%= class_name %>
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %> }
        format.json { render :show, status: :created, location: <%= "@#{singular_table_name}" %> }
      else
        format.html { render :new }
        format.json { render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @<%= singular_table_name %>
    respond_to do |format|
      if @<%= orm_instance.update("#{singular_table_name}_params") %>
        format.html { redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %> }
        format.json { render :show, status: :ok, location: <%= "@#{singular_table_name}" %> }
      else
        format.html { render :edit }
        format.json { render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @<%= singular_table_name %>
    @<%= orm_instance.destroy %>
    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %> }
      format.json { head :no_content }
    end
  end

  private

  def set_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  def <%= "#{singular_table_name}_params" %>
    <%- if attributes_names.empty? -%>
    params.fetch(<%= ":#{singular_table_name}" %>, {})
    <%- else -%>
    params.require(<%= ":#{singular_table_name}" %>).permit(<%= permitted_params %>)
    <%- end -%>
  end
  
end
<% end -%>
