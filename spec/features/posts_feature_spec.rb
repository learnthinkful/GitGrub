feature 'Users creates a post', type: :feature do
  given(:post) { FactoryGirl.create(:post) }
  # let(:post) { FactoryGirl.create(:post) }
  
  scenario 'creating a post' do 
    visit '/posts/new'

    fill_in 'Place', with: 'Chipotle'
    fill_in 'Neighborhood', with: 'Fidi'
    # fill_in 'Time', with: 'Noon'
    fill_in 'Body', with: 'Join me!'

    click_button 'Save'

    expect(page).to have_content 'success'
    expect(page).to have_content 'Chipotle'
  end

  scenario 'showing a post' do 
    visit "/posts/#{post.id}"

    expect(page).to have_content post.place 
    expect(page).to have_content post.neighborhood 
    expect(page).to have_content post.time 
    expect(page).to have_content post.body  
  end

  scenario 'showing all posts' do 
    visit '/posts/new'

    fill_in 'Place', with: 'Chipotle'
    fill_in 'Neighborhood', with: 'Fidi'
    # fill_in 'Time', with: 'Noon'
    fill_in 'Body', with: 'Join me!'

    click_button 'Save'

    visit "/posts"

    expect(page).to have_content post.place 
  end

  scenario 'updating a post' do 
    visit "/posts/#{post.id}/edit"

    fill_in 'Place', with: 'new place'
    # fill_in 'Neighborhood', with: ''
    # fill_in 'Time', with: ''
    # fill_in 'Body', with: ''

    click_button 'Save'

    expect(page).to have_content 'new place'
    expect(page).not_to have_content post.place 
  end

#   scenario 'deleting a post' do
#     visit "/posts/#{post.id}"

#     click_link 'Delete'

#     expect {
#       visit "/posts/#{post.id}"
#     }.to raise_error ActiveRecord::RecordNotFound
#   end
end