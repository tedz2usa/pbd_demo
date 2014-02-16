class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :translateFlashNoticeToneToClass
  

  private

    def translateFlashNoticeToneToClass
      
      case flash[:noticeTone]
      when 'positive'
        @noticeToneClass = 'fnPositive'
      when 'negative'
        @noticeToneClass = 'fnNegative'
      end

      # Prefext the notice tone class with a space.
      if @noticeToneClass
        @noticeToneClass = ' ' + @noticeToneClass
      end


    end

end
