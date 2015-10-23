require 'rails_helper'
require 'spec_helper'

describe 'layouts/application.html.erb', :type => :view do

  context "Check if user signed in" do
    it "renders the user name" do

      controller.singleton_class.class_eval do
        def current_user
          User.new(:first_name => "fakeuser", :last_name => "fake", :email => "testuser@fake.com", :password => "password")
        end
        helper_method :current_user
      end

      render
      expect(rendered).to include("testuser@fake.com"), "Did you output the user's email."
      expect(rendered).not_to include("Login"), "You should not output login if user is signed in."
    end
  end
end
