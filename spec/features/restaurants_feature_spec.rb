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
			Restaurant.create(name: 'Ledbury')
		end

		it 'should show the restaurant' do 
			visit '/restaurants'
			expect(page).to have_content 'Ledbury'
		end
	end
end

describe 'restaurant creation form' do 
	it 'should be able to create a restaurant' do 
		visit '/restaurants/new'
		fill_in "Name", with: 'Royal China'
		fill_in "Cuisine", with: 'Chinese'
		click_button 'Create Restaurant'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'Royal China (Chinese)'

	end
end

describe 'restuarant edit form' do 
	before {Restaurant.create name: 'Royal China', cuisine: 'Chinese'}

	it 'should be able to edit a restaurant' do 
		visit '/restaurants'
		click_link 'Edit Royal China'

		fill_in 'Name', with: 'Royal China Queensway'

		click_button 'Update Restaurant'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'Royal China Queensway'
	end

	it 'should be able to delete a restaurant' do 
		visit '/restaurants'
		click_link 'Delete Royal China'
		expect(current_path).to eq '/restaurants'
		expect(page).not_to have_content 'Royal China Queensway (Chinese)'
		expect(page).to have_content 'Successfully deleted Royal China'
	end
end

