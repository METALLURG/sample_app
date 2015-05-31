class Admin::BaseController < ApplicationController
  layout 'first_admin_panel/application'

  before_action { authorize! :access, :admin_panel }
end
