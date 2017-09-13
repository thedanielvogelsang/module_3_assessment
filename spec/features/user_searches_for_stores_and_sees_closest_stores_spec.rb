require 'rails_helper'

RSpec.feature 'user searches stores by zipcode' do
  context 'and sees a page with 10 stores in area' do
    it 'successfully returns each with correct data displayed' do
      visit "/"
# And I fill in a search box with "80202" and click "search"
      zipcode = "80202"
      expect(page).to have_css('#zipcode')
      page.fill_in 'zipcode', with: zipcode
      click_on('search')
# Then my current path should be "/search" (ignoring params)
      expect(current_path).to eq('/search')
# And I should see stores within 25 miles of 80202
      expect(page).to have_content("Stores within 25 miles from #{zipcode}")
      expect(page).to have_content("17 Total Stores")
# And I should see a message that says "17 Total Stores"
      expect(page).to have_css('ul#store', :count => 10)
# And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
      first("ul#store") do
        expect(page).to have_css('.name')
        expect(page).to have_css('.city')
        expect(page).to have_css('.distance')
        expect(page).to have_css('.phone')
        expect(page).to have_css('.type')
      end
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
    end
  end
end
