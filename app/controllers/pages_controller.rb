class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def terms_of_service
  end

  def privacy_policy
  end

  def acceptable_use_policy
  end
end
