require 'test_helper'

class LabelTest < ActiveSupport::TestCase
  def setup
    @label = labels(:one)
  end

  test 'valid label' do
    assert @label.valid?
  end

  test 'invalid label with too short title' do
    @label.title = 'A'
    assert_not @label.valid?, "validate label with too short title: #{@label.title}"
  end

  test 'invalid label without title' do
    @label.title = nil
    refute @label.valid?, 'saved label without a title' #Fails if @label.valid? is a true value
    assert_not_nil @label.errors[:title], 'no validation error for title present'
  end

  test 'should save label' do
    label = Label.new
    label.title = 'Test Label'
    assert label.save
  end

  test 'should not save label without title' do
    label = Label.new
    assert_not label.save
  end

  test 'should not save label with existing title' do
    label = Label.new
    label.title = 'Label A'
    refute label.save, 'saved label with existing title'
    assert_not_nil label.errors[:title], 'no validation error for existing title'
  end
end
