require 'spec_helper'

describe League do

  before(:each) do
    @user = Factory(:user)
    @attr = { :name => "MLS", :year => 2002, :created_by_id => @user.id }
  end

  it "should have an user (update_by) field"

  it "should create a new instance given valid attributes" do
    @league = League.create!(@attr)
  end

  it "should require a name" do
    no_name_league = League.new(@attr.merge(:name => ""))
    no_name_league.should_not be_valid
  end

  it "should require a year" do
    no_year_league = League.new(@attr.merge(:year => nil))
    no_year_league.should_not be_valid
  end  
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_league = League.new(@attr.merge(:name => long_name))
    long_name_league.should_not be_valid
  end    
  
end
