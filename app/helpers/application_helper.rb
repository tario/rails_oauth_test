module ApplicationHelper
  class UserMock
    def client_applications
      ClientApplication
    end    
  end
  
  def current_user
    UserMock.new
  end
  
  def login_required
    # do nothing
  end
end
