require 'spec_helper'

describe CommentsController do
  let(:comment) { FactoryGirl.create(:comment) }
  subject { comment}

  it { should be_valid }
end
