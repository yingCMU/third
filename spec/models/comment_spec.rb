require 'spec_helper'

describe Comment do
  let(:comment) { FactoryGirl.create(:comment) }
  subject { comment}

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:body) }
  #it { should be_valid }
end
