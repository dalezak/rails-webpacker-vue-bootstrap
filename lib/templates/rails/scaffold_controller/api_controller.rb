<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :update, :destroy]

  def index
    authorize! :index, <%= class_name %>
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
  end

  def show
    authorize! :show, @<%= singular_table_name %>
  end

  def create
    authorize! :new, <%= class_name %>
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    if @<%= orm_instance.save %>
      render :show, status: :created, location: <%= "@#{singular_table_name}" %>
    else
      render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity
    end
  end

  def update
    authorize! :update, @<%= singular_table_name %>
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      render :show, status: :ok, location: <%= "@#{singular_table_name}" %>
    else
      render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! :destroy, @<%= singular_table_name %>
    @<%= orm_instance.destroy %>
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
