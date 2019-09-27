require 'takeaway.rb'

describe Takeaway do

  it 'list method returns all dishes' do
    expect(subject.list).to eq(subject.dishes)
  end

  it 'can select dish of choice and its quantity'  do
    subject.list
    expect(subject.select("Pizza", 2)).to eq(subject.order)
  end

  it 'checks running total is correct'  do
    subject.list
    subject.select("Pizza", 4)
    expect(subject.total).to eq(subject.running_total)
  end

  it 'raises error if balance is not paid in checkout'  do
    subject.list
    subject.select("Pizza", 4)
    expect{subject.checkout(20)}.to raise_error "Your payment does not cover the balance"
  end


end
