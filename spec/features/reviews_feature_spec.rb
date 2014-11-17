require 'rails_helper'

def leave_review(thoughts, rating)
	visit '/restaurants'
	fill_in 'Thoughts', with: thoughts
	select rating, from: 'Rating'
	click_button 'Create Review'
end

describe 'writing reviews' do 
	before { Restaurant.create name: 'KFC', cuisine: 'Chicken' }

	it 'should add the review to the restaurant' do 
		leave_review('Aweful', 2)

		expect(page).to have_content 'Aweful (★★☆☆☆)'
	end
end

describe 'average ratings' do
	before { Restaurant.create name: 'KFC', cuisine: 'Chicken' }

	it 'should find the average rating 3' do 
		leave_review('Bad', 2)
		leave_review('Good', 4)

		expect(page).to have_content 'Average rating: ★★★☆☆'
	end
end