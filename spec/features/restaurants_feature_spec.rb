require 'rails_helper'

describe 'restaurant listings page' do 
	context 'no restaurants' do 
		it 'tells me there are no restaurants' do 
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
		end
	end

	context 'are restaurants' do 
		before do 
			Restaurant.create(name: 'Ledbury', cuisine: 'French')
		end

		it 'should show the restaurant' do 
			visit '/restaurants'
			expect(page).to have_content 'Ledbury'
		end
	end
end

describe 'restaurant creation form' do 

	context 'logged out' do 
		it 'should forward user to sign in page' do 
			visit '/restaurants'
			click_link 'Create Restaurant'
			expect(page).to have_content 'Sign in'
		end
	end
	
	# context 'logged in' do 
	# 	context 'input is valid' do 
	# 		it 'should be able to create a restaurant' do 
	# 			visit '/restaurants/new'
	# 			fill_in "Name", with: 'Royal China'
	# 			fill_in "Cuisine", with: 'Chinese'
	# 			click_button 'Create Restaurant'

	# 			expect(current_path).to eq '/restaurants'
	# 			expect(page).to have_content 'Royal China (Chinese)'

	# 		end
	# 	end

	# 	context 'input is invalid' do 
	# 		it 'should be able to create a restaurant' do 
	# 			visit '/restaurants/new'
	# 			fill_in "Name", with: 'royal china'
	# 			fill_in "Cuisine", with: 'Chi'
	# 			click_button 'Create Restaurant'

	# 			expect(current_path).to eq '/restaurants'
	# 			expect(page).not_to have_content 'royal china (Chi)'
	# 			expect(page).to have_content 'Errors'
	# 		end
	# 	end
	# end
end

describe 'restuarant edit form' do 
	before {Restaurant.create name: 'Royal China', cuisine: 'Chinese'}

	# context 'logged in' do 
	# 	it 'should be able to edit a restaurant' do 
	# 		visit '/restaurants'
	# 		click_link 'Edit Royal China'

	# 		fill_in 'Name', with: 'Royal China Queensway'

	# 		click_button 'Update Restaurant'

	# 		expect(current_path).to eq '/restaurants'
	# 		expect(page).to have_content 'Royal China Queensway'
	# 	end

	# 	it 'should be able to delete a restaurant' do 
	# 		visit '/restaurants'
	# 		click_link 'Delete Royal China'
	# 		expect(current_path).to eq '/restaurants'
	# 		expect(page).not_to have_content 'Royal China Queensway (Chinese)'
	# 		expect(page).to have_content 'Successfully deleted Royal China'
	# 	end
	# end
end

