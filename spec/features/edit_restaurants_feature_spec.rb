require 'rails_helper'

context 'logged out' do

    before do 
        bob = User.create(email: 'bob@example.com', password: '12345678', password_confirmation: '12345678')
        bob.restaurants.create(name: 'Royal China', cuisine: 'Chinese')
    end

    it 'cannot Edit Restaurants' do
        visit '/restaurants'
        expect(page).to have_content 'Royal China (Chinese)'
        expect(page).not_to have_link 'Edit Royal China'
    end
end

context 'logged in as the restaurant creator' do 
    before do
        bob = User.create(email: 'bob@example.com', password: '12345678', password_confirmation: '12345678')
        login_as bob
        bob.restaurants.create(name: 'Royal China', cuisine: 'Chinese')
    end
    it 'can edit restaurants' do
        visit '/restaurants'
        click_link 'Edit Royal China'
        fill_in 'Name', with: 'Royal China Queensway'
        click_button 'Update Restaurant'
        expect(page).to have_content 'Royal China Queensway'
    end
end

context 'logged in as another restaurant creator' do 

    before do
        will = User.create(email: 'will@example.com', password: '12345678', password_confirmation: '12345678')
        bob = User.create(email: 'bob@example.com', password: '12345678', password_confirmation: '12345678')
        login_as will
        bob.restaurants.create(name: 'Royal China', cuisine: 'Chinese')
    end

    it 'cannot edit restaurants' do
        visit '/restaurants'
        click_link 'Edit Royal China'
        fill_in 'Name', with: 'Royal China Queensway'
        click_button 'Update Restaurant' 
        expect(page).to have_content 'You do not have permission to edit the restaurant: Royal China'
    end
end